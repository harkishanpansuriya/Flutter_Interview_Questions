# Singleton Design Pattern in Flutter

## What is Singleton?

A Singleton is a design pattern that makes sure only one object of a class is created. This single
object can be used throughout the app wherever needed. In Flutter, you can use the Singleton pattern
to easily share one instance of a class across the entire app. This is particularly useful for
managing shared resources like network connections,
databases, or app configurations.

## Why and when to use Singleton in Flutter?

- Managing Shared Resources: Singleton can be used For example, a single instance of a database
  manager, API service, Theme manager or logging system.
- Saving Memory: Avoids creating multiple copies of the same object, which reduces resource usage.
- Easy Access: Provides a single, global access point to important functionality like app
  configuration, authentication, or settings.
- Consistency: Ensures that all parts of your app are using the same instance with the same state.

## Implementation in Dart (Flutter)

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

## Advantages of Singleton

1. Ensures a single instance of the class.
2. Reduces memory usage by avoiding duplicate instances.
3. Provides a global access point to the instance.

## Disadvantages of Singleton

1. Introduces global state, which can make testing and debugging more difficult.
2. Can lead to tight coupling if overused.
3. May be a bottleneck in multithreaded environments if not handled correctly.

## Best Practices for Singleton

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