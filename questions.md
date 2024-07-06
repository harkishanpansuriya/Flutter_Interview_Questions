Crashalytics vs Analytics
MQTT vs web socket in deep.
flutter inside - how it's works like tress, render, etc...
https://www.ambitionbox.com/profiles/flutter-developer/interview-questions

# 🎨 Object-Oriented Programming (OOPS) Concepts 🚀

## 1. Classes and Objects:

- **Class:** A class is a blueprint for creating objects. It is a collection of data methods and
  functions, which includes fields, getters, setters, constructors, and functions.
- **Object:** An object is an instance of a class. It is used to access the class's properties.

### Example:

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void display() {
    print("Name: $name, Age: $age");
  }
}

void main() {
  Person person = Person("John", 25);
  person.display();
}
```

## 2. Inheritance:

- In Dart, you can create a new class based on an existing one by using the `extends` keyword. This
  process is known as inheritance, where one class inherits the properties and methods of another
  class.
- Simply put, one class can inherit another class. We make use of the `extends` keyword to do so.

### Example:

```dart
class Parent {
  void display() {
    print("This is the Parent class");
  }
}

class Child extends Parent {
  void show() {
    print("This is the Child class");
  }
}

void main() {
  Child child = Child();
  child.display(); // This is the Parent class
  child.show(); // This is the Child class
}
```

### Types of Inheritance:

1. **Single Inheritance:** A class can inherit from only one class in Dart. We can extend one class
   at a time.
   ```dart
   class Child extends Parent {}
   ```

2. **Multiple Inheritance:** Dart doesn't support multiple inheritance, which means a class cannot
   extend more than one class.
   ```dart
   // class Child extends Parent, SecondParent {} // This is not allowed in Dart.
   ```

3. **Multilevel Inheritance:** A class can inherit from another class, and that class can also
   inherit from another class.
    - **Example:**
        - `Animal` is the base class.
        - `Mammal` inherits from `Animal`.
        - `Dog` inherits from `Mammal`.

4. **Hierarchical Inheritance:** Multiple subclasses inherit from a single parent class. This allows
   subclasses to share the properties and methods of their parent class while also adding their own
   unique features.
    - **Example:**
        - `Cat` and `Dog` are both derived classes from the common parent class `Animal`.
        - Both `Cat` and `Dog` inherit the `eat()` method from the `Animal` class.
        - `Cat` has its own method `meow()`, and `Dog` has its own method `bark()`.

## 3. Abstraction:

- Abstract classes are classes that cannot be instantiated. They are used to define the behavior of
  the class that can be inherited by another class. An abstract class is declared using
  the `abstract` keyword.
- Abstract class objects cannot be created but can be extended.
- Abstract classes can contain abstract methods (without implementation) and concrete methods (with
  implementation).

### Example:

```dart
abstract class Animal {
  void eat(); // Abstract method

  void breathe() {
    print("Breathing");
  }
}

class Dog extends Animal {
  void eat() {
    print("Dog is eating");
  }
}

void main() {
  Dog dog = Dog();
  dog.eat(); // Dog is eating
  dog.breathe(); // Breathing
}
```

## 4. Polymorphism:

- Polymorphism is updating or modifying a feature, function, or implementation that already exists
  in the parent class.
- A subclass can override the behavior of the parent class.

### Example:

```dart
class Animal {
  void sound() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Dog barks");
  }
}

void main() {
  Animal animal = Animal();
  animal.sound(); // Animal makes a sound

  Dog dog = Dog();
  dog.sound(); // Dog barks
}
```

## 5. Encapsulation:

- Encapsulation is the concept of bundling data and methods within a class, hiding the internal
  implementation details from outside the class.

### How to Achieve Encapsulation in Dart?

- Providing public getter and setter methods to access and update the value of private property.
- Getter methods are used to access the value of private property. Setter methods are used to update
  the value of private property.

### Example:

```dart
class Student {
  String _name; // Private property

  String get name => _name; // Getter method

  set name(String name) {
    _name = name; // Setter method
  }
}

void main() {
  Student student = Student();
  student.name = "Alice"; // Using setter
  print(student.name); // Using getter
}
```

# 🎨 SOLID Principles in Dart 🚀

The SOLID principles are a set of design principles that can help developers create more
maintainable, understandable, and flexible software. Here are the SOLID principles with examples of
what to do and what not to do in Dart.

## 1. Single Responsibility Principle (SRP)

**A class should have only one reason to change.**

### Do:

```dart
class User {
  String name;
  String email;

  User(this.name, this.email);
}

class UserRepository {
  void save(User user) {
    // Save user to database
  }
}

class UserService {
  final UserRepository repository;

  UserService(this.repository);

  void createUser(String name, String email) {
    User user = User(name, email);
    repository.save(user);
  }
}
```

### Don't:

```dart
class User {
  String name;
  String email;

  User(this.name, this.email);

  void save() {
    // Save user to database
  }
}
```

## 2. Open/Closed Principle (OCP)

**Software entities should be open for extension but closed for modification.**

### Do:

```dart
abstract class Shape {
  double area();
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}
```

### Don't:

```dart
class Shape {
  String type;
  double width;
  double height;
  double radius;

  Shape.rectangle(this.width, this.height) : type = 'rectangle';

  Shape.circle(this.radius) : type = 'circle';

  double area() {
    if (type == 'rectangle') {
      return width * height;
    } else if (type == 'circle') {
      return 3.14 * radius * radius;
    }
    return 0;
  }
}
```

## 3. Liskov Substitution Principle (LSP)

**Subtypes must be substitutable for their base types without altering the correctness of the
program.**

### Do:

```dart
abstract class Bird {
  void fly();
}

class Sparrow extends Bird {
  @override
  void fly() {
    print("Sparrow is flying");
  }
}

class Ostrich extends Bird {
  @override
  void fly() {
    throw Exception("Ostriches can't fly");
  }
}
```

### Don't:

```dart
class Bird {
  void fly() {
    print("Bird is flying");
  }
}

class Ostrich extends Bird {
  @override
  void fly() {
    // Ostrich can't fly, but forced to implement fly
  }
}
```

## 4. Interface Segregation Principle (ISP)

**Clients should not be forced to depend on interfaces they do not use.**

### Do:

```dart
abstract class Printer {
  void printDocument();
}

abstract class Scanner {
  void scanDocument();
}

class AllInOnePrinter implements Printer, Scanner {
  @override
  void printDocument() {
    // Print document
  }

  @override
  void scanDocument() {
    // Scan document
  }
}

class SimplePrinter implements Printer {
  @override
  void printDocument() {
    // Print document
  }
}
```

### Don't:

```dart
abstract class Machine {
  void printDocument();

  void scanDocument();
}

class AllInOnePrinter implements Machine {
  @override
  void printDocument() {
    // Print document
  }

  @override
  void scanDocument() {
    // Scan document
  }
}

class SimplePrinter implements Machine {
  @override
  void printDocument() {
    // Print document
  }

