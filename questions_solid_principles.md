# 🧱 S.O.L.I.D — Quick Breakdown

| Letter | Principle                 | Core Idea                                   |
| ------ | ------------------------- | ------------------------------------------- |
| **S**  | **Single Responsibility** | One class → One job                         |
| **O**  | **Open/Closed**           | Open for extension, closed for modification |
| **L**  | **Liskov Substitution**   | Subclasses must behave like their parents   |
| **I**  | **Interface Segregation** | Don’t force unused methods                  |
| **D**  | **Dependency Inversion**  | Depend on abstractions, not concretions     |

---

# 1. Single Responsibility Principle (SRP)

> **"A class should have only one reason to change."**

This means every class should focus on a **single purpose**. Avoid combining multiple concerns (e.g., UI and business logic) into one class.
If a class handles too many tasks, it becomes harder to maintain, test, and extend.

---

## ❌ Bad Example — One Class Doing Too Much

```dart
class UserManager {
  void saveUser(User user) {
    // Save logic
  }

  bool validateUser(User user) {
    return user.name.isNotEmpty && user.email.contains('@');
  }
}
```

**Problem:** Saving + validation → multiple responsibilities.

---

## ✅ Good Example — Split Responsibilities

```dart
class UserService {
  void saveUser(User user) {
    // Logic for saving user
  }
}

class UserValidator {
  bool isValid(User user) {
    return user.name.isNotEmpty && user.email.contains('@');
  }
}
```

Each class has **one reason to change** → clean, testable, maintainable.

---

# 2. Open/Closed Principle (OCP)

> **"Open for extension, closed for modification."**

You should be able to **add new functionality** without **modifying existing code**.

In Dart:
Use **inheritance, interfaces, or polymorphism** to extend behavior instead of editing original classes.

---

## ❌ Bad Example — Modifying Class Every Time

```dart
class NotificationService {
  void send(String type, String message) {
    if (type == 'email') {
      print('Sending Email: $message');
    } else if (type == 'sms') {
      print('Sending SMS: $message');
    }
  }
}
```

Every time a new notification type appears → modify this class → violates OCP.

---

## ✅ Good Example — Extend Without Modify

```dart
abstract class Notification {
  void send(String message);
}

class EmailNotification extends Notification {
  @override
  void send(String message) {
    print('Sending Email: $message');
  }
}

class SMSNotification extends Notification {
  @override
  void send(String message) {
    print('Sending SMS: $message');
  }
}
```

Extend by creating **new classes**, no modification needed.

---

# 3. Liskov Substitution Principle (LSP)

> **"Subclasses should behave like their parent without breaking logic."**

Definition:
Objects of a superclass should be replaceable with objects of their subclass without breaking the application.

In Dart:
If a base class variable expects a parent type, passing a child type should behave correctly.

---

## ❌ Bad Example — Subclass Breaking Parent Behavior

```dart
class Bird {
  void fly() => print("Flying");
}

class Ostrich extends Bird {
  @override
  void fly() => throw Exception("Ostrich can't fly!");
}
```

Now replacing `Bird` with `Ostrich` breaks the program → violates LSP.

---

## ✅ Good Example — Refactor Hierarchy Properly

```dart
abstract class Bird {}

abstract class FlyingBird extends Bird {
  void fly();
}

class Sparrow extends FlyingBird {
  @override
  void fly() => print("Sparrow flying");
}

class Ostrich extends Bird {
  // Ostrich doesn't fly, so no fly method
}
```

Hierarchy respects natural behavior → LSP satisfied.

---

# 4. Interface Segregation Principle (ISP)

Definition:
Clients should not be forced to depend on interfaces they do not use.
Use smaller, more specific interfaces instead of large ones.

In Dart:
A class should only implement methods it actually needs.

---

## ❌ Bad Example — Forced to Implement Unused Methods

```dart
abstract class NotificationService {
  void sendEmail();
  void sendSMS();
}

class SMSNotification implements NotificationService {
  @override
  void sendEmail() => throw UnimplementedError();

  @override
  void sendSMS() {
    print("Sending SMS...");
  }
}
```

**Problem:** SMSNotification is forced to implement `sendEmail()`.

---

## ✅ Good Example — Split Interfaces

```dart
abstract class EmailSender {
  void sendEmail();
}

abstract class SmsSender {
  void sendSMS();
}

class EmailNotification implements EmailSender {
  @override
  void sendEmail() {
    print("Sending Email...");
  }
}

class SmsNotification implements SmsSender {
  @override
  void sendSMS() {
    print("Sending SMS...");
  }
}
```

Each class implements only what it needs → clean & flexible.

---

# 5. Dependency Inversion Principle (DIP)

Definition:
High-level modules should not depend on low-level modules; both should depend on abstractions.
This reduces tight coupling and makes code easy to swap & test.

In Dart:
Use **abstract classes or interfaces** for dependencies.

---

## ❌ Bad Example — High-Level Depends on Low-Level

```dart
class FirebaseDatabase {
  void saveData(String data) {
    print("Saving to Firebase: $data");
  }
}

class AppService {
  FirebaseDatabase db = FirebaseDatabase();

  void save(String data) {
    db.saveData(data);
  }
}
```

Hard to replace database → tight coupling.

---

## ✅ Good Example — Depend on Abstraction

```dart
abstract class Database {
  void saveData(String data);
}

class FirebaseDatabase implements Database {
  @override
  void saveData(String data) {
    print("Saving data to Firebase: $data");
  }
}

class AppService {
  final Database database;
  AppService(this.database);

  void save(String data) {
    database.saveData(data);
  }
}

void main() {
  Database firebaseDB = FirebaseDatabase();
  AppService appService = AppService(firebaseDB);
  appService.save("Some data");
}
```

Now the database can easily be replaced with MongoDB, LocalDB, MockDB, etc.

---