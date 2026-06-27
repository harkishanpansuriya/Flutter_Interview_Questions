## What is Riverpod and why was it introduced?

Riverpod is a state management and dependency injection framework created by Remi Rousselet, the author of Provider. It was introduced to solve some limitations of Provider, such as dependency on `BuildContext`, runtime errors like `ProviderNotFoundException`, and difficulties in testing.

Riverpod provides compile-time safety, better testability, built-in dependency injection, and improved state management capabilities.

---

## How is Riverpod different from Provider?

The biggest difference is that Riverpod does not depend on the widget tree or `BuildContext`, whereas Provider is built on top of Flutter's `InheritedWidget`.

With Riverpod, providers are declared globally and can be accessed from anywhere using `ref`, making the code easier to test and maintain.

---

## What are the advantages of Riverpod over Provider?

Some major advantages are:

* No dependency on `BuildContext`
* Compile-time safety
* Easier testing
* Built-in dependency injection
* Supports `.family` and `.autoDispose`
* Better separation of business logic and UI
* No `ProviderNotFoundException`

---

## What is a Provider in Riverpod?

A Provider is an object that exposes a piece of state, business logic, or dependency.

It acts as a single source of truth and allows widgets or other providers to access shared data in a reactive way.

---

## Difference between Provider and StateProvider?

`Provider` exposes immutable values or dependencies that do not change.

`StateProvider` is used for simple mutable state such as `bool`, `String`, or `int`.

Example:

* `Provider` → API service, Repository
* `StateProvider` → Counter, Theme Mode

---

## What is StateNotifierProvider?

`StateNotifierProvider` is used to manage complex business logic and immutable state.

The UI reads the state from the provider, while all modifications happen inside the `StateNotifier` class.

Although it is still supported, Riverpod now recommends using `Notifier` and `AsyncNotifier` instead.

---

## What is FutureProvider and when would you use it?

`FutureProvider` is used when you need to expose asynchronous data that is fetched once.

Common use cases include:

* API calls
* Database reads
* Fetching user profile

The provider automatically manages loading, success, and error states.

---

## What is StreamProvider?

`StreamProvider` exposes data coming continuously from a stream.

It automatically listens to the stream and updates the UI whenever new data arrives.

Common use cases:

* Firebase Authentication
* Firestore snapshots
* WebSocket messages
* Real-time updates

---

## What is ConsumerWidget?

`ConsumerWidget` is similar to StatelessWidget, but it provides access to `WidgetRef`.

It is used when the widget only needs to read or watch providers and does not require local mutable state.

---

## Difference between ConsumerWidget and ConsumerStatefulWidget?

`ConsumerWidget` is used for stateless UI.

`ConsumerStatefulWidget` is used when the widget needs both Riverpod access and Flutter lifecycle methods such as `initState()`, `dispose()`, or local state.

---

## What is ref.watch(), ref.read(), and ref.listen()?

* `ref.watch()` listens for provider changes and rebuilds the widget.
* `ref.read()` gets the current value without rebuilding.
* `ref.listen()` listens for changes and performs side effects without rebuilding.

---

## When should you use ref.watch vs ref.read?

Use `ref.watch()` when the UI should automatically update whenever the provider changes.

Use `ref.read()` when you only need the value once or want to trigger an action such as a button click.

---

## What is autoDispose in Riverpod?

`autoDispose` automatically disposes a provider when nobody is listening to it anymore.

This helps reduce memory usage and prevents memory leaks.

It is commonly used for:

* Screen-specific state
* Temporary API data
* Search screens

---

## What is family modifier in Riverpod?

`.family` allows passing parameters to a provider.

It is useful when the same provider needs different data.

Example:

Fetching user details by ID.

```dart
final userProvider = FutureProvider.family<User, String>((ref, id) async {
  return repository.getUser(id);
});
```

---

## How do you perform dependency injection using Riverpod?

Riverpod itself acts as a dependency injection framework.

Services, repositories, and APIs can be exposed through providers and accessed anywhere using `ref.read()` or `ref.watch()`.

This removes the need for service locators or singletons.

---

## How do you handle API calls in Riverpod?

API calls are usually handled using `FutureProvider` or `AsyncNotifier`.

Repository classes are injected through providers, and the UI listens to the resulting state.

---

## How do you manage loading, success, and error states in Riverpod?

Riverpod provides `AsyncValue`, which automatically handles these states.

```dart
ref.watch(userProvider).when(
  data: (user) => Text(user.name),
  loading: () => CircularProgressIndicator(),
  error: (e, s) => Text('Error'),
);
```

---

## What is AsyncValue in Riverpod?

`AsyncValue` is a wrapper class that represents asynchronous state.

It can have three states:

* Loading
* Data
* Error

It simplifies handling API responses in the UI.

---

## How do you test Riverpod providers?

Riverpod providers can be tested easily using `ProviderContainer`.

Mock repositories or services can be injected by overriding providers inside tests.

---

## Why would you choose Riverpod over BLoC or Provider?

I would choose Riverpod because it provides compile-time safety, better testability, simpler syntax, built-in dependency injection, and does not depend on `BuildContext`.

For most applications, it results in less boilerplate compared to BLoC and is more scalable than Provider.

---

## What is the Riverpod Generator (@riverpod), and why is it now recommended?

The `@riverpod` annotation automatically generates provider code.

It reduces boilerplate, improves readability, and provides stronger type safety.

Riverpod's official documentation now recommends using generator-based syntax because it is cleaner and easier to maintain.

---

## What are Notifier and AsyncNotifier, and why did they replace StateNotifier?