  @override
  void scanDocument() {
    // Empty implementation, not needed
  }
}
```

## 5. Dependency Inversion Principle (DIP)

**High-level modules should not depend on low-level modules. Both should depend on abstractions.
Abstractions should not depend on details. Details should depend on abstractions.**

### Do:

```dart
abstract class Database {
  void save(String data);
}

class MySQLDatabase implements Database {
  @override
  void save(String data) {
    // Save data to MySQL
  }
}

class UserRepository {
  final Database database;

  UserRepository(this.database);

  void save(String data) {
    database.save(data);
  }
}

void main() {
  Database db = MySQLDatabase();
  UserRepository repo = UserRepository(db);
  repo.save("User data");
}
```

### Don't:

```dart
class MySQLDatabase {
  void save(String data) {
    // Save data to MySQL
  }
}

class UserRepository {
  final MySQLDatabase database;

  UserRepository(this.database);

  void save(String data) {
    database.save(data);
  }
}

void main() {
  MySQLDatabase db = MySQLDatabase();
  UserRepository repo = UserRepository(db);
  repo.save("User data");
}
```

# 🚀 Flutter Interview Questions and Answers 💡

# Flutter Overview and Key Concepts

## 1. What is Flutter?

**Flutter** is a free, open-source software development kit (SDK) for building cross-platform mobile
applications. Created by Google and released in May 2017, Flutter is built using C, C++, Skia (2D
rendering engine), and Dart, an object-oriented language.

## 2. Flutter Inspector

The **Flutter Inspector** is a powerful tool for Flutter applications, allowing you to visualize the
blueprint of your widgets and their properties. It helps diagnose layout issues and understand the
current layout.

### Features of Flutter Inspector:

- Select widget mode
- Toggle platform
- Show paint baselines
- Show debug paint
- Refresh widget
- Enable slow animations
- Show/hide performance overlay

## 3. Advantages of Flutter:

- Reduced code development time
- Cross-platform development
- Live and hot reloading
- Similar to native app performance
- Strong community support
- Minimal code requirement
- Expressive and flexible UI

## 4. Features of Flutter:

- Flexibility, scalability, and integration
- Hot reload
- One-stop solution for development
- Native performance with internationalized Flutter libraries
- Extensive widget library

## 5. Limitations of Flutter:

- Limited third-party libraries
- Larger release size
- Requires learning Dart
- Limited complexity for highly intricate applications
- Limited overall support for certain platform-specific functionalities

## 6. What is Dart?

**Dart** is a general-purpose, object-oriented programming language with C-style syntax. Open-source
and developed by Google in 2011, Dart is designed for creating frontend user interfaces for web and
mobile apps. It is integral to Flutter development and supports both AOT (Ahead-of-Time) and JIT (
Just-in-Time) compilation.

## 7. Role of SDK in Flutter:

The Flutter SDK provides tools, libraries, and resources to create user interfaces for Android and
iOS using a single codebase.

### Key Features of Flutter SDK:

- Dart SDK
- Rendering engine, widgets, APIs for testing and integration
- Compilation tools for native machine code (iOS and Android)
- React-style modern framework
- Interop and plugin APIs to connect with system and third-party SDKs
- Headless test runner for Windows, Linux, and Mac
- Dart DevTools for testing, debugging, and profiling
- Flutter and Dart command-line tools for development, building, testing, and compiling across
  platforms

## 8. Why Flutter Uses Dart:

- Dart is declarative and programmatic, making it easy to read and visualize
- No need for a separate declarative layout language (like XML or JSX)
- Faster than JavaScript with AOT and JIT compilation
- JIT compilation for development and AOT for production

### Development Time Considerations:

- Generating device-specific IPA or APK files takes time
- Building a Flutter application uses Xcode and Gradle, which are time-consuming processes

## 9. Full Form of API:

**API:** Application Programming Interface

## 10. Difference Between Package and Plugin in Flutter:

- **Package:** Contains only Dart code.
- **Plugin:** A special kind of package that includes native Kotlin/Java (for Android) or
  Swift/Objective-C (for iOS) code.

### Examples:

#### Package:

- `http`: API for making HTTP requests from a Flutter app.
- `shared_preferences`: Store and retrieve key-value pairs in persistent storage.
- `intl`: Internationalization and localization support.

#### Plugin: (You need a plugin when you need to communicate with native OS.)

- `camera`: Access the device's camera, take pictures, and record videos.
- `firebase_messaging`: Receive and handle push notifications using Firebase Cloud Messaging.
- `google_maps_flutter`: Display interactive maps using the Google Maps API.

## 11. Dart Compilation Modes: AOT and JIT

### JIT (Just-in-Time) Compilation:

- Slower startup time
- Better peak performance
- Compiles code at runtime
- Offers debugging tools and hot reload
- Suited for development and testing
- Uses more memory but allows quicker iteration

### AOT (Ahead-of-Time) Compilation:

- Faster startup times
- Consistent performance
- Compiles code before runtime
- Lacks debugging tools
- Designed for production
- Smaller binary sizes, conserving memory

### Additional Notes:

- JIT-compiled code may have superior peak performance but slower startup.
- AOT-compiled code prioritizes fast startup and lower memory usage.
- JIT is easier to debug due to runtime state access.
- AOT code is smaller because it excludes the JIT compiler.

## 12. Flutter Widgets:

In Flutter, a widget is a basic unit of the user interface (UI). Widgets are reusable pieces of code
that describe how a part of the UI should be displayed. They can be combined and nested to create a
dynamic UI.

## 9. Main Elements of Flutter and Flutter Architecture

**Main Elements:**

- Flutter engine
- Widgets
- Design-specific widgets
- Foundation library

**Flutter Architecture:**

- **Upper Layers:** The Dart-based platform that manages app widgets, gestures, animations,
  illustrations, and materials.
- **Flutter Engine:** Handles the display and formatting of text.
- **Built-in Service:** Manages plugins, packages, and event loops.

## 10. Interface in Dart

Dart does not have an `interface` keyword. Instead, you can achieve interface-like behavior using
the `abstract` keyword.

```dart
abstract class Animal {
  void makeSound();
}

class Dog implements Animal {
  @override
  void makeSound() {
    print("Bark");
  }
}

void main() {
  Dog dog = Dog();
  dog.makeSound(); // Output: Bark
}
```

## 11. GraphQL vs REST

### GraphQL

- API query language and runtime for answering queries with existing data.
- Request and receive specific data.
- Provides all data in one endpoint.

**Pros:**

- Efficient data fetching
- Flexible and scalable

**Cons:**

- Requires a learning curve
- Overhead of setting up GraphQL server

### RESTful

- Uses a set of endpoints responding to specific HTTP requests.
- Presents data in XML and YAML formats.
- Rigid endpoints and data structures.

**Pros:**

- Simple and widely used
- Easy to cache

**Cons:**

- Over-fetching or under-fetching of data
- Less flexible in terms of data querying

## 12. What is an Extension?

Extensions add new methods to existing classes or interfaces without changing their original
implementation.

```dart
extension NumberParsing on String {
  int toInt() {
    return int.parse(this);
  }
}

