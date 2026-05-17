## What are the different ways to declare variables in Dart?
- using var, dynamic, final, const, late and explicit types.

## What are the built-in data types available in Dart?
- Dart provides built-in data types such as `int`, `double`, `String`, `bool`, `List`, `Set`, `Map`, `Runes`, `Symbol`, and `null` for storing and managing different kinds of data.

## `as` vs `is` in Dart

🔹 **`as` (Type Casting)** → Converts an object from one type to another.  
✅ Use when **you’re sure** the object is of that type.

```
var obj = 'Hello';
String str = obj as String; // Safe because obj is a String
```

🔹 **`is` (Type Checking)** → Checks if an object is of a certain type.  
✅ Returns `true` or `false`.

```
var obj = 'Hello';
if (obj is String) {
  print('obj is a String'); // ✅ True
}
```  

🚀 **Rule of Thumb:**

- Use **`is`** to **check** before casting.
- Use **`as`** when **you’re sure** of the type.

## `var` vs `dynamic` vs `final` in Dart

- dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
- var: can't change TYPE of the variable, but can change VALUE of the variable later in code.
- final: can't change TYPE of the variable, & can't change VALUE of the variable later in code.

```dart
dynamic v = 123;   // v is of type int.
v = 456;           // changing value of v from 123 to 456.
v = 'abc';         // changing type of v from int to String.

var v = 123;       // v is of type int.
v = 456;           // changing value of v from 123 to 456.
v = 'abc';         // ERROR: can't change type of v from int to String.

final v = 123;       // v is of type int.
v = 456;           // ERROR: can't change value of v from 123 to 456.
v = 'abc';         // ERROR: can't change type of v from int to String.
```

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
- **Definition:**  
  `FutureOr<T>` is a type that **can hold either a value of type `T` or a `Future<T>`**.

- **Use case:**  
  Useful when a function might **return immediately** (synchronously) or **return later** (
  asynchronously) without creating two different function signatures.

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

## Queue in Dart

- **Definition:** A `Queue` is a collection that follows the **FIFO (First In, First Out)** principle.
- Elements are added at the **end** and removed from the **front**.
- It is available in `dart:collection`.

---

### 📌 When to use
- When you need to process items in **order**
- Task scheduling (e.g., handling API calls one by one)
- Buffering data or events
- Breadth-first search (BFS) algorithms

---

### 📌 Example

```dart
import 'dart:collection';

void main() {
  Queue<int> queue = Queue();

  queue.add(1);
  queue.add(2);
  queue.add(3);

  print(queue.removeFirst()); // 1
  print(queue.removeFirst()); // 2
```

In short, a Queue in Dart is used to process data in order (FIFO), where elements are added at the end and removed from the front.

## Dart – Standard Input and Output

### Input

In Dart, you can take standard input from the user via the `stdin.readLineSync()` function. You need
to import the `dart:io` library.

```dart
import 'dart:io';

void main() {
  print("Enter your name:");
  String? name = stdin.readLineSync();
  print("Hello, $name!");
}
```

### Output

Use the `print` statement or `stdout.write()` method to display output in the console.

```dart
void main() {
  // Printing using print statement
  print("Welcome!");

  // Printing using stdout.write
  stdout.write("Welcome again!");
}
```

## What is the `late` keyword used for?

The `late` keyword in Dart is used to declare a non-nullable variable that will be initialized
later. It supports lazy initialization of variables and throws a `LateInitializationError` if the
variable is used before being initialized.

```dart
late String description;

void main() {
  description = "This is a late variable";
  print(description);
}
```

## How do you handle null safety in Dart?

- In Dart, null safety is handled by using non-nullable types by default, adding ? for nullable
  types, and using the ! operator to assert non-null values. You also use null-aware operators
  like ?., ??, and ??= to safely work with nullable variables.

## What is Generic in Dart?

Generics in Dart allow you to create reusable functions, classes, and types that can work with
multiple data types, while still providing type safety.

```dart
class Dropdown<T> {
  final List<T> items;

  Dropdown(this.items);
}

// Using the generic class
void main() {
  Dropdown<String> stringDropdown = Dropdown(['Apple', 'Banana', 'Cherry']);
  Dropdown<int> intDropdown = Dropdown([1, 2, 3, 4, 5]);
}
```