`Notifier` manages synchronous state, while `AsyncNotifier` manages asynchronous state.

They replaced `StateNotifier` because they provide simpler APIs, better integration with Riverpod, less boilerplate, and improved code generation support.

---

## How do you override a provider inside ProviderScope?

Providers can be overridden inside `ProviderScope`.

This is commonly used for:

* Unit testing
* Mocking repositories
* Environment-specific configurations

Example:

```dart
ProviderScope(
  overrides: [
    apiProvider.overrideWithValue(MockApi())
  ],
  child: MyApp(),
)
```

---

## How do you depend on or combine multiple providers?

A provider can watch another provider using `ref.watch()`.

Example:

```dart
final fullNameProvider = Provider((ref) {
  final first = ref.watch(firstNameProvider);
  final last = ref.watch(lastNameProvider);

  return '$first $last';
});
```

This makes providers highly composable.

---

# Provider Questions

## What is Provider in Flutter?

Provider is a state management and dependency injection library built on top of Flutter's `InheritedWidget`.

It allows widgets to share and react to state changes efficiently.

---

## Why was Provider introduced?

Provider was introduced to simplify state management and avoid excessive prop drilling.

It provides an easier and more scalable approach compared to manually using `InheritedWidget`.

---

## How does Provider work internally?

Internally, Provider uses Flutter's `InheritedWidget`.

When the provided object changes, Provider notifies dependent widgets and rebuilds only those widgets that are listening.

---

## What problem does Provider solve?

Provider solves:

* State sharing between widgets
* Dependency injection
* Reducing boilerplate
* Avoiding prop drilling

---

## What is ChangeNotifier?

`ChangeNotifier` is a Flutter class that provides change notification functionality.

Whenever data changes, `notifyListeners()` is called to update listening widgets.

---

## What is ChangeNotifierProvider?

`ChangeNotifierProvider` creates and exposes a `ChangeNotifier` object to the widget tree.

Widgets automatically rebuild when `notifyListeners()` is called.

---

## Difference between Provider and ChangeNotifierProvider?

`Provider` exposes immutable objects or services.

`ChangeNotifierProvider` exposes mutable state objects that notify listeners when state changes.

---

## What is MultiProvider and when would you use it?

`MultiProvider` combines multiple providers into a single widget.

It improves readability and avoids deeply nested provider trees.

---

## What is Consumer widget?

`Consumer` listens to provider changes and rebuilds only the widgets inside its builder.

This helps optimize performance.

---

## What is Selector and why is it used?

`Selector` listens only to a specific part of an object.

It prevents unnecessary rebuilds by rebuilding only when the selected value changes.

---

## Difference between Consumer and Selector?

`Consumer` rebuilds whenever any value in the provider changes.

`Selector` rebuilds only when the selected value changes.

Therefore, `Selector` provides better performance optimization.

---

## What is context.watch(), context.read(), and context.select()?

* `watch()` listens and rebuilds.
* `read()` reads once without rebuilding.
* `select()` listens to only a specific property.

---

## When should you use context.read() instead of context.watch()?

Use `context.read()` when you need the value only once or want to trigger actions such as button clicks.

It should not be used when the UI must react to state changes.

---

## How does Provider optimize widget rebuilds?

Provider rebuilds only widgets that are listening to the provider instead of rebuilding the entire widget tree.

Widgets using `Consumer`, `Selector`, or `context.watch()` are rebuilt selectively.

---

## How do you avoid unnecessary rebuilds in Provider?

I usually use `Consumer`, `Selector`, split large widgets into smaller widgets, and use `const` constructors wherever possible.

This ensures only the required UI updates.

---

## What is ProxyProvider?

`ProxyProvider` allows one provider to depend on another provider.

It is useful when a service or repository requires another dependency.

---

## How do you perform dependency injection using Provider?

Services and repositories are created at the top level using `Provider` and accessed using `context.read()` or `context.watch()`.

---

## How do you manage API calls using Provider?

API calls are usually placed inside repositories or `ChangeNotifier` classes.

The notifier fetches data, updates state, and calls `notifyListeners()`.

---

## What are the limitations of Provider?

Some limitations are:

* Depends on BuildContext
* Runtime errors can occur
* Difficult testing compared to Riverpod
* No built-in autoDispose
* No parameterized providers

---

## Difference between Provider, BLoC, and Riverpod?

Provider is simple and easy to learn.

BLoC provides strong separation of concerns but requires more boilerplate.

Riverpod offers compile-time safety, dependency injection, and better testability with less boilerplate.

---

## How exactly does Provider utilize InheritedWidget internally?

Provider wraps Flutter's `InheritedWidget` and exposes a simpler API.

Whenever the provided object changes, the underlying `InheritedWidget` notifies all dependent widgets and rebuilds only those widgets.

---

## Why is calling context.read() inside build() considered an anti-pattern?

`build()` can execute multiple times.

Using `context.read()` inside build may lead to unexpected behavior because the widget does not subscribe to updates.

Usually, `watch()` or `Consumer` should be used inside build methods.

---

## What is the difference between Provider(create: ...) and Provider.value()?

`Provider(create: ...)` should be used when creating a new object because Provider manages its lifecycle automatically.

`Provider.value()` should only be used when providing an already existing object.

Using `.value` for new objects can lead to memory leaks or unexpected disposal issues.


Riverpod recommendations such as using Notifier/AsyncNotifier, @riverpod, .family, and .autoDispose are based on the official Riverpod documentation and API guidance.

The differences between Provider and Riverpod, including compile-time safety, testing, and dependency on BuildContext, are documented by the Riverpod team and community resources.