void main() {
  print("123".toInt()); // Output: 123
}
```

## 13. Dart – Standard Input and Output

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

## 14. What is the `late` keyword used for?

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

## 15. What is Generic in Dart?

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

# Dart and Flutter Key Concepts

## 15. What is `Expanded` and `Flexible` in Dart?

### Expanded

- **Definition:** A widget that expands a child of a Row, Column, or Flex so that the child fills
  the available space.
- **Usage:** Makes a child of a Row, Column, or Flex expand to fill the available space along the
  main axis (horizontally for a Row or vertically for a Column).

### Flexible

- **Definition:** Gives a child of a Row, Column, or Flex the flexibility to expand to fill the
  available space in the main axis, but does not require the child to fill the available space.
- **Difference from Expanded:** Unlike Expanded, Flexible does not force the child to occupy all
  available space.

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row
      (
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Text('Expanded'),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.green,
            child: Text('Flexible'),
          ),
        )
        ,
      ]
      ,
    );
  }
}

```

## 16. Flex Widget in Dart

- **Definition:** A widget that displays its children in a one-dimensional array, either
  horizontally or vertically, similar to a Row or Column widget.

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex
      (
      direction: Axis.horizontal, // or Axis.vertical
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 200,
          height: 100,
          color: Colors.green,
        ),
        Container(
          width: 50,
          height: 100,
          color: Colors.blue,
        )
        ,
      ]
      ,
    );
  }
}

```

## 17. `didChangeDependencies` vs `didUpdateWidget`

### didChangeDependencies

- **When Called:** Called when a dependency of the State object changes, such as when an
  InheritedWidget that the widget depends on changes.
- **Usage:** Called immediately after `initState()` and whenever a dependency changes. Useful for
  performing expensive operations when dependencies change.

### didUpdateWidget

- **When Called:** Called whenever the widget configuration changes, such as when the parent widget
  passes new data to the child widget.
- **Usage:** Called whenever the widget's configuration changes. Useful for updating the widget's UI
  in response to changes in the widget's configuration.

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Handle dependency changes
  }

  @override
  void didUpdateWidget(MyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Handle widget configuration changes
  }
}
```

## 18. What Does `context.mounted = false` Mean?

- **Definition:** Indicates that the widget is no longer part of the widget tree and has been
  disposed or removed.

## 19. What is `as` and `is` in Dart?

### `as` Keyword

- **Usage:** Used for type casting, converting an object of one type to another type.

```dart

var obj = 'Hello';
String str = obj as String;
```

### `is` Keyword

- **Usage:** Used for type checking, checking if an object is of a specific type and returns a
  boolean.

```dart
void main() {
  var obj = 'Hello';
  if (obj is String) {
    print('obj is a String');
  }
}
```

# Dart and Flutter Key Concepts

## 15. Why We Use State Management Instead of `setState`?

### Using `setState`

- **Definition:** Directly updates the state of a widget and rebuilds the entire widget tree.
- **Drawback:** Inefficient for large trees, as it causes the entire widget tree to rebuild, even if
  only one widget's state has changed.

### Using State Management

- **Definition:** Solutions like `Provider`, `Riverpod`, or `Bloc` decouple widgets from the app's
  state.
- **Advantage:** Only the widgets that need to be updated are rebuilt, leading to more efficient and
  manageable code.

## 16. `var` and `dynamic` in Dart

### `dynamic`

- **Definition:** Can change both the type and value of the variable.
- **Example:**

```dart
void main() {
  dynamic variable = 'Hello';
  variable = 42; // No error
}
```

### `var`

- **Definition:** The type of the variable is inferred at compile-time and cannot be changed, but
  the value can be changed.
- **Example:**

```dart
void main() {
  var variable = 'Hello';
// variable = 42; // Error: A value of type 'int' can't be assigned to a variable of type 'String'.
  variable = 'World'; // No error
}
```

## 17. Difference Between Calling `Future` and `Future.microtask` in Flutter

### `Future`

- **Definition:** Executes after all microtasks are completed.
- **Example:**

```dart
void main() {
  Future(() => print('future 1'));
  Future(() => print('future 2'));
  // Output: "future 1" then "future 2"
}
```

### `Future.microtask`

- **Definition:** Executes before any other Futures/Timers, useful for completing small computations
  asynchronously as soon as possible.
- **Example:**

```dart
void main() {
  Future(() => print('future 1'));
  Future(() => print('future 2'));
  Future.microtask(() => print('microtask 1'));
  Future.microtask(() => print('microtask 2'));
  // Output: "microtask 1", "microtask 2", "future 1", "future 2"
}
```

## 18. `is` and `as` Keywords in Dart

### `as` Keyword

- **Usage:** Used for type casting, converting an object to a specific type.
- **Example:**

```dart
void main() {
  Object obj = 'Hello, World!';
  String str = obj as String;
  print(str); // Output: "Hello, World!"
}
```

### `is` Keyword

- **Usage:** Used for type checking, returning a boolean value indicating if the object is of the
  specified type.
- **Example:**

```dart
void main() {
  Object obj = 'Hello, World!';
  if (obj is String) {
    print('obj is a String'); // Output: "obj is a String"
  } else {
    print('obj is not a String');
  }
}
```

## 19. Queues in Dart

### Definition

- **Definition:** A FIFO (First In, First Out) data structure where the first element added is the
  first one removed.
- **Usage:** Useful for building collections of data that need to be processed in the order they
  were added.

### Example

```dart
import 'dart:collection';

void main() {
  // Creating a Queue
  Queue<String> queue = Queue<String>();

  // Adding elements
  queue.add("Geeks");
  queue.addAll(["For", "Geeks"]);
  print(queue); // Output: {Geeks, For, Geeks}

  // Checking if the queue is empty
  print(queue.isEmpty); // Output: false

  // Adding first and last elements
  queue.addFirst("First");
  queue.addLast("Last");
  print(queue); // Output: {First, Geeks, For, Geeks, Last}

  // Removing first and last elements
  queue.removeFirst();
  queue.removeLast();
  print(queue); // Output: {Geeks, For, Geeks}

  // Displaying all elements
  queue.forEach(print); // Output: Geeks For Geeks
}
```

## 21. Routes vs Route Generator in Flutter

### Routes

- **Definition:** Static map of route names to widgets.
- **Limitation:** Cannot pass arguments to widgets or implement custom `PageRoute`.

### Route Generator

- **Definition:** Dynamically generates routes, allowing for passing arguments and implementing
  custom navigation logic.
- **Usage:** Implemented using the `onGenerateRoute` property of `MaterialApp`.

#### Example

```dart
void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (_) => HomePage(),
        '/foo': (_) => FooPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/bar') {
          final value = settings.arguments as int;
          return MaterialPageRoute(builder: (_) => BarPage(value));
        }
        return null;
      },
    ),
  );
}
```

