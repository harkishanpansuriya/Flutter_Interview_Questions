## What are Design Patterns?

- In software architecture, design patterns in Flutter are reusable blueprints for resolving common
  issues.

They are guidelines that influence how you design classes, objects, and interactions rather than
lines of code that you can copy.

👉 In short, they help developers write code that is modular, testable, and easy to extend. It helps
avoid the usual chaos when adding new features or revisiting the old codebase. These make every
Flutter design patterns guide more relevant as teams grow and codebases become complex.

## Why Use Design Patterns?

- Separation of Concerns: Separating UI logic from business logic (e.g., separating Widgets from API
  calls).
- Testability: Makes it much easier to write unit tests for your code.
- Scalability: Allows the app to grow without turning into "spaghetti code".
- Readability: New developers can understand the structure faster.

## 📂 Categories of Design Patterns

Design patterns are divided into 3 main categories:

### 1. Creational

**How objects are created**

* Examples: Singleton, Factory Method

### 2. Structural

**how classes and objects are composed**

* Examples: Adapter, Decorator

### 2. Behavioral

**how objects communicate**

* Examples: Strategy, Observer

## How Does This Result In Low-Cost Project Maintenance?

- Reduced Reworks: When adding or updating features, well-structured code reduces the likelihood of
  unexpected delays.
- Consistent Performance: As the app expands, its stable architecture guarantees seamless operation.
- Faster Delivery: Developers save time and money by spending more time on building rather than on
  fixing.
- Extended App Life: Your app will remain future-ready without requiring significant redesigns
  thanks to its clean, scalable design.
- Improved ROI: The client will save money over time thanks to fewer bugs, faster updates, and
  simple scalability.

## How Design Patterns Are Categorized (Gang of Four)

### 1. Creational Design Patterns

- Creational design patterns focus on how objects are created and managed in an application. Instead
  of instantiating classes directly in different places, these patterns centralize and control
  object creation. This improves flexibility, scalability, and testability.

Here are some common Creational Patterns in Flutter and Dart:

- **Singleton**: To ensure only one instance of a class exists throughout the app (like configuration,
  logging service). Flutter tip: Prefer DI (`get_it`, `injectable`)
  Flutter tip: In modern apps we prefer DI (get_it/injectable) over manual singletons.
- **Factory Method**: To delegate object creation to subclasses or factory functions (for example,
  creating widgets dynamically based on type)
- **Builder**: To construct complex objects step by step (e.g., creating detailed models or complex UI
  layouts).
- **Prototype**: To create new objects by copying existing ones (useful for caching or reusing similar
  objects).
- **Dependency Injection (DI)**: To manage how dependencies are provided to classes (common in large
  Flutter projects using get_it or injectable).

These patterns simplify creation logic and decouple “how to build” from “how to use.” This makes the
Flutter design patterns guide essential for teams building scalable apps.

Now, let’s see one of the most widely used: the Singleton Pattern.

Example: Singleton Pattern

The Singleton pattern is a creational design pattern that ensures a class has only one instance and
provides a global access point to that instance.

- Guarantees only a single instance of a class throughout the application.
- Provides a shared, globally accessible reference without uncontrolled instantiation.
- Simplifies coordination between core services such as logging, configuration, or caching.

Use Cases

- App-wide configuration or environment setup that remains consistent across the app.
- Shared services like API clients, loggers, or analytics.
- Maintaining centralized resources (as an example, a database or cache handler).
- Instead of manually creating Singleton classes, modern Flutter projects often use dependency
  injection tools like get_it and injectable. They make code more testable, maintainable, and easier
  to manage in large-scale apps.

### 2. Structural Design Patterns

- Structural patterns define how classes and objects fit together to form efficient and maintainable
  structures. They simplify relationships between modules so that the codebase remains flexible.
- In Flutter, they align naturally with widget composition, service abstraction, and UI
  architecture.
- These patterns further strengthen your use of Flutter design patterns as your project grows.

The common Structural Patterns include the following.

- **Adapter**: Converts one interface into another so incompatible classes can work together.
- **Decorator**: Dynamically adds new behavior or responsibilities to an object without altering its
  structure.
- **Facade**: Provides a simplified interface to a complex subsystem (for example, wrapping multiple
  Firebase services).
- **Composite**: Composes objects into tree structures. Flutter’s widget tree itself is a great example.
- **Proxy**: Controls access to another object, often used for caching or network throttling.

These patterns become essential as projects scale, and they strengthen the use of design patterns in
Flutter for large applications.

Example: Facade Pattern in Flutter

The Facade Pattern is a structural design pattern that provides a simple interface to a complex
subsystem. Meaning, instead of exposing multiple classes and dependencies directly, it wraps them
under one unified entry point, hiding the complexity from the rest of the codebase.

It simplifies how different parts of the system interact.

Also promotes cleaner, more readable code by exposing only what’s necessary.

The facade makes the system easier to maintain and extend, as changes stay behind the facade.

### 3. Behavioral Design Patterns

Behavioral design patterns focus on how objects communicate and collaborate to perform tasks.

They define clear interaction rules between objects and ensure that responsibilities are
well-distributed and that changes in one part of the code don’t create chaos elsewhere.

These patterns are especially important in the part where the UI reacts to data and user
interactions. They help manage state changes, event flows, and command handling in a predictable
way.

The common Behavioral Patterns include:

- **Observer**: Defines a one-to-many relationship where changes in one object automatically update its
  dependents (Streams, ValueNotifier).
- **Strategy**: Allows switching between algorithms or behaviors at runtime (different validation or
  sorting strategies).
- **Command**: Encapsulates actions as objects (implementing undo/redo functionality).
- **State**: Lets an object change its behavior when its internal state changes (common in BLoC, Cubit,
  or Provider).
- **Mediator**: Coordinates communication between different objects without them referring to each other
  directly.

Example: Strategy Pattern in Flutter

The Strategy Pattern is a behavioral design pattern that lets you define a family of algorithms,
encapsulate them, and make them interchangeable. It helps separate the logic of choosing which
algorithm to use from how it’s implemented.

- Encapsulates different strategies (algorithms or implementations) under a common interface.
- Makes it easy to switch or extend behaviors at runtime without modifying existing code.
- Encourages dependency inversion, higher-level modules depend on abstractions, not concrete
  implementations.

## Mini Examples (talk through these)

Singleton (via DI):
“Ensures one instance, one global access point. Use for app config or API client. In Flutter we
usually register it as lazy singleton in get_it to keep it testable.”

Facade:
“UserRepositoryFacade exposes login(), logout(), hides FirebaseAuth + Firestore + Crashlytics. UI
calls one clean method; complexity stays behind the facade.”

Strategy:
“PaymentStrategy interface with CardPay, UpiPay, CodPay. Checkout screen depends on the interface,
not concrete class → we can add wallets without touching UI.”