Generics ensure that you cannot add a string to an `intDropdown` or vice versa, providing type
safety and reusability.

## Dart Compilation Modes: AOT vs JIT

#### **AOT (Ahead-Of-Time)**

- **Definition:** Code is compiled **before execution** into native machine code.
- **Usage:** Used in **release mode** for better performance.
- Provides **fast startup** and optimized performance.
- No support for hot reload.

---

#### **JIT (Just-In-Time)**

- **Definition:** Code is compiled **during execution**.
- **Usage:** Used in **debug mode** for development.
- Supports **hot reload** for fast iteration.
- Slightly slower performance compared to AOT.

---

### 🔑 Key Differences

- `AOT` → Compiled before run, fast performance, used in release  
- `JIT` → Compiled during run, supports hot reload, used in debug  

---

### 🎯 In short
AOT is used for production with high performance, while JIT is used during development for fast coding and hot reload.

## Interface in Dart

- **Definition:** In Dart, an interface is a **class used as a contract** that defines what methods a class must implement.
- Dart does not have a separate `interface` keyword.
- Every class in Dart can act as an **interface**.

---

### 📌 How to use
- Use the `implements` keyword to implement an interface.
- The class must **override all methods and properties**.

---

### 📌 Example

```dart
abstract class Animal {
  void eat();
}

class Dog implements Animal {
  @override
  void eat() {
    print("Dog is eating");
  }
}
```

## What is an Extension?

An **extension** allows you to **add new methods** to existing classes **without modifying** their
original code.

🔹 Useful for adding functionality to built-in types (e.g., `String`, `List`).  
🔹 Helps keep code **clean** and **organized**.

**Example:**

```dart
extension StringExtension on String {
  String get capitalizeFirst => '${this[0].toUpperCase()}${substring(1)}';
}

void main() {
  print('hello'.capitalizeFirst); // Output: Hello
}

## What is a List?

- **Definition:** A collection of objects that can include duplicates and maintains order.

## What is a HashMap?

- **Definition:** An unordered collection of key-value pairs based on a hashtable. Keys must be
  unique objects.
- In summary, a HashMap is an efficient, unordered collection in Dart that allows for quick access
  to values using unique keys, making it ideal for many use cases where fast lookups are required.

## What is a Set?

- **Definition:** A collection of unique elements; no duplicates allowed.

## What is an Iterable?

- **Definition:** A collection of elements that can be accessed sequentially.
- **Usage:** Abstract class; can be instantiated by creating a List or Set.

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

## What is an Instance?

✅ **Definition:** An **instance** is an object created from a class.  
✅ **Usage:** Holds **its own state & behavior** based on class properties & methods.

### **📌 Example**

```dart
class Car {
  String model;

  Car(this.model); // Constructor

  void showModel() {
    print('Car model: $model');
  }
}

void main() {
  Car myCar = Car('Tesla'); // Creating an instance
  myCar.showModel(); // Output: Car model: Tesla
}
```

**Each instance is independent with its own data.**

## What is `internal` in Dart?

- Dart does not have an internal keyword. 
- Instead, Dart uses library-level privacy using _ (underscore) to restrict access within a file (library).

## `extends` vs `implements` vs `with` in Dart

- `extends (Inheritance)`:
  - **Definition:** `extends` is used to create a child class that inherits properties and methods from a parent class.
  - It allows code reuse, as the child class gets all the features of the parent class.
  - The child class can override methods to provide its own implementation.

  In short, `extends` is used for inheritance, allowing a child class to reuse and override properties and methods of a parent class.

---

- `implements (Contract)`:
  - **Definition:** `implements` is used when a class needs to follow the structure (contract) of another class.
  - It does not inherit any implementation from the parent class.
  - The class must provide its own implementation for all methods and properties.

  In short, `implements` ensures that a class follows a contract by defining all required methods without inheriting code.

---

- `with (Mixins)`:
  - **Definition:** `with` is used to apply mixins to a class for code reuse.
  - It allows a class to use methods and properties from multiple mixins.
  - It helps in adding additional functionality without using inheritance.

  In short, `with` is used to reuse code and add extra features to a class using mixins.

## Is `main()` Static or Dynamic?

- **Answer:** `main()` behaves like a **static function** in Dart.
- **Reason:** It is the **entry point** of a Dart program and is called by the Dart runtime to start execution.
- It does not require an object or class instance to run.

---
In short, `main()` is not explicitly marked as static, but it behaves like a static function because it runs without needing an object.

---

## Constructor & Types in Dart

> A **constructor** is a special method used to **create and initialize an object**.

---

### Types of Constructors in Dart

#### 1. 🔹 Default Constructor

* Automatically created if not defined

```dart id="c1"
class Person {
  String name = "Unknown";
}