### HomePage

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/foo'),
              child: Text('Go to FooPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/bar', arguments: 42),
              child: Text('Go to BarPage'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### FooPage

```dart
class FooPage extends StatelessWidget {
  @override
  Widget build(_) => Scaffold(appBar: AppBar(title: Text('FooPage')));
}
```

### BarPage

```dart
class BarPage extends StatelessWidget {
  final int value;

  BarPage(this.value);

  @override
  Widget build(_) => Scaffold(appBar: AppBar(title: Text('BarPage, value = $value')));
}
```

## 22. Push vs PushNamed Methods

### push

- **Definition:** Requires a `Route` object.
- **Usage:** Used for navigating to routes dynamically created at runtime.

### pushNamed

- **Definition:** Requires a `String` argument, the name of the route.
- **Usage:** Used for navigating to routes defined in the `routes` map or `onGenerateRoute`.

## 23. Enum in Dart

### Definition

- **Definition:** Special kind of class used to represent a fixed number of constant values.
- **Usage:** Makes the code easier to read and maintain by giving names to constants.

### Example

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

## 24. Casting in Dart

### Definition

- **Definition:** Convert an object of one type to another.
- **Explicit Cast:** Uses the `as` keyword.
- **Implicit Cast:** Automatically converts types if safe.

### Example

#### Explicit Cast

```dart
void main() {
  Object x = 12;
  int y = x as int; // explicit cast from Object to int
  print(y.runtimeType); // prints: int
}
```

#### Implicit Cast

```dart
void main() {
  int integer = 10;
  double doubleValue = integer.toDouble();
  print(doubleValue); // Output: 10.0
}
```

## 25. Implicit Interface in Dart

### Definition

- **Definition:** Defined using abstract classes.
- **Usage:** Any class extending the abstract class must implement all its abstract methods.

### Example

```dart
abstract class Printable {
  void print();
}

class Document implements Printable {
  @override
  void print() {
    print('Printing a document...');
  }
}

class Image implements Printable {
  @override
  void print() {
    print('Printing an image...');
  }
}
```

## 26. `assert` in Dart

### Definition

- **Definition:** Debugging tool used to verify assumptions about the state of the program during
  development.
- **Usage:** Takes a boolean expression; if false, throws an `AssertionError`.

### Example

```dart
void greet(String name) {
  assert(name != null, "Name cannot be null");
  print("Hello, $name!");
}

void main() {
  greet("Alice"); // Assertion passes, "Hello, Alice!" is printed
  greet(null); // Assertion fails, throws AssertionError with message
}
```

## 27. Final vs const in Dart

### Final

- **Definition:** Variable can only be set once and is initialized when accessed.

### Const

- **Definition:** Compile-time constant, value must be known before runtime.

## 28. Mixin in Dart

### Definition

- **Definition:** Reuse code in multiple classes.
- **Usage:** Declared using the `mixin` keyword, combined with classes using `with`.

### Example

#### Using `on` keyword

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

main() {
  SingerDancer().performerMethod();
}
```

#### Using `with` keyword

```dart
mixin Musician {
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }

  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with Musician {
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }
}
```

## 13. Spacer in Dart

### Definition

- **Spacer:** A widget in Flutter that takes up available space in a `Row`, `Column`, or `Flex`
  layout.

### Example

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row
      (
      children: <Widget>[
        Text('Start'),
        Spacer(),
        Text('End'
        )
        ,
      ],
    );
  }
}

```

## 14. Stateful vs Stateless Widget in Flutter

### Stateless Widgets

- **Definition:** Widgets that cannot change their state during the runtime of the app.
- **State:** Immutable.
- **Lifecycle Method:**
    - `build()`: Automatically called when the widget is built.

### Stateful Widgets

- **Definition:** Widgets that can change their state during runtime.
- **State:** Mutable.
- **Lifecycle Methods:**
    1. `createState()`: Returns an instance of the state associated with the widget.
    2. `mounted`: A boolean value that turns true when the `BuildContext` is assigned to the widget.
    3. `initState()`: Called just before the widget is built; initializes variables required by the
       build method.
    4. `didChangeDependencies()`: Called after `initState()`, invoked when the dependencies of the
       state object change.
    5. `build()`: Displays the UI on the screen, returning a widget. Rebuilds when `setState` is
       called.
    6. `didUpdateWidget(Widget oldWidget)`: Called when the widget changes, useful for handling old
       object unsubscription and new object subscription.
    7. `setState()`: Used to update the UI; triggers a rebuild of the widget.
    8. `deactivate()`: Called when the widget is popped but might be reinserted before the current
       frame change is finished.
    9. `dispose()`: Called after the state object is completely removed or when the screen is
       popped; used for cleanup operations.

## 15. What is `setState()`?

- **Definition:** In Flutter, `setState` is a method used to update the state of a `StatefulWidget`.
  It triggers a rebuild of the widget tree, causing the `build` method to re-run and update the UI.

### Example

```dart
void _incrementCounter() {
  setState(() {
    _counter++;
  });
}
```

## 16. `pubspec.yaml` and `pubspec.lock` Files in Flutter

### `pubspec.yaml`

- **Definition:** A configuration file included in every Flutter project, containing metadata about
  the project, dependencies, assets, and other configurations.
- **Usage:** Ensures that the specified packages and versions are used when building the project.

### `pubspec.lock`

- **Definition:** Automatically generated file that locks the specific versions of dependencies used
  in the project.
- **Usage:** Ensures consistency across different environments by locking dependency versions.

## 17. `main()` vs `runApp()` in Flutter

### `main()`

- **Definition:** The entry point of a Dart program, setting up and starting the app.
- **Usage:** Calls `runApp()` to start the Flutter application.

### `runApp()`

- **Definition:** A Flutter-specific method that initializes the app and connects the widget tree to
  the screen.
- **Usage:** Starts the app execution and displays the root widget on the screen.

### Example

```dart
void main() {
  runApp(MyApp());
}
```

## 18. Method vs Function

### Method

- **Definition:** An action associated with a class or an object.
- **Usage:** Called using dot notation (e.g., `object.method()`).
- **Purpose:** Can modify the state of an object.

### Function

- **Definition:** An independent unit of code not associated with a class.
- **Usage:** Called using the function name (e.g., `function()`).
- **Purpose:** Cannot modify the state of an object.

## 19. Types of Keys in Flutter

### Types of Keys

- **ValueKey:** Based on a specific value (e.g., a string or an integer).
- **ObjectKey:** Based on the identity of an object.
- **UniqueKey:** Generates a unique identifier for each widget instance.
- **GlobalKey:** Can be accessed from anywhere in the app.

### Usage Scenarios

- **Lists and Grids:** Ensure that the state of each item is maintained correctly when the order
  changes.
- **Form Inputs:** Preserve user input during widget rebuilds.
- **Animation Transitions:** Identify correct widgets for smooth transitions.
- **Stateful Widgets:** Maintain widget state even if its position changes in the tree.
- **Accessing Specific Widgets:** Control specific widgets from anywhere in the app
  using `GlobalKey`.

## 20. Future.wait in Dart

### Definition

