## Which design patterns are used in Flutter?

| **Pattern**            | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Singleton Pattern**  | A Singleton is a design pattern that ensures only one instance of a class is created. This single object can be used throughout the app wherever needed. This is particularly useful for managing shared resources like network connections, databases, or app configurations.                                                                                                                                                                                 |
| **Factory Pattern**    | The Factory Design Pattern is used when we have a superclass with multiple subclasses, and based on some input or condition, we need to return one of those subclasses. It provides a way to create objects by specifying their type, without the need to directly instantiate the subclass, making the code cleaner and more flexible.                                                                                                                        |
| **Builder Pattern**    | The Builder Design Pattern is used to simplify the construction of complex objects. Instead of having one large constructor with many parameters, the Builder pattern allows you to build an object step by step. This is useful when you need to create objects with multiple parts or optional features, making the code cleaner and more readable. It also allows for flexibility in how the object is constructed without changing the object’s structure. |
| **Repository Pattern** | The Repository Pattern is used to abstract the data access layer, separating the logic for fetching or storing data from the rest of the application. This pattern is helpful when you want to manage data from multiple sources (like APIs, local databases, or cache) in a clean and testable way.                                                                                                                                                           |
| **Decorator Pattern**  | The Decorator Design Pattern allows you to add new features to an object without changing its core structure. It works by "wrapping" the object with extra functionality, either statically or dynamically. This pattern is useful when you want to enhance an object without affecting other objects of the same class or modifying the original class. It helps maintain flexibility and scalability.                                                        |
| **MVC Pattern**        | The Model-View-Controller (MVC) pattern separates an application into three main components: Model, View, and Controller. The Model represents the data and business logic, the View displays the data to the user, and the Controller handles user input and updates the Model and View accordingly. This separation of concerns helps to organize code, improve maintainability, and facilitate testing.                                                     |
| **MVVM Pattern**       | The Model-View-ViewModel (MVVM) pattern separates an application into three main components: Model, View, and ViewModel. The Model represents the data and business logic, the View displays the data to the user, and the ViewModel acts as an intermediary between the Model and the View, handling user input and updating the Model and View accordingly. This pattern helps to separate concerns, improve code organization, and facilitate testing.      |
| **Provider Package**   | The Provider package is a state management solution in Flutter that uses `ChangeNotifier` to notify listeners of state changes. It allows for managing state in a simple and scalable way across an app.                                                                                                                                                                                                                                                       |
| **Bloc Pattern**       | The Bloc (Business Logic Component) pattern is a state management pattern in Flutter that separates the business logic from the UI. It uses streams and reactive programming (often with RxDart) to manage and stream state, making the UI react to the state changes.                                                                                                                                                                                         |
| **Adapter Pattern**    | The Adapter Design Pattern allows for converting one interface to another expected by the client. It is useful when integrating systems or components that are not compatible, allowing them to work together without altering their existing code.                                                                                                                                                                                                            |

## Design Patterns: Name and Basic Understanding (From Definitions)

## Some of the design patterns I've explained in detail as below:

## Singleton Design Pattern

### Why and when to use Singleton in Flutter?

- Managing Shared Resources: Singleton can be used For example, a single instance of a database
  manager, API service, Theme manager or logging system.
- Saving Memory: Avoids creating multiple copies of the same object, which reduces resource usage.
- Easy Access: Provides a single, global access point to important functionality like app
  configuration, authentication, or settings.
- Consistency: Ensures that all parts of your app are using the same instance with the same state.

### Implementation in Dart (Flutter)

### Simple Singleton Example

```dart
class Singleton {
  // Private constructor
  Singleton._privateConstructor();

  // Single instance of the class
  static final Singleton _instance = Singleton._privateConstructor();

  // Factory constructor to return the single instance
  factory Singleton() {
    return _instance;
  }

  // Example method
  void log(String message) {
    print("Singleton Log: $message");
  }
}

void main() {
  var instance1 = Singleton();
  var instance2 = Singleton();

  print(instance1 == instance2); // Output: true
  instance1.log("Hello, Singleton!"); // Output: Singleton Log: Hello, Singleton!
}
```