void main() {
  var p = Person();
}
```

---

#### 2. 🔹 Parameterized Constructor

* Takes values while creating object

```dart id="c2"
class Person {
  String name;

  Person(this.name);
}
```

---

#### 3. 🔹 Named Constructor

* Multiple constructors with different names

```dart id="c3"
class Person {
  String name;

  Person(this.name);

  Person.guest() : name = "Guest";
}
```

---

#### 4. 🔹 Constant Constructor

* Creates compile-time constant object

```dart id="c4"
class Person {
  final String name;

  const Person(this.name);
}
```

---

### 5. 🔹 Factory Constructor

* Controls object creation (can return existing object)

```dart id="c5"
class Logger {
  factory Logger() {
    return Logger._internal();
  }

  Logger._internal();
}
```

---

## One-line (Interview Ready)

> A constructor is used to initialize objects in Dart, and types include default, parameterized, named, constant, and factory constructors.


## What is `fromJson` and `toJson`?

#### `fromJson` and `toJson` in Dart

- **`fromJson`:** Method used to convert JSON (text) into Dart objects.
- **`toJson`:** Method used to convert Dart objects into JSON (text).

## What is a Factory?

- A factory constructor is used to control object creation.
- It may return an existing object or a new one, instead of always creating a new instance.

---

### **📌 Example: Singleton Pattern**

```dart
class Singleton {
  static Singleton? _instance;

  // ✅ Factory constructor ensures only one instance
  factory Singleton() {
    _instance ??= Singleton._internal();
    return _instance!;
  }

  Singleton._internal();
}

void main() {
  Singleton singleton1 = Singleton();
  Singleton singleton2 = Singleton();

  print(identical(singleton1, singleton2)); // Output: true
}
```

##  Override vs Overloading in Dart

### **✅ Override**

📌 **Definition:** A subclass replaces a method from its superclass with a new implementation.  
📌 **Usage:** Used to modify or extend inherited behavior.

```dart
class Parent {
  void greet() {
    print('Hello from Parent');
  }
}

class Child extends Parent {
  @override
  void greet() {
    print('Hello from Child');
  }
}

void main() {
  Child child = Child();
  child.greet(); // Output: Hello from Child
}
```

---

### **❌ Overloading (Not Supported in Dart)**

📌 **Definition:** Method overloading (same method name with different parameters) is **not allowed**
in Dart.  
📌 **Alternative:** Dart uses **optional and named parameters** to achieve similar functionality.

```dart
class Calculator {
  int add(int a, [int? b]) {
    return b != null ? a + b : a;
  }
}

void main() {
  Calculator calc = Calculator();
  print(calc.add(5)); // Output: 5
  print(calc.add(5, 10)); // Output: 15
}
```

📌 **Key Takeaways:**  
✅ **Override** allows modifying superclass methods.  
❌ **Overloading** is **not supported**, but **optional/named parameters** provide flexibility.

## What is `super` in Dart?

- super is used to access properties and methods of the parent (base) class.

```dart
class Animal {
  String type = "Animal";
}

