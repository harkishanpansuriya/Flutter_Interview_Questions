# Common GetX Interview Questions

## What is GetX and what are its three core pillars?

GetX is an ultra-lightweight and powerful Flutter framework that provides state management, dependency injection, and route management in a single package.

The three core pillars of GetX are:

1. **State Management** – Manage UI state efficiently with minimal boilerplate.
2. **Dependency Injection** – Easily inject and access dependencies without using `BuildContext`.
3. **Route Management** – Perform navigation, dialogs, and snackbars without context.

Because GetX combines all three features in one package, it significantly reduces boilerplate and speeds up development.

---

## What are the core components of GetX?

The main components are:

* **GetxController** → A class where you write business logic and manage state.
* **Rx types (.obs)** → Observable variables (e.g., `RxInt`, `RxString`) that trigger UI updates when changed.
* **Obx** → A widget that automatically rebuilds when any `.obs` variable inside it changes.
* **GetBuilder** → A widget for simple state management that rebuilds only when `update()` is called.
* **Get.put()** → Used to inject a dependency (controller/service) into the GetX memory.
* **Get.find()** → Used to retrieve an injected dependency from anywhere in the app.
* **Get.to() / Get.off() / Get.offAll()** → Methods for navigation without needing `BuildContext`.
* **GetMaterialApp** → A replacement for `MaterialApp` that enables GetX's navigation and dependency features.

---

## What is the difference between reactive state management (Rx variables) and simple state management in GetX?

### Reactive State Management

Reactive state management uses observable (`.obs`) variables.

The UI updates automatically whenever the observed value changes.

You do not need to manually trigger UI updates.

```dart
final count = 0.obs;
```

Use reactive state management for:

* Real-time updates
* Notification badges
* Dark mode switching
* Form validation

### Simple State Management

Simple state management uses `GetBuilder`.

You must explicitly call `update()` to rebuild the UI.

```dart
count++;
update();
```

Use simple state management when:

* Memory usage is important
* UI updates are less frequent
* Multiple widgets need to rebuild together

---

## What is the difference between Obx and GetBuilder? When should you use one over the other?

### Obx

`Obx` automatically listens to reactive (`.obs`) variables and rebuilds whenever those values change.

Use `Obx` when:

* State changes frequently
* Granular UI updates are required

Example:

```dart
Obx(() => Text(controller.count.value.toString()));
```

### GetBuilder

`GetBuilder` rebuilds only when `update()` is manually called.

Use `GetBuilder` when:

* Performance and memory optimization are critical
* Updates happen less frequently

Example:

```dart
GetBuilder<HomeController>(
  builder: (controller) {
    return Text(controller.count.toString());
  },
);
```

---

## What is GetX widget, and how does it differ from Obx?

`GetX<T>` is a reactive widget that can both initialize a controller and listen to its reactive variables.

`Obx` only listens to reactive variables and assumes that the controller already exists.

Use `GetX<T>` when you want automatic controller initialization and dependency lookup.

In most projects, developers commonly use `Obx` because it has simpler syntax.

---

## How do you define a reactive variable in GetX?

Reactive variables are created by adding `.obs` to any value.

Example:

```dart
final count = 0.obs;
final isLoading = false.obs;
final name = ''.obs;
```

Whenever these values change, widgets wrapped inside `Obx` rebuild automatically.

```dart
count.value++;
```

---

## What is the purpose of update() in a GetxController? Which widget responds to it?

`update()` manually notifies listeners that the state has changed.

Only `GetBuilder` widgets respond to `update()`.

Example:

```dart
void increment() {
  count++;
  update();
}
```

`Obx` ignores `update()` because it listens to reactive variables automatically.

---

## What are Worker methods in GetX (ever, once, debounce, interval), and what are their real-world use cases?

Workers automatically execute callbacks whenever reactive variables change.

### ever()

Runs every time the variable changes.

Use cases:

* Analytics tracking
* Auto-saving forms

### once()

Runs only the first time the value changes.

Use cases:

* Welcome popup
* First login event

### debounce()

Waits until the user stops changing the value before executing.

Use cases:

* Search API calls

### interval()

Ignores rapid changes and triggers at fixed intervals.

Use cases:

* Preventing button spamming
* GPS updates

Example:

```dart
debounce(searchText, (_) {
  fetchData();
}, time: Duration(milliseconds: 500));
```

---

## How does GetX handle Dependency Injection (DI) without using BuildContext?

GetX stores dependencies inside an internal global registry.

Dependencies are registered using:

```dart
Get.put(HomeController());
```

They can then be accessed anywhere using:

```dart
Get.find<HomeController>();
```

Since dependencies are stored globally, `BuildContext` is not required.

---

## What is the difference between Get.put() and Get.lazyPut()?

### Get.put()

Creates the dependency immediately and stores it in memory.