### Lazy Initialization Singleton

Lazy initialization delays the creation of the singleton instance until it is first used.

```dart
class LazySingleton {
  // Private constructor
  LazySingleton._privateConstructor();

  // Single instance, initialized lazily
  static LazySingleton? _instance;

  // Factory constructor
  factory LazySingleton() {
    _instance ??= LazySingleton._privateConstructor();
    return _instance!;
  }

  void log(String message) {
    print("LazySingleton Log: $message");
  }
}

void main() {
  var instance1 = LazySingleton();
  var instance2 = LazySingleton();

  print(instance1 == instance2); // Output: true
  instance1.log("Hello, Lazy Singleton!"); // Output: LazySingleton Log: Hello, Lazy Singleton!
}
```

### Singleton with Thread Safety

In multithreaded environments, ensure thread safety to avoid creating multiple instances.

```dart
class ThreadSafeSingleton {
  // Private constructor
  ThreadSafeSingleton._privateConstructor();

  // Single instance, initialized lazily with thread safety
  static ThreadSafeSingleton? _instance;

  // Factory constructor
  factory ThreadSafeSingleton() {
    if (_instance == null) {
      _instance = ThreadSafeSingleton._privateConstructor();
    }
    return _instance!;
  }

  void log(String message) {
    print("ThreadSafeSingleton Log: $message");
  }
}
```

### Advantages of Singleton

1. Ensures a single instance of the class.
2. Reduces memory usage by avoiding duplicate instances.
3. Provides a global access point to the instance.

### Disadvantages of Singleton

1. Introduces global state, which can make testing and debugging more difficult.
2. Can lead to tight coupling if overused.
3. May be a bottleneck in multithreaded environments if not handled correctly.

### Best Practices for Singleton

- **Make the Constructor Private:**  
  This ensures the class can’t be created directly from outside, keeping control of how the instance
  is created.

- **Use a Static Variable for the Instance:**  
  A static variable ensures there’s only one instance of the class shared across the app.

- **Use a Factory Constructor:**  
  A factory constructor helps control instance creation, making sure only one object is ever
  created.

- **Consider the `get_it` Package:**  
  The `get_it` package makes managing Singletons easier by handling dependency injection, letting
  you register and access shared instances throughout the app.

#### What is the difference between Singleton and lazy Singleton flutter?

- **Singleton:**  
  The instance is created as soon as the class is loaded, even if you never use it. This can waste
  resources.

- **Lazy Singleton:**  
  The instance is created only when you need it for the first time. This is more efficient because
  it avoids using resources unnecessarily.

## **Factory Design Pattern**

### Why and When to Use Factory Design Pattern in Flutter?

- When you need to create objects based on input, like choosing between email, SMS, or push
  notifications.
- When you want to easily add new types of objects, such as integrating a new notification method
  later.
- When the object creation is complex, and you want to keep that logic separate from the main app
  code.

### Real-World Examples:

- **Database Connections:** Create different database connection objects based on the database type.
- **Notification Services:** Return a different notification service based on the type (email, SMS,
  etc.).
- **Theme Management:** Select different theme managers based on the app’s theme (light, dark,
  custom).

### Benefits of Using the Factory Pattern

- **Decouples Object Creation:** It keeps the object creation process separate from the app's main
  logic, making it easier to maintain.
- **Simplifies Object Creation:** Provides a central point to create objects, reducing complexity
  and improving readability.
- **Supports Open/Closed Principle:** You can add new subclasses without changing existing code,
  adhering to the Open/Closed Principle.
- **Flexibility:** New object types can be added later without modifying the existing system, making
  your code more flexible.

### Example of Factory Design Pattern in Dart (Flutter)

