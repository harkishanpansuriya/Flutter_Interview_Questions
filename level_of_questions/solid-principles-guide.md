# 🧱 S.O.L.I.D — Quick Breakdown

| Letter | Principle                 | Core Idea                                   |
|--------|---------------------------|---------------------------------------------|
| **S**  | **Single Responsibility** | One class → One job                         |
| **O**  | **Open/Closed**           | Open for extension, closed for modification |
| **L**  | **Liskov Substitution**   | Subclasses must behave like their parents   |
| **I**  | **Interface Segregation** | Don’t force unused methods                  |
| **D**  | **Dependency Inversion**  | Depend on abstractions, not concretions     |

💡 Why it matters
Following SOLID keeps code maintainable, testable, and scalable as your app grows.

---

# 1. Single Responsibility Principle (SRP)

> **"A class or widget should have only one reason to change. In other words, each widget or class
must have single responsibility"**

Example: UI classes only render UI; repositories only fetch or store data.

---

## ❌ Bad Example — Combining UI, validation, networking, persistence, and navigation in one class ((Too many responsibilities)).

```dart
class UserManager {
  void showUserUI() {} // UI
  bool validateUser() => true; // Validation
  void saveToDb() {} // Data persistence
  void callApi() {} // Networking
  void navigate() {} // Navigation
}
```

Problem: Multiple responsibilities in a single class → hard to maintain and test.

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

Each class has one reason to change → clean, testable, and maintainable.

---

# 2. Open/Closed Principle (OCP)

> **"Open for extension, closed for modification."**

Software entities should be open for extension, but closed for modification.

Example: Create abstract button styles. Add new styles without changing the main CustomButton widget.

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

Adding a new notification type requires modifying the class → violates OCP.

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

Extend by creating new classes, no modification to existing code.

---

# 3. Liskov Substitution Principle (LSP)

> **"Subclasses should work wherever their parent is used."**

Use child classes wherever the parent type is expected without errors.

Example: Replace ApiDataFetcher with MockDataFetcher in tests — no extra code changes.

---

## ❌ Bad Example — Subclass Breaking Parent Behavior

```dart
// ❌ Violates LSP: replacing parent breaks expected behavior

class ApiDataFetcher {
  String fetchData() => "Fetching data from API...";
}

class MockDataFetcher extends ApiDataFetcher {
  @override
  String fetchData() {
    throw Exception("Cannot fetch data in mock!");
  }
}
```

Problem: Anywhere you expect an ApiDataFetcher, substituting MockDataFetcher will break the program → violates LSP.

---

## ✅ Good Example — Refactor Hierarchy Properly

```dart
abstract class DataFetcher {
  String fetchData();
}

class ApiDataFetcher extends DataFetcher {
  @override
  String fetchData() => "Fetching data from API...";
}

class MockDataFetcher extends DataFetcher {
  @override
  String fetchData() => "Returning mock data...";
}
```

Why this is good:
Both subclasses follow the contract of DataFetcher. You can replace ApiDataFetcher with MockDataFetcher in tests without breaking the code → LSP satisfied.

---

# 4. Interface Segregation Principle (ISP)

Clients should not be forced to depend on interfaces they do not use. Instead of creating a large
interface, split it into smaller, focused interfaces that the client actually needs.

Example: Email services implement only email; push services implement only push.

---

## ❌ Bad Example — Forced to Implement Unused Methods

```dart
abstract class NotificationService {
  void sendEmail(String message);

  void sendPush(String message);
}
```

Problem: Implementing services are forced to include methods they don’t need → tight coupling.

---

## ✅ Good Example — Split Interfaces

```dart
abstract class EmailService {
  void sendEmail(String message);
}

abstract class PushService {
  void sendPush(String message);
}

class MyEmailService implements EmailService {
  @override
  void sendEmail(String message) {
    print('Sending Email: $message');
  }
}

class MyPushService implements PushService {
  @override
  void sendPush(String message) {
    print('Sending Push Notification: $message');
  }
}
```

Each service implements only the interface it actually needs. Email services handle email; push
services handle push.

---

# 5. Dependency Inversion Principle (DIP)

Definition:
High-level modules should not depend on low-level modules; both should depend on abstractions.

Core IDEA: Depend on abstract interfaces, not concrete classes — making the system flexible,
testable, and easy to replace or extend.

In Dart: Use abstract classes or interfaces for dependencies.

Example: UI depends on MessagingService abstraction instead of EmailService.

---

## ❌ BAD Example: UI depends directly on a concrete service

```dart
class User {
  final EmailService _emailService = EmailService();

  void sendMessage(String message) {
    _emailService.sendMessage(message);
  }
}

```

Problem: User is tightly coupled to EmailService → hard to switch to SmsService.

---

## ✅ GOOD Example: Depend on an abstraction

```dart
// MessagingService Interface
abstract class MessagingService {
  void sendMessage(String message);
}

// Email Service
class EmailService implements MessagingService {
  @override
  void sendMessage(String message) {
    print("Sending email: $message");
  }
}

// SMS Service
class SmsService implements MessagingService {
  @override
  void sendMessage(String message) {
    print("Sending SMS: $message");
  }
}

```

Explanation:

Now User can depend on MessagingService, making switching implementations easy → DIP satisfied.

---