```dart
Get.put(HomeController());
```

### Get.lazyPut()

Delays object creation until it is first requested using `Get.find()`.

```dart
Get.lazyPut(() => HomeController());
```

I usually use:

* `Get.put()` for immediately required dependencies.
* `Get.lazyPut()` for screen-specific dependencies.

---

## What is the difference between Get.put() and Get.spawn()?

### Get.put()

Creates a singleton instance.

Every `Get.find()` returns the same object.

### Get.spawn()

Creates a new instance every time `Get.find()` is called.

Use `Get.spawn()` when every screen should have its own independent controller.

---

## What are Bindings in GetX, and why are they important for clean architecture?

Bindings are classes responsible for dependency injection.

Instead of creating controllers inside UI files, dependencies are registered inside Binding classes.

Example:

```dart
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
```

Bindings help:

* Separate UI from dependency creation
* Improve maintainability
* Automatically dispose controllers

---

## How does Get.find() look up dependencies under the hood?

When a dependency is registered using `Get.put()` or `Get.lazyPut()`, GetX stores it inside an internal map.

`Get.find<T>()` searches this map using the object type as the key.

If the dependency was registered using `lazyPut`, GetX creates it only when first requested.

---

## How does GetX manage the lifecycle of a controller?

GetX controllers provide lifecycle methods:

```dart
onInit()
onReady()
onClose()
```

When the associated route is removed, GetX automatically disposes controllers unless marked as permanent.

---

## What does permanent: true do inside Get.put(), and when would you use it?

`permanent: true` prevents GetX from automatically disposing the dependency.

Example:

```dart
Get.put(AuthController(), permanent: true);
```

Use it for:

* Authentication service
* Theme controller
* Local database service

---

## How do you perform named and nameless routing using GetX?

### Nameless Routing

```dart
Get.to(() => DetailsScreen());
```

### Named Routing

```dart
Get.toNamed('/details');
```

Named routes are generally preferred in large applications.

---

## How do you remove the current screen or clear the entire navigation stack?

### Replace current screen

```dart
Get.off(HomeScreen());
```

### Clear entire stack

```dart
Get.offAll(HomeScreen());
```

Common examples:

* Login → Home
* Splash → Dashboard

---

## How do you implement middleware or authentication guards in GetX routing?

Create a class extending `GetMiddleware` and override `redirect()`.

Example:

```dart
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return isLoggedIn
        ? null
        : RouteSettings(name: '/login');
  }
}
```

Middleware is commonly used for:

* Authentication
* Authorization
* Role-based access

---

## How do you pass arguments between screens using GetX?

Pass arguments:

```dart
Get.to(DetailsScreen(), arguments: user);
```

Receive arguments:

```dart
final user = Get.arguments;
```

For URL parameters:

```dart
final id = Get.parameters['id'];
```

---

## What is GetConnect and how does it help with API management?

GetConnect is GetX's built-in HTTP client.

It simplifies:

* API calls
* Interceptors
* Authentication headers
* Request/Response handling

Example:

```dart
class ApiService extends GetConnect {
  Future<Response> getUsers() => get('/users');
}
```

---

## What is the purpose of GetMaterialApp instead of MaterialApp?

`GetMaterialApp` enables all GetX features such as:

* Navigation without context
* Dependency injection
* Snackbars
* Dialogs
* Localization

Without `GetMaterialApp`, most GetX features will not work.

---

## What is the biggest architectural criticism against GetX regarding its bypass of Flutter's BuildContext?

The biggest criticism is that GetX bypasses Flutter's native architecture by relying heavily on global state and singletons.

This can lead to:

* Tight coupling
* Difficult debugging in large projects
* Reduced flexibility when changing architectures

To avoid this, I usually follow Clean Architecture and feature-based folder structures.

---

## How do you handle multi-theme switching or dynamic localization using GetX?

Theme switching:

```dart
Get.changeTheme(ThemeData.dark());
```

Localization:

```dart
Get.updateLocale(Locale('en'));
```

Because these APIs are global, implementing themes and localization becomes very simple.

---

## Why is it said that GetX violates the Single Responsibility Principle, and how do you counter that?

GetX handles multiple responsibilities such as:

* State management
* Navigation
* Dependency injection
* Localization

Some developers believe this violates SRP.

To avoid this, I keep:

* Controllers for presentation logic only
* Repositories for business logic
* Services for API calls
* Bindings for dependency injection

This keeps the project clean and maintainable.

---

## How do you unit test a GetxController without spinning up the widget tree?

Because `GetxController` is a plain Dart object, it can be tested without creating widgets.

Example:

```dart
void main() {
  final controller = HomeController();

  test('increment counter', () {
    controller.increment();

    expect(controller.count.value, 1);
  });
}
```

This makes GetX business logic very easy to test.
