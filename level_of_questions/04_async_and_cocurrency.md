## Difference between FutureBuilder and StreamBuilder

In Flutter, both FutureBuilder and StreamBuilder are specialized widgets that help you build UI
based on asynchronous data, but they differ in the type of async source they listen to.

**FutureBuilder**:

- FutureBuilder is used to handle a single async operation and rebuild UI once when it completes.
- Use case: One-time async operations like fetching data from an API, reading from a file, or
  initializing a service.

**StreamBuilder:**

- StreamBuilder is a Flutter widget that listens to a stream of data and rebuilds the UI whenever
  new data is received, making it useful for real-time updates.
- Use case: Real-time data sources like WebSockets, Firebase Firestore snapshots, or continuous
  sensor readings.

Key Takeaway,

- Use FutureBuilder when you need to handle a single async result.
- Use StreamBuilder when you need to handle multiple async events over time.

## Async vs Isolate vs Compute – Flutter Concurrency Made Simple

- Async: Runs on the main thread using a non-blocking event loop. Best for lightweight tasks like
  API calls, database operations, and file I/O.
- Isolate: Runs on a completely separate thread with its own memory. Best for heavy CPU tasks like
  image processing or large JSON parsing. Enables true parallel execution without blocking UI.
- Compute: Compute is a helper function provided by Flutter to simplify using isolates. Instead of
  manually creating and managing an isolate, we just use compute, and it handles everything
  internally.

## What's the difference between compute() and Isolate.spawn()?

- compute() is a Flutter helper that executes a single function in a background isolate, returns the
  result, and automatically terminates the isolate. It's ideal for one-time CPU-intensive tasks like
  JSON parsing.
- Isolate.spawn() is a low-level Dart API that creates an independent isolate. It stays alive until
  you terminate it and requires manual communication using SendPort and ReceivePort, making it
  suitable for long-running background workers and ongoing two-way communication.

## How does Isolate.spawn() close?

- Isolate.spawn() does not automatically terminate if it's designed to keep running. It stays alive
  until its entry function finishes or until we explicitly stop it using isolate.kill(). If we're
  using ReceivePort, we should also call receivePort.close() to clean up resources.

## `async`, `await`, `.then()`, `.whenComplete()` and `Future` in Dart

- **`async`:** Keyword used to mark a function as asynchronous, Allows use of await inside it.
- **`await`:** Waits for a Future to complete and Pauses execution until result comes.
- **`.then((value) { ... })`:** Handles result of a Future using callback and Alternative to await.
- **`.whenComplete(() { ... })`:** this code runs after future completes (success or error).
- **`Future`:** Represents a value that will be available later and Used for async operations like
  API calls, file reading.

## Future.wait vs Future.any in Dart

- Future.wait runs multiple asynchronous operations at the same time and waits until all of them are
  complete. It returns a list of results in the same order as the futures.
- Future.any runs multiple asynchronous operations at the same time and returns the result of the
  first future that completes. It does not wait for the remaining futures.

> Future.wait waits for all futures to complete and returns a list of results. Future.any returns
> the result of the first future that completes and doesn't wait for the others.

## why use future.wait instead of calling api one by one?

- I use Future.wait when multiple API calls are independent. It runs them in parallel instead of one
  by one, which reduces the total loading time and improves performance. If one API depends on
  another, I use sequential await calls instead.

## Difference between Future.sync, Future.value, and Future.microtask

- Future.value is used when I already have the result and want to return it as a Future.
- Future.sync executes a function immediately and wraps its result or exception in a Future.
- Future.microtask schedules a task in the microtask queue, so it runs before normal event queue
  tasks.

## Difference between `async` and `async*` in Dart

- async:
    - The async keyword is used to define a function that returns a Future. This is useful when you
      want to perform asynchronous operations, such as network requests or database queries, and
      then return a single result once the operation is complete.
    - It returns the result wrapped in a Future.
    - In Short: async gives you a Future.
- async*:
    - The async* keyword is used to define a function that returns a Stream. This is useful when you
      want to perform asynchronous operations that yield multiple values over time, rather than just
      a single value.
    - The results are wrapped in a Stream.
    - In Short: async* gives you a Stream.

In short, `async` is used for a single asynchronous result, while `async*` is used to generate
multiple values over time using a Stream.

## `yield` vs `yield*` in Dart

- yield:
    - The yield keyword is used inside an async* function to emit a single value to a Stream. This
      is useful when you want to produce values one by one over time.
    - It sends one value at a time to the stream.
    - In Short: yield gives you one value.

