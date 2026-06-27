# Common GetX Interview Questions

## What is GetX and what are its three core pillars?

GetX is a Flutter package that provides state management, dependency injection, and route management in a single library. It was designed to reduce boilerplate code and simplify application development.

The three core pillars of GetX are:

* **State Management**
* **Dependency Injection (DI)**
* **Route Management (Navigation)**

Because GetX combines all three features in one package, developers can build applications with less code and better productivity.

---

## What is the difference between reactive state management (Rx variables) and simple state management in GetX?

GetX provides two types of state management.

### Reactive State Management

Reactive state management uses Rx variables (`.obs`) and automatically updates the UI whenever the value changes.

Example:

```dart
final count = 0.obs;
```

Widgets like `Obx` automatically rebuild when `count` changes.

### Simple State Management

Simple state management uses `GetBuilder` and requires manually calling `update()` whenever state changes.

Example:

```dart
count++;
update();
```

Reactive state management is best for frequently changing UI, while simple state management is suitable for less frequent updates and better performance.

---

## What is the difference between Obx and GetBuilder? When should you use one over the other?

`Obx` works with reactive (`Rx`) variables and automatically rebuilds whenever an observed variable changes.

`GetBuilder` works with simple state management and rebuilds only when `update()` is called.

I generally use:

* **Obx** for dynamic UI that changes frequently.
* **GetBuilder** for screens where updates are less frequent and performance is critical.

Example:

```dart
Obx(() => Text(controller.count.value.toString()));
```

```dart
GetBuilder<HomeController>(
  builder: (controller) => Text(controller.count.toString()),
);
```

`GetBuilder` consumes less memory because it does not use streams internally.

---

## What is GetX widget, and how does it differ from Obx?

`GetX<T>` is a widget that both creates and listens to a controller.

`Obx` simply listens to already existing Rx variables.

`GetX` is useful when you want type safety and automatic controller lookup.

Example:

```dart
GetX<HomeController>(
  builder: (controller) {
    return Text(controller.count.toString());
  },
);
```

In most projects, `Obx` is used more frequently because of its simpler syntax.

---

## How do you define a reactive variable in GetX?

Reactive variables can be created by adding `.obs` to any value.

Example:

```dart
final count = 0.obs;
final isLoading = false.obs;
final name = ''.obs;
```

Whenever the value changes, widgets wrapped inside `Obx` automatically rebuild.

```dart
count.value++;
```

This is one of the simplest and most powerful features of GetX.

---

## What is the purpose of update() in a GetxController? Which widget responds to it?

`update()` notifies all `GetBuilder` widgets listening to that controller to rebuild.

Example:

```dart
void increment() {
  count++;
  update();
}
```

Only `GetBuilder` responds to `update()`.

`Obx` does not use `update()` because it listens to Rx variables automatically.

---

## What are Worker methods in GetX (ever, once, debounce, interval), and what are their real-world use cases?

Workers allow developers to listen to changes in reactive variables and perform side effects.

### ever()

Runs every time the variable changes.

Example use case:

* Logging
* Analytics

### once()

Runs only the first time the value changes.

Example use case:

* First login action

### debounce()

Waits for user input to stop before executing.

Example use case:

* Search API calls

### interval()

Ignores rapid repeated events and executes periodically.

Example use case:

* Preventing button spam

Example:

```dart
debounce(searchText, (_) {
  fetchResults();
}, time: Duration(milliseconds: 500));
```

Workers are extremely useful for optimizing API calls and user interactions.

---

## How does GetX handle Dependency Injection (DI) without using BuildContext?

GetX maintains a global dependency registry.

Dependencies are registered using methods like:

```dart
Get.put(HomeController());
```

Later, they can be accessed anywhere using:

```dart
Get.find<HomeController>();
```

Since dependencies are stored globally, `BuildContext` is not required.

---

## What is the difference between Get.put() and Get.lazyPut()?

`Get.put()` creates the object immediately.

