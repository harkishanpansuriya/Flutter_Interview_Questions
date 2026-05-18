## What is State & Why Use State Management Instead of `setState`?

- **State:**
  - **Definition:** State is the **data or information** that controls how a widget looks and
    behaves.
  - When state changes, the UI updates automatically.

---

#### **Using `setState()`**

- ✅ Directly updates state and rebuilds the widget
- ⚠️ Rebuilds the **entire widget subtree** (not whole app)
- Suitable for **small and simple UI updates**

---

#### **Why Use State Management?**

- **Efficient** → Updates only the **required widgets**
- **Scalable** → Better for **large and complex apps**
- **Maintainable** → Keeps business logic separate from UI
- **Popular Solutions** → `Provider`, `Riverpod`, `Bloc`

---

In short, state controls the UI, `setState` is useful for simple local updates, and state management
is used for efficient, scalable, and maintainable apps.

## Differance between InheritedWidget & InheritedModel

- InheritedWidget and InheritedModel are both used to share data down the widget tree, but
  InheritedModel is more optimized for selective rebuilds.
- In simple terms, InheritedWidget rebuilds all dependent widgets when data changes, while
  InheritedModel rebuilds only the widgets that depend on a specific part of the data.

With InheritedWidget, if any value changes, all widgets using it will rebuild. But with
InheritedModel, we can divide data into parts (called aspects), and only widgets that use that
specific aspect will rebuild.

Provider is built on top of InheritedWidget to simplify its usage.

## Dependency Injection vs Service Locator

Dependency Injection provides dependencies from outside, while Service Locator retrieves them
internally from a central registry.

### Dependency Injection (DI)

- Dependencies are **given externally** (via constructor/setter).
- Promotes loose coupling & testability.
- Example: `UserController(AuthService())`

### Service Locator (SL)

- Dependencies are **looked up internally** from a central registry.
- Quick access but hides dependencies (less transparent).
- Example: `ServiceLocator.get<AuthService>()`

## Key Difference

- **DI = give** → Dependencies injected from outside.
- **SL = find** → Dependencies fetched from a registry.

## Explain Flutter state management approaches

Answer: Flutter separates UI and state. Common approaches:

setState – Simple local state.

Provider / ChangeNotifier – Lightweight reactive state.

Bloc / Cubit – Event-driven state with separation of UI and logic.

Riverpod – Improved dependency injection and reactive state.

## What is the difference between InheritedWidget and Provider?

InheritedWidget – Built-in Flutter widget for sharing data down the widget tree.

Provider – A wrapper over InheritedWidget offering simpler syntax, dependency injection, and rebuild
management.

## What is the difference between setState(), Provider, and Bloc for state management in Flutter?

* **setState():** Manages local widget state; triggers rebuilds but doesn’t persist state across
  widget recreation.
* **Provider:** Simple, scalable solution for app-wide state using dependency injection.
* **Bloc (Business Logic Component):** Uses streams to handle state changes reactively; ideal for
  complex applications with structured state management.

  