- **Future.wait():** Allows waiting for multiple Future objects to complete. Takes a list of Future
  objects and returns a new Future that completes when all input Futures complete.

### Example

```dart
Future<void> fetchData() async {
  await Future.wait([
    fetchUser(),
    fetchPosts(),
  ]);
}
```

## 21. Flutter Hot Reload

### Definition

- **Hot Reload:** Enables developers to see changes made to the code almost instantly on the app
  screen.
- **Benefit:** Allows fixing bugs quickly and seeing results without restarting the app, resulting
  in faster development cycles.

### How it Works

- **Mechanism:** Injects updated source code files into the running Dart Virtual Machine (VM). The
  VM updates classes, and the Flutter framework rebuilds the widget tree.

## 22. Structure of a Flutter App

### Components

1. **MaterialApp:**
    - **Definition:** Blueprint for the app, setting the overall theme and structure.
    - **Usage:** Starting point, indicating usage of Material components and design.

2. **Scaffold:**
    - **Definition:** Basic layout structure of the screen, including the AppBar and body.
    - **Usage:** Used to create a consistent visual structure.

3. **Widgets:**
    - **Definition:** Building blocks of the app, such as buttons, text, images, etc.
    - **Usage:** Create the UI by combining various widgets.

## 23. Difference Between Set and List

### Set

- **Definition:** Collection of unique elements.
- **Order:** Unordered.

### List

- **Definition:** Collection of elements that can include duplicates.
- **Order:** Ordered in the sequence they were added.

### Example

```dart

Set<int> mySet = {1, 2, 3, 4, 5, 5}; // Duplicate 5 will be removed
List<int> myList = [1, 2, 3, 4, 5, 5]; // Duplicate 5 will remain
```

## 24. Stream in Dart

### Definition

- **Stream:** A sequence of asynchronous data events.
- **Usage:** Implement real-time data updates, progress bars, loading spinners, etc.

### Types of Streams

1. **Single-subscription streams:** Can only be listened to by a single subscriber.
2. **Broadcast streams:** Can be listened to by multiple subscribers; all subscribers are notified
   when an event occurs.

## 25. What is a List?

- **Definition:** A collection of objects that can include duplicates and maintains order.

## 26. What is a HashMap?

- **Definition:** An unordered collection of key-value pairs based on a hashtable. Keys must be
  unique objects.

## 27. What is a Set?

- **Definition:** A collection of unique elements; no duplicates allowed.

## 28. What is an Iterable?

- **Definition:** A collection of elements that can be accessed sequentially.
- **Usage:** Abstract class; can be instantiated by creating a List or Set.

### 29. Difference Between `Future` and `Future.microtask` in Flutter

#### `Future`

- **Definition:** Represents a delayed computation or a result that will be available sometime in
  the future.
- **Execution:** Scheduled in the event loop and executed after microtasks.

#### `Future.microtask`

- **Definition:** Represents a microtask, which is a small unit of work that completes immediately
  after the current event loop iteration.
- **Execution:** Executed before any other `Future` or `Timer` callbacks in the event loop.

### Example

```dart
void main() {
  Future(() => print('future 1'));
  Future(() => print('future 2'));

  // Microtasks will be executed before futures.
  Future.microtask(() => print('microtask 1'));
  Future.microtask(() => print('microtask 2'));
}
```

### Output Order

The above code will output:

```
microtask 1
microtask 2
future 1
future 2
```

### Explanation

Microtasks are executed immediately after the current synchronous code block finishes, before
executing any scheduled futures or timers in the event loop. This ensures that microtasks have
priority over other asynchronous tasks.

### 29. Flutter `Future` vs `Completer`

#### `Future`

- **Definition:** Represents a delayed computation or result that will be available in the future.
- **Usage:** Used to retrieve results from asynchronous operations.

#### `Completer`

- **Definition:** A way to create and control a `Future` manually.
- **Usage:** Allows you to complete a `Future` with a value or an error programmatically.

### Example

```dart
void main() {
  // Example Future usage
  Future<int> fetchData() {
    return Future.delayed(Duration(seconds: 2), () => 42);
  }

  fetchData().then((value) => print('Fetched data: $value'));

  // Example Completer usage
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

### Output

```
Fetched data: 42
Completed with completer: 84
```

In this example, `fetchData` returns a `Future` that completes after a delay,
while `fetchDataWithCompleter` uses a `Completer` to manually complete a `Future`.

### 30. What is an Instance?

- **Definition:** In Dart, an instance refers to a specific object created from a class.
- **Usage:** Instances are created using constructors of the class and represent individual objects
  with their own state and behavior.

### Example

```dart
class MyClass {
  int number;

  MyClass(this.number); // Constructor

  void printNumber() {
    print('Number: $number');
  }
}

void main() {
  MyClass instance = MyClass(42); // Creating an instance of MyClass
  instance.printNumber(); // Output: Number: 42
}
```

### 30. What is `internal`?

- **Definition:** In Dart, `internal` typically denotes members (like constructors or methods) that
  are intended to be private within the library or package scope.
- **Usage:** It restricts access to these members outside the defining library or package.

### Example

```dart
class MyClass {
  // Private constructor
  MyClass._internal();

  factory MyClass() {
    return MyClass._internal();
  }
}
```

In this example, `MyClass._internal()` is a private constructor that can only be accessed within the
same library or package.

### 31. What is `extend`?

- **Definition:** In Dart, the `extends` keyword is used to create a subclass (child class) that
  inherits properties and methods from a superclass (parent class).
- **Usage:** It facilitates class inheritance, allowing the subclass to extend the functionality of
  the superclass.

### Example

```dart
class Animal {
  void sleep() {
    print('Animal is sleeping');
  }
}

class Dog extends Animal {
  void bark() {
    print('Dog is barking');
  }
}

void main() {
  Dog dog = Dog();
  dog.sleep(); // Output: Animal is sleeping
  dog.bark(); // Output: Dog is barking
}
```

### 32. What is `implement`?

- **Definition:** In Dart, the `implement` keyword is used by a class to promise that it will
  provide implementations for all the methods of an interface.
- **Usage:** It establishes a contract that the implementing class must adhere to.

### Example

```dart
abstract class Animal {
  void eat();
}

class Dog implements Animal {
  @override
  void eat() {
    print('Dog is eating');
  }
}

void main() {
  Dog dog = Dog();
  dog.eat(); // Output: Dog is eating
}
```

In this example, `Dog` implements the `Animal` interface by providing an implementation for
the `eat()` method defined in `Animal`.

### 33. `extends` vs `implements` vs `with`

#### `extends`

- **Usage:** Used for class inheritance.
- **Explanation:** Establishes an 'is-a' relationship between classes, allowing a subclass to
  inherit properties and methods from a superclass.

#### `implements`

- **Usage:** Used to declare that a class will provide specific behavior outlined by an interface.
- **Explanation:** Ensures that the implementing class adheres to the contract defined by the
  interface, implementing all of its methods.

#### `with`

- **Usage:** Used for mixin composition.
- **Explanation:** Incorporates the behavior of a mixin into a class without inheritance, allowing
  code reuse across different class hierarchies.

### Example

```dart
class A {
  void methodA() {}
}

