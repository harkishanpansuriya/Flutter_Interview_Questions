# Concurrency and Isolates

## Isolates

* **Isolates are not threads:** In Dart, isolates are like independent mini-programs that each have
  their own memory space and event loop. They don't share any data directly; instead, they
  communicate by sending messages back and forth, typically using `SendPort` and `ReceivePort`.
* **The Main Isolate:** All Dart code starts running in a main isolate. When you launch a Flutter
  app, everything, by default, runs within this single main isolate. This keeps things simple – the
  same place handles both app logic and updating the user interface.
* **When to use separate isolates:** If you have tasks that require a lot of processing power (like
  complex calculations) you might want to consider offloading them to a separate isolate. These
  heavy tasks can cause the UI to become unresponsive - also known as "jank". Offloading them to
  another isolate allows these intensive computations to run concurrently without making the app
  feel slow, taking advantage of multi-core processors.

### Definition:
- Isolates: Independent execution units in Dart that don’t share memory, designed for safe, parallel
  task execution.
- Threads: Lightweight processes within the same application that share memory and are used for
  multitasking.

### Key Differences between Isolates and Threads (Simplified):

- **Memory Boundaries:** Isolates don’t share memory, while threads can access shared data, which
  may lead to race conditions.
- **Communication:** Isolates use messages to communicate, whereas threads directly share data,
  making isolates safer and less error-prone.
- **Parallel Execution:** Isolates run independently on multiple cores, similar to threads, but with
  stricter separation for better predictability.

## To create isolates in Dart, you can use:

* `Isolate.run`: This is the simplest way to create an isolate if you need to perform a single,
  isolated task in the background. It's ideal for short computations. It's the recommended method
  for most background processes.

```dart
// Read the file, spawn an isolate, send the file contents to the spawned
// isolate, and wait for the parsed JSON.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

const filename = 'json_01.json';

Future<void> main() async {
  // Read and parse JSON data in a new isolate,
  // then store the returned Dart representation.
  final jsonData = await Isolate.run(() => _readAndParseJson(filename));
  print('Received JSON with ${jsonData.length} keys');
}

/// Reads the contents of the file with [filename],
/// decodes the JSON, and returns the result.
Future<Map<String, dynamic>> _readAndParseJson(String filename) async {
  final fileData = await File(filename).readAsString();
  final jsonData = jsonDecode(fileData) as Map<String, dynamic>;
  return jsonData;
}

```

* `Isolate.spawn`: Use `Isolate.spawn` when you need an isolate to act as a background worker,
  handling multiple requests or messages over time. It's great for long-running processes that might
  involve multiple interactions.

```dart
// Spawn an isolate, read multiple files, send their contents to the
// spawned
// isolate, and wait for the parsed JSON.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:async/async.dart';

const filenames = [
  'json_01.json',
  'json_02.json',
  'json_03.json',
];

void main() async {
  await for (final jsonData in _sendAndReceive(filenames)) {
    print('Received JSON with ${jsonData.length} keys');
  }
}

// Spawns an isolate and asynchronously sends a list of filenames for it to
// read and decode. Waits for the response containing the decoded JSON
// before sending the next.
//
// Returns a stream that emits the JSON-decoded contents of each file.
Stream<Map<String, dynamic>> _sendAndReceive(List<String> filenames) async* {
  final p = ReceivePort();
  await Isolate.spawn(_readAndParseJsonService, p.sendPort);

  // Convert the ReceivePort into a StreamQueue to receive messages from
  // the
  // spawned isolate using a pull-based interface. Events are stored in
  // this
  // queue until they are accessed by `events.next`.
  final events = StreamQueue<dynamic>(p);

  // The first message from the spawned isolate is a SendPort. This port is
  // used to communicate with the spawned isolate.
  SendPort sendPort = await events.next;

  for (var filename in filenames) {
    // Send the next filename to be read and parsed
    sendPort.send(filename);

    // Receive the parsed JSON
    Map<String, dynamic> message = await events.next;

    // Add the result to the stream returned by this async* function.
    yield message;
  }

  // Send a signal to the spawned isolate indicating that it should exit.
  sendPort.send(null);

  // Dispose the StreamQueue.
  await events.cancel();
}


// The entrypoint that runs on the spawned isolate. Receives messages from
// the main isolate, reads the contents of the file, decodes the JSON, and
// sends the result back to the main isolate.
Future<void> _readAndParseJsonService(SendPort p) async {
  print('Spawned isolate started.');
  // Send a SendPort to the main isolate so that it can send JSON strings
  // to
  // this isolate.
  final commandPort = ReceivePort();
  p.send(commandPort.sendPort);
  // Wait for messages from the main isolate.
  await for (final message in commandPort) {
    if (message is String) {
      // Read and decode the file.
      final contents = await File(message).readAsString();
      // Send the result to the main isolate.
      p.send(jsonDecode(contents));
    } else if (message == null) {
      // Exit if the main isolate sends a null message, indicating there
      // are no
      // more files to read and parse.
      break;
    }
  }
  print('Spawned isolate finished.');
  Isolate.exit();
}
```