- yield*:
    - The yield* keyword is used to emit all values from another Stream or Iterable into the current
      Stream. This is useful when you want to forward multiple values without writing a loop
      manually.
    - It sends multiple values from another source to the stream.
    - In Short: yield* gives you multiple values.

In short, `yield` emits one value at a time, while `yield*` forwards all values from another stream
or iterable.

## `yield` vs `return` in Dart

- yield:
    - The yield keyword is used inside an async* function to emit a single value to a Stream. This
      is useful when you want to produce values one by one over time.
    - It does not stop the function; it can continue emitting more values.
    - In Short: yield sends values to a Stream.

- return:
    - The return keyword is used to send back a value from a function and terminate its execution.
    - It is used in normal or async functions (Future).
    - Once return is called, the function stops executing.
    - In Short: return gives you a final value and ends the function.

In short, `yield` is used to emit multiple values over time in a Stream, while `return` is used to
return a single value and end the function.

## Stream vs Future in Dart

#### **Stream**

- **Definition:** A `Stream` delivers a sequence of values (events) over time.
- stream is for multiple values over time.
- **Purpose:** Used for real-time or continuous data (e.g., chat messages, live updates).
- **Types:**
    - **Single-subscription:** Supports only one listener.
    - **Broadcast:** Supports multiple listeners.

---

#### **Future**

- **Definition:** A `Future` represents a single value that will be available in the future.
- future is for single async result.
- **Purpose:** Used for one-time asynchronous operations (e.g., API calls, file loading).
- **Features:**
    - `Future.value()` → returns a predefined value
    - `Future.error()` → returns an error
    - `.then()` → executes on success
    - `.catchError()` → executes on error

---

#### **Key Differences**

- `Stream` → Provides **multiple values over time** (continuous data)
- `Future` → Provides **a single value once** (one-time result)

---

In short, `Stream` is used for handling continuous data or events, while `Future` is used for a
single asynchronous result.

## how would you handle a stream in widget? how would you manage subscription or disposal if it's not using streambuilder.

- If I only need to display stream data in the UI, I prefer using StreamBuilder because it
  automatically listens to the stream and handles rebuilding the widget.
- If I'm not using StreamBuilder, I listen to the stream using a StreamSubscription in initState().
  Whenever new data arrives, I update the UI using setState() or my state management solution.
  Finally, I cancel the subscription in dispose() to avoid memory leaks.

## Differences between streams and sockets in Flutter?

- A Socket is a network connection between a client and a server that enables real-time, two-way
  communication. It allows the server to push data to the client without continuous polling, making
  it useful for live features like chat, notifications, and tracking systems.

- A Stream is a way to receive continuous data over time inside the app. It is used to handle a
  sequence of events such as user input, UI updates, or data coming from APIs or sockets.

One-line Interview Answer,

Stream is used to handle continuous data inside the app, while sockets are used for real-time
two-way communication between client and server over the network.

## `Future` vs `Future.microtask` in Flutter**

#### **`Future`**

- Runs **after all microtasks** are completed.
- Used for **asynchronous operations** (e.g., API calls, file reading).

```dart
void main() {
  Future(() => print('future 1'));
  Future(() => print('future 2'));
  print('main');
  // Output: main, future 1, future 2
}
```

#### **`Future.microtask`**

- Runs **before any `Future`** tasks.
- Useful for **high-priority small tasks** (e.g., state updates).

```dart
void main() {
  Future(() => print('future 1'));
  Future(() => print('future 2'));
  Future.microtask(() => print('microtask 1'));
  Future.microtask(() => print('microtask 2'));
  print('main');
  // Output: main, microtask 1, microtask 2, future 1, future 2
}
```

🚀 **Rule of Thumb:**

- Use **`Future.microtask`** for small high-priority tasks.
- Use **`Future`** for general asynchronous operations.

---

### What is `FutureOr` in Dart/Flutter?

- FutureOr = maybe async, maybe sync
- FutureOr<T> means the function can return either a value of type T or a Future<T>.

FutureOr in Dart allows a function to return either a direct value or a Future of that value, making
the function flexible for both synchronous and asynchronous results.

#### Example:

```dart
import 'dart:async';

FutureOr<int> getValue(bool async) {
  if (async) {
    return Future.value(42); // async
  }
  return 42; // sync
}

void main() async {
  print(await getValue(true)); // 42 (from Future)
  print(getValue(false)); // 42 (sync value)
}
```

## Flutter `Future` vs `Completer`

#### `Future`

- **Definition:** A `Future` represents a result that will be available in the future.
- **Usage:** Used to handle asynchronous operations like API calls or delays.
- It completes **automatically** when the async task finishes.

---

#### `Completer`

