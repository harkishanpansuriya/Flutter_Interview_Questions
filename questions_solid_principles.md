# 🎨 SOLID Principles in Dart 🚀

### **What is SOLID?**

SOLID is a set of five key principles that help us write clean, maintainable, and scalable code in *
*Dart** (or any object-oriented language).

☞ **S** — Single Responsibility Principle (SRP)  
☞ **O** — Open/Closed Principle (OCP)  
☞ **L** — Liskov Substitution Principle (LSP)  
☞ **I** — Interface Segregation Principle (ISP)  
☞ **D** — Dependency Inversion Principle (DIP)

**simplified summary** of the **SOLID** principles:

### **1️⃣ Single Responsibility Principle (SRP)**

💡 **A class should have only one reason to change.**  
Each class should **only do one job** to keep code **clean and easy to maintain**.

### **2️⃣ Open/Closed Principle (OCP)**

💡 **Code should be open for extension but closed for modification.**  
You should be able to **add new features** without **changing existing code**.

### **3️⃣ Liskov Substitution Principle (LSP)**

💡 **Subclasses should replace their parent class without breaking the code.**  
If a class inherits from another, it **must behave in the same expected way**.

### **4️⃣ Interface Segregation Principle (ISP)**

💡 **A class should not be forced to implement methods it does not need.**  
Instead of **one big interface**, use **smaller, more specific ones**.

### **5️⃣ Dependency Inversion Principle (DIP)**

💡 **High-level modules should not depend on low-level modules. Both should depend on abstractions.
**  
Depend on **interfaces/abstract classes** rather than **concrete implementations** to keep things
flexible.

---

## **1️⃣ Single Responsibility Principle (SRP)**

💡 **A class should have only one job (one reason to change).**

### ✅ **Good Example**

Each class has a single role:

```dart
class User {
  String name, email;

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

### ❌ **Bad Example**

This class does **too many things**:

```dart
class User {
  String name, email;

  User(this.name, this.email);

  void save() {
    // ❌ Handles database logic (should be separate)
  }
}
```

---

## **2️⃣ Open/Closed Principle (OCP)**

💡 **Code should be open for extension but closed for modification.**

### ✅ **Good Example**

We can **extend behavior** without modifying existing code:

```dart
abstract class Shape {
  double area();
}

class Rectangle extends Shape {
  double width, height;

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

### ❌ **Bad Example**

New shapes require modifying the class:

```dart
class Shape {
  String type;
  double width, height, radius;

  double area() {
    if (type == 'rectangle') return width * height;
    if (type == 'circle') return 3.14 * radius * radius;
    return 0;
  }
}
```

---

## **3️⃣ Liskov Substitution Principle (LSP)**

💡 **A subclass should replace its parent without breaking functionality.**

### ✅ **Good Example**

Every subclass follows the expected behavior:

```dart
abstract class Bird {
  void fly();
}

class Sparrow extends Bird {
  @override
  void fly() => print("Sparrow is flying");
}
```

### ❌ **Bad Example**

Ostrich **cannot fly**, violating expectations:

```dart
class Bird {
  void fly() => print("Bird is flying");
}

class Ostrich extends Bird {
  @override
  void fly() {
    throw Exception("Ostriches can't fly!"); // ❌ Violates LSP
  }
}
```

---

## **4️⃣ Interface Segregation Principle (ISP)**

💡 **A class should only implement what it needs.**

### ✅ **Good Example**

Separate interfaces for specific responsibilities:

```dart
abstract class Printer {
  void printDocument();
}

abstract class Scanner {
  void scanDocument();
}

class AllInOnePrinter implements Printer, Scanner {
  @override
  void printDocument() {}

  @override
  void scanDocument() {}
}

class SimplePrinter implements Printer {
  @override
  void printDocument() {}
}
```

### ❌ **Bad Example**

A class is forced to implement unwanted methods:

```dart
abstract class Machine {
  void printDocument();

  void scanDocument();
}

class SimplePrinter implements Machine {
  @override
  void printDocument() {}

  @override
  void scanDocument() {} // ❌ Not needed, but forced to implement
}
```

---

## **5️⃣ Dependency Inversion Principle (DIP)**

💡 **High-level modules should depend on abstractions, not concrete classes.**

### ✅ **Good Example**

Depends on an **abstract class**, making it flexible:

```dart
abstract class Database {
  void save(String data);
}

class MySQLDatabase implements Database {
  @override
  void save(String data) {
    // Save to MySQL
  }
}

class UserRepository {
  final Database database;

  UserRepository(this.database);

  void save(String data) => database.save(data);
}

void main() {
  Database db = MySQLDatabase();
  UserRepository repo = UserRepository(db);
  repo.save("User data");
}
```

### ❌ **Bad Example**

Tightly coupled with a **specific database class**:

```dart
class MySQLDatabase {
  void save(String data) {}
}

class UserRepository {
  final MySQLDatabase database; // ❌ Hard dependency
  UserRepository(this.database);

  void save(String data) => database.save(data);
}
```

---

## **📌 Conclusion**

🔹 **SRP** → One class = One responsibility  
🔹 **OCP** → Extend without modifying  
🔹 **LSP** → Subclasses must behave like parents  
🔹 **ISP** → No unnecessary methods  
🔹 **DIP** → Depend on abstractions, not concrete classes

By following SOLID principles, your **Dart/Flutter** code will be **cleaner, easier to maintain, and
more scalable**! 🚀🔥