class Dog extends Animal {
  void printType() {
    print(super.type);
  }
}
```

## What is a Typedef in Dart?

- Typedef is used to create a custom name for a type (usually a function) to make code simpler.
- This can be super useful when you’re dealing with complex function signatures or when you want to make your code more expressive.

### Example

```dart
typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}
```

In this example, `typedef` `Compare<T>` is defined as a function type that takes two parameters of
type `T` and returns an `int`. It simplifies the use of the `sort` function in the `List.sort()`
method.

## What are Anonymous Functions?

- Anonymous functions (also called lambdas or closures) are functions in Dart that do not have a name. Since Dart treats functions as first-class objects, they can be assigned to variables, passed as arguments, or returned from other functions.

### Example

```dart
void main() {
  // Using an anonymous function
  var addNumbers = (int a, int b) {
    return a + b;
  };

  // Calling the anonymous function
  print(addNumbers(3, 7)); // Output: 10
}
```

In this example, `addNumbers` is an anonymous function that adds two numbers. It's defined and used
right where it's needed.

## Constant Constructor in Dart

- A constant constructor in Dart allows you to create compile-time constant objects, meaning the object's value is determined at compile time rather than at runtime. This improves performance and memory usage by reusing instances when possible.

## Sealed Class

- A sealed class prevents it from being extended, implemented, or mixed in outside its own library.
- All subclasses must be defined within the same library or file.
- Sealed classes are implicitly abstract, so they cannot be instantiated directly.

A sealed class restricts inheritance to a fixed set of subclasses, which must be declared in the same file.

## Immutable vs Mutable Class

- **Immutable Class:** 
  - An immutable class is a class whose objects cannot be changed after creation.
  - Once created → data stays the same
  - All fields are final, no setters, value set only via constructor.
- **Mutable Class:** 
  - A mutable class allows its object data to change after creation
  - Fields are not final, Has setters or direct modification.

Immutable classes cannot be modified after creation, while mutable classes allow changes to their data after the object is created.

## What is an Event Loop?

- Event Loop:
    - A mechanism that continuously checks for tasks (events) in a queue and executes them one by
      one.
    - Used to handle asynchronous operations without blocking the main thread.

“In Dart, the event loop works using the event queue and microtask queue, where asynchronous tasks (
Future, async/await) are scheduled and executed sequentially without blocking the main thread.”

---

## What are Collections?

- In Dart, a collection is an ordered group of items
- **Collections** in Dart are used to store and manage multiple values in a single variable. Dart
  provides several collection types, each with its own characteristics and use cases. The main
  collection types in Dart include:
    - **List:** An ordered collection of elements that allows duplicates.
    - **Set:** An unordered collection of unique elements.
    - **Map:** A collection of key-value pairs where each key is unique.
    - **Queue:** A collection that allows adding and removing elements from both ends.
    - **Runes:** A collection of Unicode code points representing characters.

## What are the similarities and differences between extension, mixin, and abstract class?

Extension, mixin, and abstract class all promote code reuse but they differ in how they add or share
behavior.

#### **Differences:**

| Feature                  | **Extension**                                                                            | **Mixin**                                                               | **Abstract Class**                                                                             |
|--------------------------|------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| **Purpose**              | Adds new functionality to an existing class without modifying it directly.               | Allows multiple classes to share common functionality.                  | Provides a blueprint for other classes, requiring them to implement certain methods.           |
| **Usage**                | Used to extend the functionality of an existing class or type.                           | Used to share common functionality across multiple classes.             | Used as a base class that can't be instantiated and needs subclasses to implement methods.     |
| **Multiple Inheritance** | Can be applied to a class to add functionality, but a class can only have one extension. | Can be mixed into many classes simultaneously.                          | Can't be mixed into multiple classes, but can have multiple subclasses.                        |
| **Inheritance**          | Doesn't require inheritance. It adds methods/properties to existing classes.             | Doesn't create a new class; adds shared behavior to other classes.      | Must be extended by subclasses, which must implement its abstract methods.                     |
| **Abstract Methods**     | Cannot have abstract methods. It only provides additional methods.                       | Can contain implemented methods. No requirement for abstract methods.   | Can contain abstract methods (methods without implementations) that subclasses must implement. |
| **Instance Creation**    | Can't create instances of an extension.                                                  | Can't create instances of a mixin directly. Only used in other classes. | Can't create instances of an abstract class. Only used as a base class.                        |

#### **When to Use Each:**

- **Extension**: Use when you want to add functionality to an existing class or library without
  modifying the original code.
- **Mixin**: Use when you need to share common behavior across multiple classes but don’t need to
  create a new class.
- **Abstract Class**: Use when you want to define a common interface for other classes to follow,
  but you don’t want the abstract class to be instantiated.

## What are they ??, ??=, ?., …? in Dart?

- ?? (Null Coalescing Operator): Returns a default value if the left-hand expression is null.
- ??= (Null-Aware Assignment Operator): Assigns a value only if the variable is null.
- ?. (Null-Aware Access Operator): Safely accesses members of an object if the object is not null.
- ...? (Spread Collection Operator): Spreads elements of a collection only if it is not null.

## What is Dart runtime?

- Dart runtime refers to the environment where Dart code is executed.
  The Dart runtime is responsible for interpreting or compiling Dart code into machine code that can
  be executed by the target platform.

## What is Dart VM?

- The Dart VM (Virtual Machine) is a runtime environment that executes Dart code. It is responsible
  for running Dart programs, whether they're running as a command-line tool, a web server, or a
  Flutter app. The Dart VM provides features like Just-in-Time (JIT) compilation and garbage
  collection to efficiently execute Dart code.

## `async`, `await`, `.then()`, `.whenComplete()` and `Future` in Dart

- **`async`:** Keyword used to mark a function as asynchronous, allowing it to use `await`.
- **`await`:** Pauses the execution of a function marked with `async` until a `Future` is complete,
  and then returns the result.
- **`.then((value) { ... })`:** Method called on a `Future` object that registers a callback to be
  executed when the `Future` completes successfully.
- **`.whenComplete(() { ... })`:** Method called on a `Future` object that registers a callback to
  be executed when the `Future` completes, regardless of whether it completes successfully or with
  an error.
- **`Future`:** Represents a value or error that will be available at some point in the future. It
  allows asynchronous operations to be performed and provides a way to retrieve their results.

## Difference between `async` and `async*` in Dart

- async: 
  - The async keyword is used to define a function that returns a Future. This is useful when you want to perform asynchronous operations, such as network requests or database queries, and then return a single result once the operation is complete.
  - It returns the result wrapped in a Future.
  - In Short: async gives you a Future.
- async*:
  - The async* keyword is used to define a function that returns a Stream. This is useful when you want to perform asynchronous operations that yield multiple values over time, rather than just a single value.
  - The results are wrapped in a Stream.
  - In Short: async* gives you a Stream.

In short, `async` is used for a single asynchronous result, while `async*` is used to generate multiple values over time using a Stream.

## `yield` vs `yield*` in Dart

- yield:
  - The yield keyword is used inside an async* function to emit a single value to a Stream. This is useful when you want to produce values one by one over time.
  - It sends one value at a time to the stream.
  - In Short: yield gives you one value.

- yield*:
  - The yield* keyword is used to emit all values from another Stream or Iterable into the current Stream. This is useful when you want to forward multiple values without writing a loop manually.
  - It sends multiple values from another source to the stream.
  - In Short: yield* gives you multiple values.

In short, `yield` emits one value at a time, while `yield*` forwards all values from another stream or iterable.

## `yield` vs `return` in Dart

- yield:
  - The yield keyword is used inside an async* function to emit a single value to a Stream. This is useful when you want to produce values one by one over time.
  - It does not stop the function; it can continue emitting more values.
  - In Short: yield sends values to a Stream.

- return:
  - The return keyword is used to send back a value from a function and terminate its execution.
  - It is used in normal or async functions (Future).
  - Once return is called, the function stops executing.
  - In Short: return gives you a final value and ends the function.

In short, `yield` is used to emit multiple values over time in a Stream, while `return` is used to return a single value and end the function.

## Differences between `var`, `final`, and `const` in Dart

- **`var`:**
    - Used for declaring variables with implicit type inference.
    - Allows the variable's value to change.

- **`final`:**
    - Used for declaring variables whose value can be set only once.
    - Typically initialized at runtime and cannot change thereafter.

- **`const`:**
    - Used for declaring compile-time constants whose value is known at compile time.
    - Requires the type to be explicitly specified and remains constant throughout the program.

## Callback Functions and Asynchronous Programming in Dart

- **Callback Function:**
    - A function passed as an argument to another function, to be executed later when a specific
      event or condition occurs.
    - Essential in Dart's asynchronous programming to handle tasks that complete at a later time,
      like fetching data or I/O operations.

## Built-in Libraries in Dart

1. **`dart:core`:**
    - Includes fundamental classes and utilities for Dart programming.
    - Provides basic data types (e.g., `String`, `List`, `Map`) and core functionalities like
      exception handling and basic operators.

2. **`dart:io`:**
    - Facilitates input and output operations in Dart.
    - Allows interaction with files, directories, and system operations.
    - Essential for building applications that require direct interaction with the device's
      filesystem.

3. **`dart:async`:**
    - Provides classes and utilities for asynchronous programming in Dart.
    - Includes futures, streams, and timers for handling asynchronous tasks.
    - Crucial for managing operations that require non-blocking execution and handling asynchronous
      events.

## Memory Management and Garbage Collection in Dart

- **Memory Management in Dart:**
    - Dart utilizes automatic memory management with a garbage collector.
    - Garbage collection automatically identifies and frees up memory that is no longer in use.
    - Developers do not need to manually allocate or deallocate memory, reducing memory-related
      errors and improving developer productivity.
    - Dart's automatic memory management system ensures efficient memory usage across different
      platforms without requiring manual intervention.

## Future.wait in Dart

- Future.wait in Dart is a way to run multiple asynchronous operations at the same time and wait
  until all of them are complete.
- **Why use**: Future.wait is useful when you need to perform multiple asynchronous operations and
  proceed only when all of them are complete.
    - **For example**: Loading data from multiple sources (e.g.,
      network requests, file reads) before displaying it.
    - Performing multiple database operations.
- **Output**: It returns a list of results in the same order as the futures.
- If any future completes with an error, then the returned future completes with that error. If
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




## Difference Between Set and List in Dart

#### **List**

- **Definition:** A `List` is an ordered collection of elements.
- **Features:**
  - Allows **duplicate values**
  - Maintains **insertion order**
  - Access elements using **index**

---

#### **Set**

- **Definition:** A `Set` is an unordered collection of unique elements.
- **Features:**
  - Does **not allow duplicates**
  - Does not guarantee order
  - No index-based access

---

#### **Key Differences**

- `List` → Ordered collection, allows duplicates
- `Set` → Unordered collection, only unique values

---

### 📌 Example

```dart
void main() {
  List<int> list = [1, 2, 2, 3];
  Set<int> set = {1, 2, 2, 3};

  print(list); // [1, 2, 2, 3]
  print(set);  // {1, 2, 3}
}
```

## Stream vs Future in Dart

#### **Stream**

- **Definition:** A `Stream` delivers a sequence of values (events) over time.
- **Purpose:** Used for real-time or continuous data (e.g., chat messages, live updates).
- **Types:**
  - **Single-subscription:** Supports only one listener.
  - **Broadcast:** Supports multiple listeners.

---

#### **Future**

- **Definition:** A `Future` represents a single value that will be available in the future.
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

In short, `Stream` is used for handling continuous data or events, while `Future` is used for a single asynchronous result.

## Differences between streams and sockets in Flutter?

- Sockets is a real time technology related to server side which enables your back-end to push data
  to your client side without the need for continuous polling your server.

- Streams in flutter is an object that hold reference to changing data that you can tap into it and
  react to the change.

## What is copyWith?
- Create a new object by copying existing values while updating specific properties.
- In simple terms, instead of modifying the original object, we create a new object with updated fields. This keeps data safe and predictable.

So copyWith helps us update only what is needed while keeping the rest same.

## Is Dart a statically typed language?

- Dart is a statically typed language, meaning the type of a variable is checked at compile time

## Runes in Dart

- **Runes:**
    - Represent integer code points of Unicode characters in Dart.
    - Useful for handling characters beyond the Basic Multilingual Plane (BMP).
    - Accessed using the `runes` property of the `String` class in Dart.

## Fat Arrow Notation in Dart

- In Dart, the fat arrow (`=>`) is a shorthand syntax used to write functions that contain only a single expression.
- It automatically returns the result of that expression.
- No need to use the return keyword.

## 18. Method vs Function in Dart

- Method:
    - A method is a function defined inside a class and is associated with an object.
    - Methods are functions that provide behavior for an object.
        - Provides behavior for objects.
    - Location: Declared inside a class body.
    - Types:
        - Instance methods (operate on object data)
        - Static methods (belong to the class, not an instance)

- Function:
    - A function is a top-level function which is declared outside of a class or an inline function
      that is created inside another function or inside method.
    - Location: Declared outside of any class (top-level)
    - Example: main() is the most common top-level Dart Function.

Key Difference: Method belongs to a class, function is independent

## Enum in Dart

- In Dart, an enum (short for enumeration) is a special type used to represent a fixed set of
  constant values.
- They enhance code readability and type safety by replacing "magic strings" or
  numbers with named identifiers.

### Simple enum: Simple enums are best for representing fixed states (e.g., status, days of the week).

#### Example

```dart
enum Status { active, inactive, pending }