class B extends A {
  // B inherits methodA from A
}

class C implements A {
  @override
  void methodA() {}
}

mixin D {
  void methodD() {}
}

class E with D {
  // E incorporates the behavior of mixin D
}
```

### 34. Is `main()` static or dynamic?

- **Answer:** In Dart, `main()` is a static function.
- **Explanation:** It serves as the entry point of a Dart application and is called by the Dart
  runtime to start the execution of the program.

### 35. What is a Constructor? Types of Constructors in Dart

#### Constructor in Dart

- **Definition:** A special method used for initializing objects when they are created.
- **Types:**
    1. **Default Constructor:** Automatically provided if no custom constructors are defined.
    2. **Named Constructor:** Allows defining multiple constructors with different names.
    3. **Parameterized Constructor:** Accepts parameters to initialize the object's properties.
    4. **Constant Constructor:** Creates a constant object that is immutable.

### Example

```dart
class MyClass {
  int number;

  // Parameterized Constructor
  MyClass(this.number);

  // Named Constructor
  MyClass.fromValue(int value) {
    number = value * 2;
  }

  // Constant Constructor
  const MyClass.constant(this.number);
}

void main() {
  MyClass obj1 = MyClass(42); // Using Parameterized Constructor
  MyClass obj2 = MyClass.fromValue(21); // Using Named Constructor
  const MyClass obj3 = MyClass.constant(10); // Using Constant Constructor
}
```

### 36. What is `fromJson` and `toJson`?

#### `fromJson` and `toJson` in Dart

- **`fromJson`:** Method used to convert JSON (text) into Dart objects.
- **`toJson`:** Method used to convert Dart objects into JSON (text).

### Example

```dart
class User {
  String name;
  int age;

  User(this.name, this.age);

  // Convert JSON to User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['age']);
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'age': age,
      };
}

void main() {
  // JSON to Dart object
  Map<String, dynamic> json = {'name': 'John', 'age': 30};
  User user = User.fromJson(json);

  // Dart object to JSON
  Map<String, dynamic> userJson = user.toJson();
}
```

### 37. What is a Factory?

- **Definition:** In Dart, a `factory` constructor is used to return an instance of a class from a
  method without necessarily creating a new object each time.
- **Usage:** Useful for optimizing object creation or implementing singleton patterns.

### Example

```dart
class Singleton {
  static Singleton _instance;

  factory Singleton() {
    if (_instance == null) {
      _instance = Singleton._internal();
    }
    return _instance;
  }

  Singleton._internal();
}

void main() {
  Singleton singleton1 = Singleton();
  Singleton singleton2 = Singleton();

  print(identical(singleton1, singleton2)); // Output: true
}
```

In this example, `Singleton` class uses a `factory` constructor to ensure only one
instance (`singleton`) is created.

### 38. Override and Overloading in Dart

#### Override

- **Definition:** Replaces a method from a superclass with a new implementation in a subclass.
- **Usage:** Enhances or modifies behavior inherited from the superclass.

#### Overloading

- **Definition:** Not supported in Dart for functions/method

s.

- **Explanation:** In Dart, you cannot have multiple methods with the same name but different
  parameters within the same class. This is because Dart uses optional and named parameters to
  achieve similar functionality without function overloading.

### 39. What is `super` in Dart?

- **Definition:** `super` in Dart refers to the superclass (parent class) of the current subclass (
  child class).
- **Usage:** It allows access to superclass methods and properties from within the subclass.

### Example

```dart
class Animal {
  String name;

  Animal(this.name);

  void speak() {
    print('Animal speaks');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void speak() {
    print('Dog barks');
    super.speak(); // Calling superclass method
  }
}

void main() {
  Dog dog = Dog('Buddy');
  dog.speak(); // Outputs: Dog barks\nAnimal speaks
}
```

### 40. What is a Typedef in Dart?

- **Definition:** A `typedef` in Dart is used to provide a name to a function type.
- **Usage:** Simplifies the use of complex function types and enhances code readability.

### Example

```dart
typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  List<int> numbers = [3, 1, 2];
  numbers.sort(sort); // Using the typedef
  print(numbers); // Output: [1, 2, 3]
}
```

In this example, `typedef` `Compare<T>` is defined as a function type that takes two parameters of
type `T` and returns an `int`. It simplifies the use of the `sort` function in the `List.sort()`
method.

### 41. What are Anonymous Functions?

- **Definition:** In Dart, an anonymous function is a function without a name.
- **Usage:** Used for short, one-time operations where a full function definition is not necessary.

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

### 42. Can we send data from a GET request to the server?

- **Answer:** Yes, in a GET request, data can be sent as part of the URL parameters.
- **Limitation:** Typically limited to a maximum length (e.g., 2048 characters) depending on server
  configurations and browser limits.

### Example

```
GET /api/resource?param1=value1&param2=value2
```

### 43. Types of API Methods

- **GET:** Retrieves data of all users or specific resources.
- **POST:** Creates a new user or resource.
- **PUT:** Updates an existing user or resource with the specified ID.
- **PATCH:** Partially updates an existing user or resource.
- **DELETE:** Deletes a user or resource with the specified ID.
- **OPTIONS:** Retrieves supported HTTP methods for a specific endpoint.

### 44. Constant Constructor in Dart

- **Definition:** A constant constructor in Dart creates a constant object whose value cannot be
  changed after initialization.
- **Usage:** Used for objects that are immutable and have constant values.

### Example

```dart
class Circle {
  final double radius;
  static const double pi = 3.14;

  const Circle(this.radius);

  double calculateArea() {
    return pi * radius * radius;
  }
}

void main() {
  const Circle circle = Circle(5.0);
  print('Area of circle: ${circle.calculateArea()}'); // Output: Area of circle: 78.5
}
```

### 45. Sealed Class

- **Definition:** A sealed class restricts the inheritance hierarchy such that all subclasses of the
  sealed class must be declared in the same file where the sealed class is declared.
- **Usage:** It provides a way to define a closed set of possible types, ensuring exhaustive
  handling of all possible cases without allowing extension outside of the defined set.
- **Example:**

```dart
sealed class Result {
  const Result();
}

class Success extends Result {
  final String message;

  Success(this.message);
}

class Failure extends Result {
  final String errorMessage;