* `compute`: If you're working with Flutter, you can use the `compute` function to run a function in
  a separate isolate. This is a convenient way to offload work from the main thread without dealing
  with isolates directly.

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(),
          ElevatedButton(
            child: Text('start'),
            onPressed: () async {
              // final sum = computationallyExpensiveTask(1000000000);
              final sum = await compute(computationallyExpensiveTask, 1000000000);
              print(sum);
            },
          )
        ],
      ),
    );
  }
}


int computationallyExpensiveTask(int value) {
  var sum = 0;
  for (var i = 0; i <= value; i++) {
    sum += i;
  }
  print('finished');
  return sum;
}
```

## When Should You Use Isolates?

There aren't strict rules, but isolates are particularly helpful in these scenarios:

* **Heavy JSON Processing:** Parsing and decoding large JSON data.
* **Media Handling:** Processing and compressing images, audio, and video files.
* **Media Conversion:** Converting audio and video formats.
* **Complex Data Operations:** Performing intricate searches and filtering on large datasets or
  within file systems.
* **Intensive I/O:** Communicating with databases or handling large amounts of network requests.

## Concurrency

In Dart, concurrency, which is managing multiple tasks at once, can be achieved using different
techniques:

* **The Event Loop:** This is Dart's core mechanism for managing asynchronous tasks. It keeps track
  of events and decides which piece of code to execute at any given moment.
* **Asynchronous Programming:** Dart uses futures, `async`/`await` syntax and streams to make
  non-blocking asynchronous calls. This lets your app handle other work while waiting for operations
  like network requests or file I/O to complete.
* **Isolates:** As discussed previously, isolates provide a way to execute code in parallel.
* **Web Concurrency:** Dart also has specific mechanisms for handling concurrency in web
  applications, though this document focuses more on general Dart concepts.

### Event loop:

Dart's runtime is built around the event loop. This loop is constantly running, waiting for events
to happen in your application. An "event" could be a user tap, a timer expiring, a response from a
network call, or even a system event.

```
    Event queue