void main() {
  Status currentStatus = Status.active;

  switch (currentStatus) {
    case Status.active:
      print('The status is active');
      break;
    case Status.inactive:
      print('The status is inactive');
      break;
    case Status.pending:
      print('The status is pending');
      break;
  }
}
```

### Enhanced enum: (Dart 2.17+) allow adding fields, constructors, and methods, making them more expressive and powerful.

#### Example

```dart
enum VehicleType {
  car('Four wheels'),
  bike('Two wheels'),
  truck('Heavy vehicle');

  final String description;

  const VehicleType(this.description);

  void showInfo() {
    print('This vehicle has: $description');
  }
}

void main() {
  VehicleType selected = VehicleType.bike;

  print('Selected vehicle: $selected');
  selected.showInfo(); // Output: This vehicle has: Two wheels
}
```

### **24. Casting in Dart**

#### **🔹 Definition**

- **Casting** is converting an object from one type to another.
- **Explicit Cast:** Uses `as` for manual conversion.
- **Implicit Cast:** Dart **automatically** converts types if it's safe.

---

### **📌 Explicit Casting (Using `as`)**

Used when we are sure of the type.

```dart
void main() {
  Object x = 12;
  int y = x as int; // Explicit cast from Object to int
  print(y.runtimeType); // Output: int
}
```

⚠️ **Be Careful!**  
If `x` isn't actually an `int`, Dart throws an error.

---

### **📌 Implicit Casting (Automatic Conversion)**

Dart automatically converts compatible types.

```dart
void main() {
  int integer = 10;
  double doubleValue = integer.toDouble(); // Implicit conversion
  print(doubleValue); // Output: 10.0
}
```

🚀 **When to Use?**

- **Use explicit casting (`as`)** when you're sure of the type.
- **Implicit casting** happens automatically for safe conversions.

## Implicit Interface in Dart

- **Definition:** In Dart, every class automatically acts as an **interface**, even if it is not explicitly declared.
- This is called an **implicit interface**.

---

### 📌 How it works
- Any class can be used as an interface using the `implements` keyword.
- The implementing class must **override all methods and properties**.

---

### 📌 Example

```dart
class Animal {
  void eat() {
    print("Animal is eating");
  }
}