```dart
abstract class NotificationService {
  void sendNotification(String message);
}

class EmailNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print("Sending email: $message");
  }
}

class SMSNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print("Sending SMS: $message");
  }
}

class NotificationFactory {
  static NotificationService createNotificationService(String type) {
    if (type == "email") {
      return EmailNotificationService();
    } else if (type == "sms") {
      return SMSNotificationService();
    } else {
      throw Exception("Unknown notification type");
    }
  }
}

void main() {
  var notification = NotificationFactory.createNotificationService("email");
  notification.sendNotification("Hello, world!");
}
```

Another example of Factory Design Pattern (Logistics Management) :

```dart
abstract class Transport {
  void deliver();
}

class Truck implements Transport {
  @override
  void deliver() {
    print("Delivering by Truck");
  }
}

class Ship implements Transport {
  @override
  void deliver() {
    print("Delivering by Ship");
  }
}

class TransportFactory {
  static Transport createTransport(String type) {
    if (type == "truck") {
      return Truck();
    } else if (type == "ship") {
      return Ship();
    } else {
      throw Exception("Unknown transport type");
    }
  }
}

void main() {
  var transport = TransportFactory.createTransport("truck");
  transport.deliver();
}
```

## Builder Design Pattern

### Why and When to Use Builder Design Pattern in Flutter?

- For Instance we need to create an object that has many properties, some of which are optional, and
  some of which are mandatory. so for this problem we have a simple solution we can make multiple
  constructors in our class. But in this case it’s difficult to manage as the number of parameters
  increases in the constructor. Also in this scenario constructors may become cluttered with
  conditional statements to handle optional parameters, making the code more complex and harder to
  understand.

### Real-World Examples:

```dart
class Profile {
  String name;
  int age;
  String address;
  String phoneNumber;

  Profile(
      {required this.name, required this.age, required this.address, required this.phoneNumber});
}

class ProfileBuilder {
  String? name;
  int? age;
  String? address;
  String? phoneNumber;

  ProfileBuilder setName(String name) {
    this.name = name;
    return this;
  }

  ProfileBuilder setAge(int age) {
    this.age = age;
    return this;
  }

  ProfileBuilder setAddress(String address) {
    this.address = address;
    return this;
  }

  ProfileBuilder setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    return this;
  }

  Profile build() {
    return Profile(
      name: name ?? 'Default Name',
      age: age ?? 18,
      address: address ?? 'Unknown Address',
      phoneNumber: phoneNumber ?? 'No Phone Number',
    );
  }
}

void main() {
  var profile = ProfileBuilder()
      .setName('John Doe')
      .setAge(30)
      .setAddress('123 Street')
      .setPhoneNumber('123-456-7890')
      .build();

  print('Name: ${profile.name}, Age: ${profile.age}, Address: ${profile.address}, Phone: ${profile
      .phoneNumber}');
}
```

### But….. Builder Pattern is not used in Dart. Why?

- We have an immutable class now. All the properties are final. All we need to do to change its
  properties outside of this file is use `copyWith` function. No Builder classes is required in
  dart. No more complications to manage the same properties between two classes.
- We can solve these problems even more simply in Dart. This way:

```dart
class Profile {
  final String name;
  final int age;
  final String address;
  final String phoneNumber;

  Profile({
    required this.name,
    required this.age,
    required this.address,
    required this.phoneNumber,
  });

  Profile copyWith({
    String? name,
    int? age,
    String? address,
    String? phoneNumber,
  }) {
    return Profile(
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
```

## Repository Design Pattern

### Why and When to Use Repository Design Pattern in Flutter?

- **Why**: It helps to organize code by separating data-fetching logic from the app’s UI and
  business logic. This improves readability, maintainability, and testability.

- **When**:
    - You have multiple data sources (e.g., APIs, local storage, cache) and want a single interface
      to manage them.
    - You want to write unit tests by mocking data sources easily.
    - You aim to follow clean architecture principles for better scalability and flexibility.