- **Definition:** A `Completer` is used to **create and control a Future manually**.
- **Usage:** Allows you to complete a Future with a value or error at any time.
- It gives **full control** over when the Future completes.

---

### 📌 Example

```dart
import 'dart:async';

void main() {
  // Future example
  Future<int> fetchData() {
    return Future.delayed(Duration(seconds: 2), () => 42);
  }

  fetchData().then((value) => print('Fetched data: $value'));

  // Completer example
  Completer<int> completer = Completer<int>();

  fetchDataWithCompleter(completer);

  completer.future.then((value) => print('Completed with completer: $value'));
}

void fetchDataWithCompleter(Completer<int> completer) {
  Future.delayed(Duration(seconds: 3), () {
    completer.complete(84);
  });
}
```

## What is an Instance?

* An **instance** is an **object** created from a **class**.
* It is used to access the **class properties** and **methods**.
* **Each instance is independent and has its own data.**

---

# Future.wait in Dart

* `Future.wait` in Dart is a way to run **multiple asynchronous operations** at the same time and
  wait until **all of them are complete**.

### Why use `Future.wait`?

* `Future.wait` is useful when you need to perform multiple asynchronous operations and proceed only
  when **all of them are complete**.

### For example:

* Loading data from multiple sources (e.g., network requests, file reads) before displaying it.
* Performing multiple database operations.

### Output

* It returns a **list of results** in the same order as the futures.
* If **any future** completes with an error, the returned future also completes with that error. If
  further futures also complete with errors, those errors are discarded.

### Example

```dart
Future<void> fetchData() async {
  List<String> results = await Future.wait([
    fetchUser(),
    fetchPosts(),
  ]);

  print(results); // ['User data loaded', 'Posts loaded']
}
```

## Callback Functions and Asynchronous Programming in Dart

- **Callback Function:**
    - A function passed as an argument to another function, to be executed later when a specific
      event or condition occurs.
    - Essential in Dart's asynchronous programming to handle tasks that complete at a later time,
      like fetching data or I/O operations.

## What is the Dart Event Loop?

Dart uses a single-threaded event loop to handle asynchronous operations without blocking execution.

It manages two main queues:

- Microtask Queue (high priority)
- Event Queue (normal async tasks)

## What is the difference between Microtask queue and Event Queue?

### Microtask Queue

* Runs **immediately after the current synchronous code**.
* All microtasks are completed **before** Dart processes the event queue.

### Examples

* `Future.microtask()`
* `scheduleMicrotask()`

``` 
Future.microtask(() {
print("Microtask");
});
```

### Event Queue

* Handles normal asynchronous events.
* Runs only after the microtask queue is empty.

### Examples

* `Future()`
* `Future.delayed()`
* `Timer`
* API calls
* User input

``` 
Future(() {
print("Event");
});
```

### Easy answer

> **"The Microtask Queue has higher priority than the Event Queue. After the current synchronous
code finishes, Dart executes all microtasks first, and only then processes the event queue.
Microtasks are used for immediate asynchronous work, while the event queue handles timers, I/O, API
calls, and user events."**

### Easy way to remember

* **Microtask Queue** → **Higher priority, runs first.**
* **Event Queue** → **Lower priority, runs after all microtasks.**

## What is Isolate in dart and how it different from async await?

- In Flutter, an Isolate is a separate thread of execution with its own memory and event loop, used
  to run heavy tasks without blocking the main UI thread.
- async/await is used for asynchronous operations like API calls, file reading, or database access.
  It doesn't create a new thread; it simply waits for the operation to complete without blocking the
  UI.

👉 Examples:

JSON parsing
Image processing
Encryption

✔ Each isolate has its own memory
✔ No shared variables (avoids race conditions)

## What is difference between Isolate and Async?

async/await:
Runs on main thread
Non-blocking but NOT parallel
Isolate:
Runs in separate thread
True parallel execution

👉 Simple rule:

Async = concurrency
Isolate = parallel processing

## What is the Event Loop execution order in Dart?

👉 Order always follows:

synchronous code
Microtask queue
Event queue

👉 Example output rule:

print() first
microtask second
future last

✔ Important for interview trick questions

## What is the difference between Future.any and Future.wait?

Future.wait:
Waits for ALL futures
Returns list of results

Future.any:
Returns FIRST completed future
Ignores rest

👉 Use case:

wait = batch loading
any = fastest response

## What causes UI jank in Flutter async code?

Heavy work on main thread blocks UI

👉 Problems:

Large JSON parsing
Complex loops
Image processing

✔ Solution:

Use Isolate / compute()
Break tasks into chunks
Use async properly

## Why does UI freeze even in async code?

- Because async does NOT mean parallel execution in Dart — it only schedules work in event loop.