Events --> 4. Repaint --> 3. Repaint --> 2. Process tap --> 1. Repaint --> Event loop (cycle)
```

Event Queue: All these events are added to a queue. The event loop processes events one by one, in
the order they arrive.

How the Event Loop Works:

```
while (eventQueue.waitForEvent()) {
  eventQueue.processNextEvent();
}
```

The code above represents the basic concept of the event loop. It continues to loop while your app
is running.

The event loop is single-threaded in nature, so it processes one event at a time.

**Asynchronous APIs:** Most Dart applications need to do more than one thing at once. This is
handled with asynchronous APIs (like Futures and Streams). They tell the event loop to do something
and to then notify you later when its done. This lets your app do other things without waiting.

**Example with a network request:**

```
http.get('https://example.com').then((response) {
  if (response.statusCode == 200) {
    print('Success!');
  }
});
```

When this code reaches the event loop, it immediately calls the first clause, `http.get`, and
returns a Future. It also tells the event loop to hold onto the callback in the `then()` clause
until the HTTP request resolves. When that happens, it should execute that callback, passing the
result of the request as an argument.

This same model is generally how the event loop handles all other asynchronous events in Dart, such
as Stream objects.

### Asynchronous programming:

This section summarizes the different types and syntaxes of asynchronous programming in Dart. If
you're already familiar with Future, Stream, and async-await

### Isolates:

(Covered in detail above).

## Questions and Answers

Certainly! Here are the expanded versions of the previous tables with additional questions for each
topic. You can copy and paste these into your Google Doc.

### 1. Isolates vs Threads

| Question                                                                         | Answer                                                                                                                              |
|:---------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------|
| What's the difference between isolates and threads in Dart?                      | Isolates are independent units of execution with their own memory, whereas threads share memory, which can lead to race conditions. |
| How do isolates handle memory compared to threads?                               | Isolates do not share memory, preventing race conditions, while threads share memory space, making synchronization necessary.       |
| Are isolates or threads better for concurrent programming in Dart?               | Isolates are better because they don't share memory, reducing synchronization issues.                                               |
| Can isolates and threads share memory in Dart?                                   | No, isolates cannot directly share memory, while threads can.                                                                       |
| Which one should I use when I need to handle long-running operations in Flutter? | Use isolates for long-running tasks to keep the UI thread responsive.                                                               |
| Can isolates in Dart be used to run tasks in the background?                     | Yes, isolates can offload long-running tasks from the main thread to run in the background.                                         |
| How do you manage synchronization between threads in Dart?                       | Threads require explicit synchronization using tools like locks or semaphores to prevent race conditions.                           |
| Can threads or isolates handle tasks asynchronously?                             | Both threads and isolates can handle tasks asynchronously, but isolates are more suitable for parallel execution.                   |
| What happens if you use a thread for UI-related tasks?                           | If you use a thread for UI tasks, it will block the main thread, causing the UI to freeze or lag.                                   |

### 2. Concurrency vs Parallelism

| Question                                                                        | Answer                                                                                                                                                                                |
|:--------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| What's the difference between concurrency and parallelism?                      | Concurrency involves managing multiple tasks at once, but they don't need to run simultaneously. Parallelism involves tasks running simultaneously, typically on different CPU cores. |
| Is concurrency about running tasks at the same time or just interleaving tasks? | Concurrency is about interleaving tasks in time, not necessarily executing them simultaneously.                                                                                       |
| Does parallelism always require multiple cores or processors?                   | Yes, parallelism usually requires multiple cores/processors to run tasks simultaneously.                                                                                              |
| Can Dart achieve concurrency without parallelism?                               | Yes, Dart can achieve concurrency through asynchronous programming, where tasks run concurrently but not in parallel.                                                                 |
| Is parallelism always faster than concurrency?                                  | Not necessarily, as parallelism may require more resources, and some tasks might not benefit from running simultaneously.                                                             |
| Does Dart use parallelism for all asynchronous tasks?                           | No, Dart uses concurrency, where tasks can be executed concurrently, but not necessarily in parallel.                                                                                 |
| How does concurrency improve performance in Dart applications?                  | Concurrency allows the application to perform multiple tasks without waiting for each task to finish, making the app more responsive.                                                 |
| Can Dart achieve both concurrency and parallelism simultaneously?               | Yes, Dart can achieve concurrency with async/await and parallelism with isolates.                                                                                                     |
| Does parallelism require splitting the task into smaller parts?                 | Yes, for parallelism to be effective, tasks are often split into smaller parts that can run on different cores.                                                                       |

While concurrency and parallelism are often used interchangeably, they are distinct concepts:

**Concurrency** involves multiple tasks making progress at the same time. It's about dealing with
many things at once by interleaving the execution of tasks. Concurrency is typically achieved
through techniques like multi-threading, asynchronous programming, and event loops.

**Parallelism** involves tasks actually running at the same time, typically on multiple processors
or cores. It's about doing many things at once. Parallelism requires hardware support and is often
used in scenarios where performance gains are needed by executing multiple computations
simultaneously.

In simpler terms, concurrency is more about task management and efficient use of time, while
parallelism is about maximizing the use of hardware resources.

```
 CONCURRENCY                                PARALLELISM
        
  Process1    Process1
    \            /
    Process2    Process2
    
      VS 
