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

Core Idea: Give each class only one job, so changes in one area don’t break everything else.

---

## ❌ Bad Example — Combining UI, validation, networking, persistence, and navigation in one class ((Too many responsibilities)).

```dart
class UserManager {
  void showUserUI() {}          // UI
  bool validateUser() => true;  // Validation
  void saveToDb() {}            // Data persistence
  void callApi() {}             // Networking
  void navigate() {}            // Navigation
}
```

**Problem:** Saving + validation → multiple responsibilities.

---

## ✅ Good Example — Split Responsibilities

```dart
class UserValidator {
  bool validateUser() => true;
}

class UserRepository {
  void saveToDb() {}
}

class UserApiService {
  void callApi() {}
}

class UserNavigator {
  void navigate() {}
}
```

Each class has **one reason to change** → clean, testable, maintainable.

---

# 2. Open/Closed Principle (OCP)

> **"Open for extension, closed for modification."**

You should be able to **add new feature** without **modifying existing code**.

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

Core Idea: You should be able to use a child class wherever the parent class is expected — without errors or surprises.

Definition:
Objects of a superclass should be replaceable with objects of their subclass without breaking the application.

In Dart:
If a base class variable expects a parent type, passing a child type should behave correctly.

---

## ❌ Bad Example — Subclass Breaking Parent Behavior

```dart
class FileReader {
  String read() => "Reading file...";
}

class EncryptedFileReader extends FileReader {
  @override
  String read() {
    throw Exception("Cannot read encrypted file directly!");
  }
}
```

Why is this bad?
Anywhere you expect a FileReader, substituting EncryptedFileReader will break the program, violating LSP.

---

## ✅ Good Example — Refactor Hierarchy Properly

```dart
abstract class FileReader {
  String read();
}

class PlainFileReader extends FileReader {
  @override
  String read() => "Reading normal file...";
}

class EncryptedFileReader extends FileReader {
  @override
  String read() => "Decrypting and reading encrypted file...";
}
```

Why is this good?
Both subclasses follow the contract — they successfully “read” the file.
No unexpected errors → LSP satisfied.
---

# 4. Interface Segregation Principle (ISP)

Core IDEA: Use small, focused interfaces so classes only implement what they actually need.

In Dart:
A class should only implement methods it actually needs.

---

## ❌ Bad Example — Forced to Implement Unused Methods

```dart
abstract class AuthRepository {
  Future<void> loginEmail(String e, String p);
  Future<void> loginGoogle();
  Future<void> loginPhone(String phone);
  Future<void> getUserReport();
  Future<void> exportUserData();
}
```

**Problem:** SMSNotification is forced to implement `sendEmail()`.

---

## ✅ Good Example — Split Interfaces

```dart
abstract class EmailAuth {
  Future<void> loginEmail(String e, String p);
}

abstract class SocialAuth {
  Future<void> loginGoogle();
}
abstract class AdminAuthOps {
  Future<void> getUserReport();
}
```

Each class implements only what it needs → clean & flexible.

---

# 5. Dependency Inversion Principle (DIP)

Definition:
High-level modules should not depend on low-level modules; both should depend on abstractions.

Core IDEA: Depend on abstract interfaces, not concrete classes — making the system flexible, testable, and easy to replace or extend.

In Dart:
Use **abstract classes or interfaces** for dependencies.

---

## ❌ BAD Example: UI depends directly on Dio.

```dart
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final Dio _dio = Dio();
  Future<void> fetchProducts() async {
    final response = await _dio.get('https://api.my-shop.com/products');
    print(response.data);
  }
  @override
  Widget build(BuildContext context) => Container();
}
```

Hard to replace database → tight coupling.

---

## ✅ GOOD Example: Depend on repository abstraction.

```dart
abstract class ProductRepository {
  Future<List<String>> fetchProducts();
}

class DioProductRepository implements ProductRepository {
  final Dio _dio = Dio();
  @override
  Future<List<String>> fetchProducts() async {
    final response = await _dio.get('https://api.my-shop.com/products');
    return (response.data as List).map((e) => e.toString()).toList();
  }
}
class ProductPage extends StatelessWidget {
  final ProductRepository repository;
  const ProductPage({super.key, required this.repository});
  void loadData() async {
    final products = await repository.fetchProducts();
    print(products);
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loadData,
      child: const Text('Load Products'),
    );
  }
}
```

Now the database can easily be replaced with MongoDB, LocalDB, MockDB, etc.

---

Tips for Flutter developers:

Apply SRP first: small, focused classes.
Use OCP for UI components and feature extensions.
Follow LSP when designing inheritance hierarchies.
Break fat interfaces into minimal, client-specific contracts (ISP).
Depend on abstractions and inject dependencies (DIP) for testable, flexible code.