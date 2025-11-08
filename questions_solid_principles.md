# SOLID Principles in Flutter: Clean, Scalable & Maintainable Code

The **SOLID principles** are five foundational design guidelines that help developers build **maintainable, scalable, and testable** Flutter applications. Originally coined by Robert C. Martin, these principles are **essential for avoiding technical debt** and enabling smooth collaboration in growing teams.

> *“SOLID is not just theory — it’s a practical framework for writing code that lasts.”*  
> — Levi Dourado

---

## S.O.L.I.D. — Quick Breakdown

| Letter | Principle                        | Core Idea |
|--------|----------------------------------|---------|
| **S**  | **Single Responsibility**        | One class → One job |
| **O**  | **Open/Closed**                  | Open for extension, closed for modification |
| **L**  | **Liskov Substitution**          | Subclasses must behave like their parents |
| **I**  | **Interface Segregation**        | Don’t force unused methods |
| **D**  | **Dependency Inversion**         | Depend on abstractions, not concretions |

---

## 1. Single Responsibility Principle (SRP)

> **"A class should have only one reason to change."**

Each class or widget should do **one thing well**.

### Bad Example (Too Many Responsibilities)
```dart
class UserManager {
  void saveUser(User user) { /* DB logic */ }
  bool validateUser(User user) { /* Validation */ }
  void sendWelcomeEmail(User user) { /* Email */ }
}
```

### Good Example (One Job Per Class)
```dart
class UserRepository { void save(User user); }
class UserValidator { bool isValid(User user); }
class EmailService { void sendWelcome(User user); }
```

> **Result:** Easier testing, debugging, and team collaboration.

---

## 2. Open/Closed Principle (OCP)

> **"Open for extension, closed for modification."**

Add new behavior **without changing existing code**.

### Bad Example (Modifying Core Logic)
```dart
class DiscountCalculator {
  double calculate(String type, double amount) {
    if (type == 'student') return amount * 0.1;
    if (type == 'senior') return amount * 0.15;
    // Keep adding ifs → violates OCP
  }
}
```

### Good Example (Extend via Strategy)
```dart
abstract class Discount { double apply(double amount); }

class StudentDiscount implements Discount {
  @override double apply(double amount) => amount * 0.1;
}

class DiscountCalculator {
  double calculate(Discount discount, double amount) =>
      discount.apply(amount);
}
```

> **Now add `SeniorDiscount`, `VIPDiscount` — no changes to `DiscountCalculator`!**

---

## 3. Liskov Substitution Principle (LSP)

> **"Subtypes must be substitutable for their base types."**

A `Square` should behave like a `Shape` — no surprises.

### Bad Example (Breaks Expectations)
```dart
class Rectangle {
  double width, height;
  double get area => width * height;
}

class Square extends Rectangle {
  @override set width(double w) { width = height = w; }
  @override set height(double h) { width = height = h; }
}
// Breaks if client sets width ≠ height
```

### Good Example (Proper Abstraction)
```dart
abstract class Shape { double get area; }

class Rectangle implements Shape {
  final double width, height;
  Rectangle(this.width, this.height);
  @override double get area => width * height;
}

class Square implements Shape {
  final double side;
  Square(this.side);
  @override double get area => side * side;
}
```

> **Safe substitution → Predictable behavior**

---

## 4. Interface Segregation Principle (ISP)

> **"Clients shouldn’t be forced to implement interfaces they don’t use."**

Avoid bloated interfaces.

### Bad Example (Robot Forced to Eat)
```dart
abstract class Worker {
  void work();
  void eat();
}

class Robot implements Worker {
  @override void work() { /* OK */ }
  @override void eat() { throw UnimplementedError(); } // Nonsense!
}
```

### Good Example (Granular Interfaces)
```dart
abstract class Workable { void work(); }
abstract class Eatable { void eat(); }

class Human implements Workable, Eatable { ... }
class Robot implements Workable { ... } // No eat() needed
```

> **Cleaner contracts → Less boilerplate**

---

## 5. Dependency Inversion Principle (DIP)

> **"Depend on abstractions, not concrete implementations."**

High-level modules shouldn’t depend on low-level details.

### Bad Example (Tight Coupling)
```dart
class UserService {
  final firestore = FirebaseFirestore.instance; // Hardcoded!
}
```

### Good Example (Inject Abstraction)
```dart
abstract class UserDataSource {
  Future<User> fetch(String id);
}

class FirebaseUserSource implements UserDataSource { ... }

class UserService {
  final UserDataSource source;
  UserService(this.source);
}
```

> **Swap Firebase → Mock → Hive? Just inject a new source!**

---

## One-Liner Memory Table (Cheat Sheet)

| Principle | One-Liner Memory Aid |
|---------|----------------------|
| **S**ingle Responsibility | *"One class, one job"* |
| **O**pen/Closed | *"Extend, don’t edit"* |
| **L**iskov Substitution | *"Child must act like parent"* |
| **I**nterface Segregation | *"Only implement what you need"* |
| **D**ependency Inversion | *"Depend on interfaces, not details"* |

> **Pro Tip:** Print this table & stick it on your desk!

---

## Why Use SOLID in Flutter?

| Benefit | Impact |
|-------|--------|
| **Reduced Technical Debt** | No more "quick fixes" breaking old code |
| **Easier Unit Testing** | Isolated responsibilities = simple mocks |
| **Scalable Architecture** | Add features without refactoring core |
| **Better Team Collaboration** | New devs understand code faster |

> *“SOLID turns chaotic codebases into structured, predictable systems.”*