### Real-World Examples:

```dart
// Model
class User {
  final String id;
  final String name;

  User({required this.id, required this.name});
}

// Repository Interface
abstract class UserRepository {
  Future<User> fetchUser(String userId);
}

// API Service Implementation
class ApiUserService implements UserRepository {
  @override
  Future<User> fetchUser(String userId) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate API call
    return User(id: userId, name: "John Doe from API");
  }
}

// Local Database Service Implementation
class LocalUserService implements UserRepository {
  @override
  Future<User> fetchUser(String userId) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate local fetch
    return User(id: userId, name: "John Doe from Local DB");
  }
}

// Repository Implementation
class UserRepositoryImpl implements UserRepository {
  final ApiUserService apiService;
  final LocalUserService localService;

  UserRepositoryImpl(this.apiService, this.localService);

  @override
  Future<User> fetchUser(String userId) async {
    try {
      return await apiService.fetchUser(userId); // Try API first
    } catch (e) {
      return await localService.fetchUser(userId); // Fallback to local
    }
  }
}

// Main Application
void main() async {
  final repository = UserRepositoryImpl(ApiUserService(), LocalUserService());

  final user = await repository.fetchUser("123");
  print("User Name: ${user.name}");
}
```

## Decorator Design Pattern

### Why and When to Use Decorator Design Pattern in Flutter?

- **Why**: It allows adding new features to an object without modifying its original structure,
  making it easy to extend functionality dynamically.
- **When**:
    - You want to add responsibilities dynamically to objects.
    - You need to avoid creating a large number of subclasses.
    - You need to add responsibilities that can be combined in many different ways.
    - You need to follow the open/closed principle.

### Real-World Examples:

```dart
import 'package:flutter/material.dart';

// Base Shape Component
abstract class Shape {
  void draw();
}

class Circle implements Shape {
  @override
  void draw() {
    print("Drawing Circle");
  }
}

// Decorator to add border
class BorderShape implements Shape {
  final Shape shape;

  BorderShape(this.shape);

  @override
  void draw() {
    shape.draw();
    print("Adding Border");
  }
}

// Decorator to add shadow
class ShadowShape implements Shape {
  final Shape shape;

  ShadowShape(this.shape);

  @override
  void draw() {
    shape.draw();
    print("Adding Shadow");
  }
}

void main() {
  Shape circle = Circle();
  Shape circleWithBorder = BorderShape(circle);
  Shape circleWithBorderAndShadow = ShadowShape(circleWithBorder);

  circleWithBorderAndShadow.draw(); // Output: Drawing Circle, Adding Border, Adding Shadow
}
```

### Explanation:

- Circle is the base shape.
- BorderShape and ShadowShape are decorators that add extra functionality to the Circle without
  modifying it.

## MVC Design Pattern

- **Model**: Represents the data and business logic.
- **View**: Displays the data (UI) and listens for user input.
- **Controller**: Handles user input, updates the Model, and updates the View accordingly.
- **Why and When to Use MVC in Flutter**:
    - **Why**: Separates concerns, making the code more organized, maintainable, and testable.
    - **When**:
        - You want to separate the UI, business logic, and data.
        - You need to reuse the same Model with different Views or Controllers.
        - You want to write unit tests for each component separately.

## MVVM Design Pattern

- **Model**: Represents the data and business logic.
- **View**: Displays the data (UI) and listens for user input.
- **ViewModel**: Acts as a mediator between the Model and the View, handling user input, updating
  the Model, and updating the View.
- **Why and When to Use MVVM in Flutter**:
    - **Why**: Separates concerns, making the code more organized, maintainable, and testable.
    - **When**:
        - You want to separate the UI, business logic, and data.
        - You need to reuse the same Model with different Views or ViewModels.
        - You want to write unit tests for each component separately.