```dart
Get.put(HomeController());
```

`Get.lazyPut()` delays object creation until it is actually needed.

```dart
Get.lazyPut(() => HomeController());
```

I usually use:

* `Get.put()` for immediately required dependencies.
* `Get.lazyPut()` for performance optimization.

---

## What is the difference between Get.put() and Get.spawn()?

`Get.put()` creates a singleton instance.

All screens receive the same instance.

`Get.spawn()` creates a new instance every time it is requested.

Use `Get.spawn()` when each screen should have its own independent controller instance.

---

## What are Bindings in GetX, and why are they important for clean architecture?

Bindings connect routes with dependencies.

Instead of manually creating controllers inside screens, dependencies are registered in a Binding class.

Example:

```dart
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
```

Benefits:

* Cleaner code
* Better separation of concerns
* Automatic controller disposal

Bindings are highly recommended for large applications.

---

## How does Get.find() look up dependencies under the hood?

When a dependency is registered using `Get.put()` or `Get.lazyPut()`, GetX stores it inside an internal dependency registry.

`Get.find()` searches this registry and returns the matching instance.

If no matching dependency exists, GetX throws an error.

---

## How does GetX manage the lifecycle of a controller?

Controllers extend `GetxController`.

Important lifecycle methods are:

```dart
onInit()
onReady()
onClose()
```

GetX automatically disposes controllers when their associated route is removed unless marked as permanent.

---

## What does permanent: true do inside Get.put()?

It prevents the dependency from being automatically disposed.

Example:

```dart
Get.put(AuthController(), permanent: true);
```

I typically use this for:

* Authentication controller
* Theme controller
* Global services

These objects should remain alive throughout the application's lifecycle.

---

## How do you perform named and nameless routing using GetX?

### Nameless Routing

```dart
Get.to(HomeScreen());
```

### Named Routing

```dart
Get.toNamed('/home');
```

Named routes are preferred in large applications because they improve maintainability.

---

## How do you remove the current screen or clear the entire navigation stack?

Remove current screen:

```dart
Get.off(HomeScreen());
```

Clear entire stack:

```dart
Get.offAll(HomeScreen());
```

Common usage:

* Login → Home
* Splash → Dashboard

---

## How do you implement middleware or authentication guards in GetX routing?

GetX provides `GetMiddleware`.

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
* Role-based navigation

---

## How do you pass arguments between screens using GetX?

Passing arguments:

```dart
Get.to(DetailsScreen(), arguments: user);
```

Receiving arguments:

```dart
final user = Get.arguments;
```

For named routes:

```dart
Get.parameters['id'];
```

---

## What is GetConnect and how does it help with API management?

GetConnect is GetX's built-in HTTP client.

It simplifies:

* REST API calls
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

`GetMaterialApp` extends `MaterialApp` and enables all GetX features such as:

* Navigation without context
* Dependency Injection
* Snackbars
* Dialogs
* Localization

Without `GetMaterialApp`, many GetX features will not work.

---

## What is the biggest architectural criticism against GetX?

The biggest criticism is that GetX bypasses Flutter's `BuildContext` and combines multiple responsibilities into a single package.

Some developers believe this encourages global state and tight coupling.

In large projects, teams usually enforce clean architecture and feature-based folder structures to avoid these issues.

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

Because these APIs are global, implementing dynamic themes and languages becomes extremely easy.

---

## Why is it said that GetX violates the Single Responsibility Principle?

GetX provides multiple features such as:

* State management
* Navigation
* Dependency injection
* Localization

Because everything exists in one package, some developers argue that it violates SRP.

To avoid this issue, I usually follow a feature-based architecture and keep controllers focused on a single responsibility.

---

## How do you unit test a GetxController without spinning up the widget tree?

GetxControllers can be tested directly without building widgets.

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

This makes GetX very easy to test because business logic remains inside controllers rather than widgets.
GetX state management concepts, dependency injection APIs, controller lifecycle, and bindings are documented in the official GetX documentation.