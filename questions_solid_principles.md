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
