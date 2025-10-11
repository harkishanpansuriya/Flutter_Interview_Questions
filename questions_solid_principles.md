
# SOLID Principles in Flutter

The SOLID principles are a set of five design principles that help developers create maintainable and scalable software. They are widely applicable in object-oriented programming, and you can certainly apply them in Flutter when building your Flutter apps.

## S.O.L.I.D. STANDS FOR:

☞ S — Single responsibility principle  
☞ O — Open closed principle  
☞ L — Liskov substitution principle  
☞ I — Interface segregation principle  
☞ D — Dependency Inversion principle

---

## Single Responsibility Principle (SRP)

**Principle:** A class should have only one reason to change.  

In Flutter, this means that each class or module should have only one responsibility or job.  
For example, if you’re building a to-do list app, you might have a separate class for managing the data (e.g., `TaskRepository`) and a separate class for rendering the UI (e.g., `TaskListWidget`).

```dart
// Example of adhering to SRP:
class TaskRepository {
  // methods to fetch, add, and update tasks
}

class TaskListWidget extends StatelessWidget {
  // UI code to display a list of tasks
}
````

---

## Open/Closed Principle (OCP)

**Principle:** Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification.

In Flutter, you can achieve this by using inheritance, composition, or interfaces to allow for future extensions without modifying existing code.

```dart
// Example of adhering to OCP:
abstract class Shape {
  void draw();
}

class Circle implements Shape {
  @override
  void draw() {
    // Draw a circle
  }
}

class Square implements Shape {
  @override
  void draw() {
    // Draw a square
  }
}
```

---

## Liskov Substitution Principle (LSP)

**Principle:** Subtypes must be substitutable for their base types without altering the correctness of the program.

In Flutter, this means that subclasses should be able to replace their parent class without causing issues.
This is crucial when dealing with widget hierarchies.

```dart
// Example of adhering to LSP:
class Animal {
  void makeSound() {
    print('Animal makes a sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Dog barks');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Cat meows');
  }
}

void main() {
  Animal myPet = Dog();
  myPet.makeSound(); // Outputs: "Dog barks"
}
```

---

## Interface Segregation Principle (ISP)

**Principle:** Clients should not be forced to depend on interfaces they do not use.

In Flutter, you can apply ISP by creating specific interfaces for different use cases rather than having a large, monolithic interface.

```dart
// Example of adhering to ISP:
abstract class CanSwim {
  void swim();
}

abstract class CanFly {
  void fly();
}

class Bird implements CanFly {
  @override
  void fly() {
    // Fly like a bird
  }
}

class Fish implements CanSwim {
  @override
  void swim() {
    // Swim like a fish
  }
}
```

---

## Dependency Inversion Principle (DIP)

**Principle:** High-level modules should not depend on low-level modules. Both should depend on abstractions.

In Flutter, you can achieve DIP by using dependency injection, abstract classes, and interfaces to ensure that high-level and low-level modules depend on abstractions rather than concrete implementations.

```dart
// Example of adhering to DIP:
abstract class WeatherService {
  Future<String> getWeather();
}

class OpenWeatherMapService implements WeatherService {
  @override
  Future<String> getWeather() {
    // Fetch weather data from OpenWeatherMap
  }
}

class WeatherApp {
  final WeatherService weatherService;

  WeatherApp(this.weatherService);

  Future<void> displayWeather() async {
    final weather = await weatherService.getWeather();
    print('Weather: $weather');
  }
}
```

---

## 📌 SOLID Cheat Sheet (Quick Reference)

| Principle                     | Easy Definition                                       | How to Remember                     |
| ----------------------------- | ----------------------------------------------------- | ----------------------------------- |
| **S — Single Responsibility** | One class = one role, one reason to change            | "One class, one job"                |
| **O — Open/Closed**           | Extend behavior without changing old code             | "Open to extend, closed to modify"  |
| **L — Liskov Substitution**   | Child class should replace parent safely              | "Child must act like parent"        |
| **I — Interface Segregation** | No class should be forced to implement unused methods | "Only what you need"                |
| **D — Dependency Inversion**  | Depend on abstractions, not concrete classes          | "Depend on interfaces, not details" |