  Failure(this.errorMessage);
}
```

In this example, `Result` is a sealed class with `Success` and `Failure` as its subclasses. No other
subclasses can be created outside of this file.

### 46. Immutable and Mutable Class

- **Immutable Class:** An object whose state cannot be modified after it is created. All fields in
  an immutable class should be `final`.
- **Mutable Class:** An object whose state can be modified after it is created, allowing its fields
  to change values.

### 47. Hot Reload vs Hot Restart

- **Hot Reload:** Injects updated source code files into the running Dart Virtual Machine (VM). It
  maintains the app's state and updates the UI almost instantaneously.
- **Hot Restart:** Restarts the entire app, including the Dart VM. It resets the app's state to its
  initial conditions before reloading the updated UI.

### 48. RefreshIndicator Widget

- **Purpose:** Enables pull-to-refresh functionality in Flutter apps.
- **Usage:** Wraps a scrollable widget (like ListView, GridView) and triggers a refresh action when
  the user pulls down the widget.

### 49. Build Modes in Flutter

- **Debug:** Enables debugging features like hot reload, asserts, and debug symbols.
- **Profile:** Similar to release mode but with profiling enabled for performance analysis.
- **Release:** Optimizes the app for performance and size reduction, suitable for production
  deployment.

### 50. `NetworkImage` vs `Image.network` in Flutter

- **`NetworkImage`:** A class that represents an image obtained from a URL, used to fetch an image
  programmatically but not directly display it on the screen.
- **`Image.network`:** A widget that displays an image obtained from a URL. It internally
  uses `NetworkImage` to fetch the image and display it on the screen.

### 51. `Navigator.push` and `Navigator.pop` Function

- **`Navigator.push`:** Adds a route to the stack of routes managed by the navigator, navigating to
  a new screen.
- **`Navigator.pop`:** Removes the current route from the stack of routes managed by the navigator,
  returning to the previous screen.

### 52. `double.INFINITY`

- **Usage:** Represents positive infinity in Dart's `double` type.
- **Purpose:** Used to indicate an unbounded or infinitely large value, often in mathematical
  computations or when calculating maximum values.

### 53. Fat Arrow Notation in Dart

- **Syntax:** `=>`
- **Purpose:** Provides a concise syntax for defining short, one-line functions or expressions that
  immediately return a value.
- **Example:** `void function(int a) => print('Value is $a');`

### 54. ScopedModel/BLoC Pattern

- **ScopedModel:** A state management pattern and library that allows passing data down the widget
  tree without rebuilding parent widgets.
- **BLoC (Business Logic Components):** A pattern for managing state and handling data flow using
  streams and reactive programming.

### 55. `BuildContext` in Flutter

- **Definition:** Represents the location of a widget in the widget tree.
- **Usage:** Allows widgets to find their parent widgets, access theme data, and navigate through
  the widget tree.

### 56. `WidgetsApp` vs `MaterialApp` in Flutter

- **`WidgetsApp`:** Provides basic navigation and widget management capabilities without specific
  material design components.
- **`MaterialApp`:** Builds upon `WidgetsApp` by implementing Material Design, offering additional
  widgets and styling for consistent UI across platforms.

### 57. Nesting `Scaffold` in Flutter

- **Feasibility:** Yes, you can nest `Scaffold` widgets.
- **Purpose:** Allows building complex UI structures with multiple layers of material components
  like app bars, drawers, and bottom sheets.

### 58. `SafeArea` Widget in Flutter

- **Purpose:** Ensures that child widgets are positioned within safe areas of device screens,
  avoiding overlap with system UI elements like status bar and notch.

### 59. Method Channel vs Event Channel in Flutter

- **Method Channel:** Used for asynchronous method calls between Flutter and platform-specific
  code (e.g., Android/iOS).
    - the native side and can return back a value and vise versa.You can e.g. call a method that
      retrieves the device name this way.
- **Event Channel:** Used for establishing a data stream from platform-specific code to Flutter,
  providing continuous updates or events.
    - on the *Dart* side of things and being able to feed that stream from the native side.  
      This is useful if you want to send data every time a particular *event* occurs, e.g. when the
      wifi connection of a device changes.

### 63. Android and iOS folders in Flutter Project

- **Android Folder:** Contains the entire Android project necessary for building a Flutter
  application for the Android platform. It includes configurations, resources, and native code
  components specific to Android.

- **iOS Folder:** Contains the entire iOS project necessary for building a Flutter application for
  the iOS platform. It includes configurations, resources, and native code components specific to
  iOS.

### 64. `async`, `await`, `.then()`, `.whenComplete()` and `Future` in Dart

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

### 65. FutureBuilder in Flutter

- **Purpose:** Widget used to build UI components based on the state of a `Future`.
- **States:**
    - **Waiting:** Future is ongoing, and data has not yet been received.
    - **Done:** Future has completed successfully, and data is available.
    - **Error:** Future has completed with an error.

### 66. StreamBuilder in Flutter

- **Purpose:** Widget used to build UI components that react to the state of a `Stream`.
- **Usage:** Responds to asynchronous events or updates from a `Stream`, allowing real-time updates
  in the UI based on the stream's state.

### 67. Difference between FutureBuilder and StreamBuilder

**FutureBuilder:**

- Used for handling one-time asynchronous operations, like fetching data from an API.
- Works with a `Future` object.
- Displays UI based on the completion state of a `Future`.

**StreamBuilder:**

- Used for handling continuous asynchronous operations, like real-time data updates.
- Works with a `Stream` object.
- Continuously updates UI based on events received from the stream.

### 68. Channel Socket in Flutter

- **Definition:** Communication channel facilitating real-time data exchange between Flutter
  applications or between Flutter and native platform components.
- **Types:**
    - **Method Channels:** Synchronous communication channels for invoking methods between Flutter
      and native platform.
    - **Stream Channels:** Asynchronous communication channels for streaming data between Flutter
      and native platform.

### 69. Method Channel in Flutter

- **Purpose:** Facilitates synchronous communication between Dart (Flutter) code and
  platform-specific native code (e.g., Android, iOS).
- **Usage:** Enables Flutter applications to access platform-specific features and functionalities.

### 70. MVVM (Model-View-ViewModel) Structure

- **Components:**
    - **Model:** Contains application data and business logic.
    - **View:** User interface elements presented to the user.
    - **ViewModel:** Mediates between the View and the Model, exposing data and commands from the
      Model to the View.

- **Working:** Views observe changes in ViewModel and update accordingly. ViewModel interacts with
  Model to fetch data and update state.

### 71. MVC (Model-View-Controller) Structure

- **Components:**
    - **Model:** Manages application data and business logic.
    - **View:** Displays data from the Model to the user and sends user commands to the Controller.
    - **Controller:** Interprets user actions from the View, updates the Model, and manipulates the
      View.

- **Working:** Controller handles user input, updates Model, and notifies View of changes. View
  displays data from Model and sends user input to Controller.

### 73. Threads Used by Flutter

- **Threads in Flutter:**
    - Flutter utilizes a single thread for the main UI and multiple threads for background tasks.
    - **Main UI Thread:** Responsible for rendering the widget tree and handling user input.
    - **Background Threads:** Used for tasks like networking, file I/O, and image decoding.
    - The number of background threads varies by platform; for instance, Android uses a thread pool
      of four threads for background tasks.
    - Isolates are also used to isolate background tasks from the main UI thread for improved
      performance and stability.

### 74. Difference between `async` and `async*` in Dart

- **`async`:** Marks a function as asynchronous and returns a `Future`.
- **`async*`:** Marks a function as asynchronous and returns a `Stream`.

### 75. `yield` and `yield*` in Dart

- **`yield`:** Returns a single value from a generator function and pauses its execution until the
  next value is requested.
- **`yield*`:** Delegates to another Iterable or Stream to provide multiple values.

### 76. `yield` vs `return` in Dart

- **`yield`:**
    - Returns a value from a generator function and suspends the function's execution.
    - Used for iterative operations that produce a sequence of values.

- **`return`:**
    - Terminates the execution of a function and optionally returns a value.
    - Used to exit from a function once its task is complete.

### 77. Differences between `var`, `final`, and `const` in Dart

- **`var`:**
    - Used for declaring variables with implicit type inference.
    - Allows the variable's value to change.

- **`final`:**
    - Used for declaring variables whose value can be set only once.
    - Typically initialized at runtime and cannot change thereafter.

- **`const`:**
    - Used for declaring compile-time constants whose value is known at compile time.
    - Requires the type to be explicitly specified and remains constant throughout the program.

### 78. Callback Functions and Asynchronous Programming in Dart

- **Callback Function:**
    - A function passed as an argument to another function, to be executed later when a specific
      event or condition occurs.
    - Essential in Dart's asynchronous programming to handle tasks that complete at a later time,
      like fetching data or I/O operations.

### 79. Dependency Injection in Dart

- **Dependency Injection:**
    - A design pattern where objects receive their dependencies from an external source rather than
      creating them internally.
    - Improves modularity, testability, and reusability of code by decoupling dependencies from the
      objects that use them.
    - Implemented in Dart by passing dependencies as parameters manually or using tools/libraries
      like `get_it` or `Provider` in Flutter.

### 80. Built-in Libraries in Dart

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

### 81. Memory Management and Garbage Collection in Dart

- **Memory Management in Dart:**
    - Dart utilizes automatic memory management with a garbage collector.
    - Garbage collection automatically identifies and frees up memory that is no longer in use.
    - Developers do not need to manually allocate or deallocate memory, reducing memory-related
      errors and improving developer productivity.
    - Dart's automatic memory management system ensures efficient memory usage across different
      platforms without requiring manual intervention.

### 84. Types of Tests in Flutter

- **Unit Tests:**
    - Unit testing is the easiest way to test an application. It focuses on testing the accuracy of
      a specific piece of code (For example, a function or method). It is performed by developers
      who create the code. However, it doesn’t replicate the actual environment and is not the best
      way to find bugs.

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Addition test', () {
    expect(2 + 2, 4);
  });
}
```