class Dog implements Animal {
  @override
  void eat() {
    print("Dog is eating");
  }
}
```

In short, In Dart, every class is an implicit interface, meaning it can be implemented by other classes using the implements keyword.

## `assert` in Dart

- **Definition:** `assert` is used to **check a condition during development** and throw an error if the condition is false.
- It is mainly used for **debugging and testing assumptions** in code.
- If the condition is true → nothing happens  
- If the condition is false → program throws an **AssertionError**

---

### 📌 Example

```dart
void main() {
  int age = 15;

  assert(age >= 18, "Age must be 18 or above");
}
```

In short, assert is used to validate conditions during development and helps detect errors early by stopping execution if a condition fails.

### 28. **📌 Why Mixins in Dart?**

- Mixins are a way to reuse a class's code in multiple class hierarchies.
  ✅ **Dart doesn’t support multiple inheritance** – Mixins provide reusable functionality without
  affecting class hierarchy.  
  ✅ **Used to share behavior between classes** without creating a base class.

---

### **📌 Mixin Example Using `on`**

```dart
class Musician {
  musicianMethod() {
    print('Playing music!');
  }
}

mixin MusicalPerformer on Musician {
  performerMethod() {
    print('Performing music!');
    super.musicianMethod();
  }
}

class SingerDancer extends Musician with MusicalPerformer {}

void main() {
  SingerDancer().performerMethod();
}
```

📌 **Key Point:** `on` ensures that the mixin is only used by classes extending `Musician`.

---

### **📌 Mixin Example Using `with`**

```dart
mixin Musician {
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName');
  }
}

class Virtuoso with Musician {}

void main() {
  Virtuoso().playInstrument('Guitar');
}
```

📌 **Key Point:** `with` allows adding mixin functionality to any class.