```

### 3. Race Condition vs Deadlock

| Question                                                          | Answer                                                                                                                                         |
|:------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------|
| What's the difference between a race condition and a deadlock?    | A race condition occurs when two tasks modify shared data at the same time. A deadlock occurs when two tasks wait for each other indefinitely. |
| How can a race condition affect the result of a program?          | It can lead to unpredictable results, such as inconsistent data, because the outcome depends on the order of execution.                        |
| What causes a deadlock and how does it affect program execution?  | A deadlock occurs when tasks wait for resources held by each other, blocking progress.                                                         |
| How do you prevent a race condition in Dart?                      | You can use `locks`, `atomic operations`, or `isolates` to prevent race conditions.                                                            |
| How do you prevent a deadlock in Dart?                            | Ensure tasks acquire resources in a consistent order, or use timeouts to avoid indefinite waits.                                               |
| Can a race condition occur in asynchronous Dart code?             | Yes, race conditions can occur in asynchronous code when multiple tasks access shared resources simultaneously.                                |
| What programming constructs help prevent race conditions in Dart? | `Locks`, `mutexes`, and `isolates` can help avoid race conditions in Dart.                                                                     |
| What's the impact of a deadlock on performance?                   | A deadlock can cause the application to freeze or become unresponsive as tasks cannot proceed.                                                 |
| How do you detect a deadlock in Dart?                             | Use tools like `timeouts` or `logging` to detect where tasks are waiting for each other.                                                       |

### 4. Synchronous vs Asynchronous Programming

| Question                                                                            | Answer                                                                                                                                                 |
|:------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
| What's the difference between synchronous and asynchronous execution in Dart?       | Synchronous execution blocks other tasks until one task completes. Asynchronous execution allows other tasks to run while waiting for one to complete. |
| How does `async/await` in Dart help achieve concurrency?                            | `Async/await` allows tasks to run without blocking the main thread, allowing other tasks to run concurrently.                                          |
| When should you use synchronous programming vs asynchronous programming in Flutter? | Use `synchronous` for short, blocking tasks. Use `asynchronous` for I/O-bound tasks, such as network requests or file reading.                         |
| Can Dart run synchronous tasks concurrently?                                        | No, synchronous tasks run one after the other. Asynchronous tasks can run concurrently.                                                                |
| What happens when you call `await` in an asynchronous function?                     | The function pauses execution and yields control, allowing other tasks to run until the awaited operation completes.                                   |
| How do synchronous tasks affect the UI thread in Flutter?                           | Synchronous tasks block the UI thread, leading to UI freezes or lags, especially for long-running operations.                                          |
| Can you mix synchronous and asynchronous operations in Dart?                        | Yes, you can mix synchronous and asynchronous operations, but care should be taken to manage concurrency.                                              |
| How does Dart handle async functions that don't return a value?                     | Dart uses `Future<void>` for async functions that do not return a value, allowing them to run asynchronously.                                          |
| How can you handle errors in asynchronous code in Dart?                             | You can use `try-catch` blocks or handle errors using `Future.catchError` for asynchronous operations.                                                 |

### 5. Threads vs Isolates for Parallel Execution in Dart

| Question                                                                       | Answer                                                                                                                   |
|:-------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------|
| When should you use isolates in Dart instead of threads?                       | Use isolates for parallel execution because they don't share memory, which avoids issues like race conditions.           |
| What's the advantage of using isolates for parallel execution in Flutter apps? | Isolates provide parallelism without memory-sharing problems, making them safer and easier to use.                       |
| How do isolates avoid race conditions compared to threads?                     | Isolates have separate memory, so there's no need for synchronization to avoid race conditions.                          |
| Can isolates in Dart communicate with each other?                              | Yes, isolates can communicate using `ports` and `messages`, but they cannot directly share memory.                       |
| Which is better for managing parallel execution in Dart: threads or isolates?  | Isolates are better for managing parallel execution in Dart due to their isolated memory and safer design.               |
| Can you spawn multiple isolates in Dart?                                       | Yes, Dart allows you to spawn multiple isolates for parallel execution.                                                  |
| Are isolates and threads managed by the same Dart runtime?                     | No, isolates are managed by Dart's own runtime system, while threads are part of the operating system's threading model. |
| How does Dart manage the scheduling of isolates?                               | Dart schedules isolates based on their execution and communication with the main thread or other isolates.               |
| How do isolates interact with UI elements in Flutter?                          | Isolates cannot directly update the UI; they communicate with the main thread to send updates.                           |

### 6. Isolate Communication vs Thread Communication

| Question                                                                            | Answer                                                                                                                   |
|:------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------|
| How do isolates communicate with each other?                                        | Isolates communicate via `send` and `receive ports`, exchanging messages.                                                |
| How is communication between threads different from communication between isolates? | Threads can share memory directly, while isolates can only communicate by passing messages through ports.                |
| Can isolates send and receive data directly?                                        | No, isolates cannot share memory; they send messages via ports.                                                          |
| What is the mechanism of communication between isolates in Dart?                    | Communication happens via message passing using `SendPort` and `ReceivePort`.                                            |
| How do thread communication mechanisms differ from those in isolates?               | Thread communication can use shared memory and synchronization, while isolate communication is based on message passing. |
| Can you have one-way communication between isolates?                                | Yes, one-way communication is possible using a single `SendPort` and `ReceivePort`.                                      |
| Can isolates communicate with the main thread?                                      | Yes, isolates can communicate with the main thread through `ports`.                                                      |
| How is data passed between threads?                                                 | Data between threads is typically passed using shared memory or synchronization primitives like `mutexes`.               |
| How do you handle exceptions in isolate communication?                              | Use `try-catch` blocks within the isolate to catch exceptions and send error messages to the main thread.                |

### 7. Managing Long-Running Tasks

| Question                                                                                       | Answer                                                                                                            |
|:-----------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------|
| How do you manage long-running tasks in Flutter to keep the UI responsive?                     | Use `isolates` for time-consuming tasks to offload them from the main thread, ensuring the UI remains responsive. |
| Is it better to use isolates or background threads for managing long-running tasks in Flutter? | `Isolates` are better in Flutter because they are independent and avoid memory-sharing issues.                    |
| How does Dart handle background tasks in Flutter without blocking the main thread?             | Dart uses isolates for background tasks, enabling parallel execution without blocking the main thread.            |
| How do isolates help manage performance with long-running tasks?                               | Isolates offload computation from the main thread, preventing UI freezing and improving performance.              |
| How does Flutter handle asynchronous operations to avoid blocking the UI?                      | Flutter uses `async` and `await` to handle I/O operations without blocking the UI thread.                         |

### 8. Deadlock vs Race Condition Prevention

| Question                                                                                              | Answer                                                                                                               |
|:------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------|
| What strategies can prevent deadlocks when working with resources in Dart?                            | Use consistent lock ordering, timeouts, and avoid circular dependencies when locking resources.                      |
| How do you avoid race conditions in Flutter apps?                                                     | Use `locks`, `atomic operations`, or `isolates` to ensure thread-safe operations.                                    |
| What's the best approach to handle concurrency in Dart to prevent both race conditions and deadlocks? | Use `isolates` to avoid shared memory issues, and implement consistent locking and timeouts for resource management. |
| How does proper error handling help prevent deadlocks?                                                | By detecting and recovering from errors promptly, you can prevent tasks from waiting indefinitely.                   |
| Can you use Dart's `Future` to handle race conditions?                                                | Yes, Dart's `Future` can help with asynchronous programming, but you need synchronization for shared resources.      |

### 9. Asynchronous Programming with Threads vs Isolates

| Question                                                                   | Answer                                                                                                                        |
|:---------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------|
| Can you use asynchronous programming with threads in Dart?                 | Yes, threads can run asynchronous tasks, but memory synchronization between threads is needed.                                |
| Can isolates handle asynchronous operations?                               | Yes, isolates can handle asynchronous tasks independently of the main thread.                                                 |
| How does `async/await` interact with isolates and threads in Dart?         | `Async/await` is used within isolates or threads for non-blocking operations, making them easier to work with asynchronously. |
| Which is better for managing async tasks in parallel: isolates or threads? | `Isolates` are better for handling async tasks in parallel since they don't share memory, making them safer.                  |
| Can you perform asynchronous operations inside an isolate?                 | Yes, isolates can perform asynchronous operations while remaining independent of the main thread.                             |

### 10. Performance Considerations (Isolates vs Threads)

| Question                                                                              | Answer                                                                                                                                                        |
|:--------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Which approach is more efficient in Dart for parallel execution: threads or isolates? | Isolates are more efficient in Dart for parallel execution because they don't share memory and are designed for parallelism.                                  |
| When should you use isolates in Flutter for better performance?                       | Use isolates for computationally expensive tasks or tasks that require parallelism to avoid blocking the UI thread.                                           |
| What are the performance trade-offs between using isolates and threads in Dart?       | Isolates are safer and simpler for parallelism, but they require more memory overhead. Threads are more memory-efficient but require complex synchronization. |
| Can isolates handle multiple asynchronous tasks simultaneously?                       | Yes, isolates can run multiple asynchronous tasks independently of the main thread.                                                                           |
| How does Dart ensure isolates don't negatively impact performance?                    | Dart ensures isolates are lightweight and don't share memory, so they don't compete for resources, ensuring better performance.                               |

## Comparison:

Here's a detailed comparison table for **Isolates**, **Threads**, **Concurrency**, **Parallelism**,
**Race Conditions**, and **Deadlocks** tailored for Dart/Flutter and general programming concepts:

### 1. Isolates vs Threads

| Feature           | Isolates (Dart)                               | Threads (Other Languages)                           |
|:------------------|:----------------------------------------------|:----------------------------------------------------|
| Memory Sharing    | No shared memory (isolated memory space).     | Shared memory across threads.                       |
| Communication     | Message passing using ports.                  | Direct access to shared memory.                     |
| Concurrency Model | Event loop in each isolate.                   | Synchronized using locks, semaphores, etc.          |
| Ease of Use       | Easier to avoid bugs (e.g., race conditions). | Prone to issues like race conditions and deadlocks. |
| Performance       | More overhead for message passing.            | Faster communication through shared memory.         |
| Use Case          | CPU-heavy tasks like image processing.        | Tasks needing fine-grained memory sharing.          |

### 2. Concurrency vs Parallelism

| Feature    | Concurrency                                          | Parallelism                                     |
|:-----------|:-----------------------------------------------------|:------------------------------------------------|
| Definition | Managing multiple tasks simultaneously.              | Executing multiple tasks at the same time.      |
| Execution  | Tasks overlap but don't necessarily run in parallel. | Tasks run simultaneously on multiple cores.     |
| Focus      | Efficient task management.                           | Speeding up computation.                        |
| Use Case   | I/O-bound tasks like network calls.                  | CPU-bound tasks like mathematical computations. |

### 3. Race Condition vs Deadlock

| Feature      | Race Condition                                                                         | Deadlock                                                                             |
|:-------------|:---------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------|
| Definition   | Two or more tasks access shared data simultaneously, leading to unpredictable results. | Two or more tasks wait for each other to release resources, causing a system freeze. |
| Cause        | Lack of synchronization when accessing shared data.                                    | Circular dependency on resources.                                                    |
| Result       | Unpredictable behavior or incorrect output.                                            | Complete system freeze or indefinite waiting.                                        |
| Detection    | Difficult to detect without testing.                                                   | Can be detected using dependency graphs.                                             |
| Prevention   | Avoid shared state or use synchronization (e.g., locks).                               | Use consistent locking order or timeouts.                                            |
| Dart Example | Race condition is avoided by isolates since they don't share memory.                   | Deadlock is rare in Dart but can occur in poorly implemented synchronization.        |

### 4. Isolates vs Concurrency in Dart

| Feature        | Isolates                                          | Concurrency In Dart                                           |
|:---------------|:--------------------------------------------------|:--------------------------------------------------------------|
| Scope          | Runs code in a separate memory space.             | Handles multiple tasks in a single isolate using async/await. |
| Memory Sharing | No memory sharing; uses message passing.          | Tasks share the same memory space.                            |
| Use Case       | CPU-heavy tasks like file parsing or computation. | I/O-bound tasks like fetching data from an API.               |
| Example        | `Isolate.spawn()` for parallelism.                | `Future` and `async/await` for concurrency.                   |

### 5. Concurrency vs Asynchronous Programming

| Feature         | Concurrency                                        | Asynchronous Programming                                               |
|:----------------|:---------------------------------------------------|:-----------------------------------------------------------------------|
| Definition      | Managing multiple tasks simultaneously.            | Non-blocking execution of tasks.                                       |
| Execution       | Can involve multitasking or multi-threading.       | Single-threaded with event loop handling tasks.                        |
| Example in Dart | Using isolates or async tasks to run concurrently. | Using `Future` and `async/await` to wait for results without blocking. |

### 6. Parallelism vs Multithreading

| Feature        | Parallelism                                   | Multithreading                                  |
|:---------------|:----------------------------------------------|:------------------------------------------------|
| Definition     | Running tasks on multiple processors/cores.   | Running multiple threads in the same process.   |
| Memory Sharing | Each task may or may not share memory.        | Threads share the same memory space.            |
| Dart Support   | Supported via isolates.                       | Not directly supported in Dart.                 |
| Performance    | Higher throughput with independent resources. | Can lead to contention due to shared resources. |