- **Widget Tests:**
    - Widget testing ensures that widgets (user interface components) are correctly created,
      rendered, and interact with each other as expected. Unlike unit testing, it provides a more
      real-time environment to uncover more bugs.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget test example', (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget());
    expect(find.text('Hello, World!'), findsOneWidget);
  });
}
```

- **Integration Tests:**
    - Integration testing combines unit and widget testing with external components like databases
      and web services. It simulates the real environment to discover bugs. It is the most
      comprehensive yet complicated testing technique.

### 85. Debug Mode, Profile Mode, and Release Mode in Flutter

- **Debug Mode:**
    - Used during app development.
    - Enables hot reload for rapid iteration and debugging.
    - Provides detailed error messages and debugging information.

- **Profile Mode:**
    - Used for performance profiling and optimization.
    - Enables some optimizations like JIT (Just-in-Time) compilation.
    - Provides performance metrics and insights into app performance.

- **Release Mode:**
    - Used when preparing the app for deployment or release.
    - Disables debugging features and enables full optimizations (AOT - Ahead-of-Time compilation).
    - Optimized for speed and efficiency, suitable for production deployment.

### 86. Deploying a Flutter App on Play Store

- For detailed steps on deploying a Flutter app on Google Play Store, you can refer to
  this [Medium article](https://medium.com/@bernes.dev/deploying-flutter-apps-to-the-playstore-1bd0cce0d15c).

### 87. Deploying a Flutter App on App Store

- For a comprehensive guide on releasing your Flutter app for iOS and Android, you can refer to
  this [Instabug blog post](https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android).

### 89. What is IPv4?

- **IPv4 (Internet Protocol version 4):**
    - Fourth version of the Internet Protocol (IP).
    - Uses a 32-bit address scheme, typically represented in dotted decimal format (e.g.,
      192.168.1.1).
    - Widely used to identify devices on a network and route data packets across the Internet.

### 90. MQTT (Message Queuing Telemetry Transport)

- **MQTT:**
    - A lightweight messaging protocol for small sensors and mobile devices.
    - Uses a publish/subscribe architecture.
    - Efficiently sends messages over low-bandwidth networks, making it ideal for IoT (Internet of
      Things) applications.

### 91. Sqflite and Comparison with Hive

- **Sqflite:**
    - A lightweight, SQL-based relational database management system (RDBMS) for Flutter.
    - Supports a wide range of SQL features and is suitable for complex applications.

- **Hive:**
    - A lightweight, NoSQL database for Flutter.
    - Offers fast performance and simplicity, ideal for simpler applications or scenarios requiring
      fast data storage and retrieval.

### 92. State Management in Flutter

- **State Management in Flutter:**
    - Facilitates managing and updating the state of widgets in response to user interactions and
      data changes.
    - Popular approaches/libraries include `setState`, `Provider`, `Bloc`, and `GetX`.
    - Each approach offers different levels of complexity and scalability, catering to various app
      architectures and requirements.

### 93. Creating Responsive UI in Flutter

- **Responsive UI Techniques:**
    - **MediaQuery:** Retrieve device size and orientation.
    - **LayoutBuilder:** Construct UI based on parent constraints.
    - **OrientationBuilder:** Adapt UI based on device orientation.
    - **Expanded/Flexible Widgets:** Manage widget sizes dynamically.
    - **Aspect Ratio Widget:** Maintain aspect ratio of child widgets.
    - **Fractionally Sized Box Widgets:** Size widgets as fractions of the available space.
    - **Custom MultiChild Layouts:** Create custom layouts for different screen sizes.

### 94. Tween Animation in Flutter

- **Tween Animation:**
    - Defines the start and end values of an animation.
    - Interpolates between these values over a specified duration.
    - Utilizes the `Tween` class to animate properties such as opacity, position, and size smoothly.

### 95. SizedBox vs Container

- **SizedBox:**
    - Specifies a fixed size for its child widget.
    - Does not provide decoration or styling options like color or padding.

- **Container:**
    - Provides styling, padding, margins, and decoration for its child widget.
    - Offers more control over the appearance of its child widget.

### 96. Runes in Dart

- **Runes:**
    - Represent integer code points of Unicode characters in Dart.
    - Useful for handling characters beyond the Basic Multilingual Plane (BMP).
    - Accessed using the `runes` property of the `String` class in Dart.

### 97. Ticker in Flutter

- **Ticker in Flutter:**
    - Manages the timing of animations.
    - Ensures smooth and consistent frame updates.
    - Essential for creating fluid and responsive animations in Flutter applications.