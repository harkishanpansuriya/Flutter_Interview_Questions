# Riverpod Interview Questions

## What is Riverpod and why was it introduced?

Riverpod is a state management and dependency injection framework created by **Remi Rousselet**, the author of Provider.

It was introduced to overcome some limitations of Provider, such as:

* Dependency on `BuildContext`
* Runtime errors like `ProviderNotFoundException`
* Difficult testing and dependency injection

Riverpod provides:

* Compile-time safety
* Better testability
* Built-in dependency injection
* Improved scalability and maintainability

Because Riverpod is not tied to the widget tree, business logic remains completely separate from the UI, making applications easier to test and maintain.

---

## How is Riverpod different from Provider?

The biggest difference is that **Riverpod does not depend on `BuildContext`**, whereas Provider is built on top of Flutter's `InheritedWidget`.

With Riverpod:

* Providers are declared globally.
* State can be accessed anywhere using `ref`.
* Code becomes easier to test and maintain.

With Provider:

* Accessing state requires `BuildContext`.
* Providers must exist above widgets in the widget tree.

Overall, Riverpod offers better scalability, testability, and compile-time safety.

---

## What are the advantages of Riverpod over Provider?

Some major advantages of Riverpod are:

* No dependency on `BuildContext`
* Compile-time safety
* Better testability
* Built-in dependency injection
* Supports `.family` and `.autoDispose`
* Better separation of UI and business logic
* No `ProviderNotFoundException`
* Easier provider composition

These features make Riverpod more suitable for medium and large-scale applications.

---

## What is a Provider in Riverpod?

A Provider is an object that exposes a piece of state, business logic, or dependency.

It acts as a **single source of truth** and allows widgets or other providers to access shared data reactively.

Examples:

* API service
* Repository
* Configuration values
* Shared state

In Riverpod, everything revolves around providers.

---

## Difference between Provider and StateProvider?

### Provider

`Provider` exposes immutable values or dependencies that do not change.

Common examples:

* API services
* Repositories
* Utility classes

```dart
final apiProvider = Provider((ref) => ApiService());
```

### StateProvider

`StateProvider` is used for simple mutable state.

Common examples:

* Counter
* Theme mode
* Selected tab index

```dart
final counterProvider = StateProvider<int>((ref) => 0);
```

In short:

* `Provider` → Read-only dependency.
* `StateProvider` → Simple mutable state.

---

## What is StateNotifierProvider?

`StateNotifierProvider` is used to manage complex business logic and immutable state.

The UI reads the state from the provider, while all state modifications happen inside the `StateNotifier` class.

It is useful for:

* Authentication
* Shopping cart
* Todo applications

Although still supported, Riverpod now recommends using **Notifier** and **AsyncNotifier** because they provide less boilerplate and better integration with Riverpod.

---

## What is FutureProvider and when would you use it?

`FutureProvider` is used when you need to expose asynchronous data that is fetched once.

Common use cases:

* API calls
* Database reads
* Loading user profile
* Fetching configuration

The provider automatically handles:

* Loading state
* Success state
* Error state

Example:

```dart
final userProvider = FutureProvider((ref) async {
  return repository.getUser();
});
```

I generally use `FutureProvider` when data needs to be loaded once and displayed in the UI.

---

## What is StreamProvider?

`StreamProvider` exposes data coming continuously from a stream.

It automatically listens to the stream and updates the UI whenever new data arrives.

Common use cases:

* Firebase Authentication
* Firestore snapshots
* WebSocket messages
* Real-time updates

Example:

```dart
final authProvider = StreamProvider((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
```

I usually use `StreamProvider` for real-time applications.

---

## What is ConsumerWidget?

`ConsumerWidget` is similar to `StatelessWidget`, but it provides access to `WidgetRef`.

`WidgetRef` allows the widget to read or watch providers.

Use `ConsumerWidget` when:

* The widget needs Riverpod state.
* No local mutable state is required.

Example:

```dart
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Text('$count');
  }
}
```

---

## Difference between ConsumerWidget and ConsumerStatefulWidget?

### ConsumerWidget

Used when the widget is stateless.

### ConsumerStatefulWidget

Used when the widget requires:

* `initState()`
* `dispose()`
* `didChangeDependencies()`
* Local mutable state

I use `ConsumerStatefulWidget` whenever I need both Flutter lifecycle methods and Riverpod access.

---

## What is ref.watch(), ref.read(), and ref.listen()?

### ref.watch()

Listens to provider changes and rebuilds the widget automatically.

```dart
ref.watch(counterProvider);
```

### ref.read()

Reads the current value without rebuilding.

```dart
ref.read(counterProvider.notifier);
```

### ref.listen()

Listens for changes and performs side effects without rebuilding.

```dart
ref.listen(authProvider, (previous, next) {});
```

Use `listen()` for:

* Navigation
* Snackbars
* Dialogs

---

## When should you use ref.watch vs ref.read?

Use `ref.watch()` when:

* The UI should update automatically.

Use `ref.read()` when:

* Triggering button actions.
* Reading values once.
* Calling methods on notifiers.

Example:

```dart
ref.read(counterProvider.notifier).increment();
```

As a rule:

* `watch()` → UI updates.
* `read()` → One-time access or actions.

---

## What is autoDispose in Riverpod?

`autoDispose` automatically destroys the provider when nobody is listening to it.

Benefits:

* Reduces memory usage.
* Prevents memory leaks.
* Resets temporary state.

Common use cases:

* Search screens
* Screen-specific state
* Temporary API responses

Example:

```dart
final userProvider =
    FutureProvider.autoDispose((ref) async {
  return repository.getUser();
});
```

---

## What is family modifier in Riverpod?

`.family` allows passing parameters to a provider.

This is useful when the same provider needs different data.

Example:

```dart
final userProvider =
    FutureProvider.family<User, String>((ref, id) async {
  return repository.getUser(id);
});
```

Real-world use cases:

* User details by ID
* Product details
* Dynamic API requests

`.family` makes providers highly reusable.

---

## How do you perform dependency injection using Riverpod?

Riverpod itself acts as a dependency injection framework.

Services, repositories, and APIs are exposed through providers.

Example:

```dart
final apiProvider = Provider((ref) => ApiService());
```

These dependencies can then be accessed anywhere using:

```dart
ref.read(apiProvider);
```

This eliminates the need for service locators or singletons.

---

## How do you handle API calls in Riverpod?

API calls are usually handled using:

* `FutureProvider`
* `AsyncNotifier`

Repositories are injected through providers, and the UI listens to state changes.

For complex applications, I prefer `AsyncNotifier` because it centralizes business logic and supports mutations.

---

## How do you manage loading, success, and error states in Riverpod?

Riverpod provides `AsyncValue`, which automatically handles:

* Loading
* Success
* Error

Example:

```dart
ref.watch(userProvider).when(
  data: (user) => Text(user.name),
  loading: () => CircularProgressIndicator(),
  error: (e, s) => Text('Error'),
);
```

This significantly reduces boilerplate code.

---

## What is AsyncValue in Riverpod?

`AsyncValue` is a wrapper class that represents asynchronous state.

It can be in three states:

* Loading
* Data
* Error

It simplifies handling API responses and keeps UI code clean.

I generally use `AsyncValue` with `FutureProvider` and `AsyncNotifier`.

---

## How do you test Riverpod providers?

Riverpod providers can be tested easily using `ProviderContainer`.

Dependencies can be mocked by overriding providers.

Example:

```dart
final container = ProviderContainer(
  overrides: [
    apiProvider.overrideWithValue(MockApi())
  ],
);
```

This makes Riverpod highly testable.

---

## Why would you choose Riverpod over BLoC or Provider?

I would choose Riverpod because it provides:

* Compile-time safety
* Better testability
* Built-in dependency injection
* Less boilerplate
* No dependency on `BuildContext`

Compared to Provider, it is more scalable.

Compared to BLoC, it requires significantly less boilerplate while still supporting complex architectures.

---

## What is the Riverpod Generator (@riverpod), and why is it now recommended?

The `@riverpod` annotation automatically generates provider code.

Benefits:

* Reduces boilerplate
* Improves readability
* Stronger type safety
* Better IDE support

Riverpod officially recommends code generation because it produces cleaner and more maintainable code.

---

## What are Notifier and AsyncNotifier, and why did they replace StateNotifier?

### Notifier

Used for synchronous state.

### AsyncNotifier

Used for asynchronous state.

Riverpod introduced these classes to replace `StateNotifier` because they provide:

* Less boilerplate
* Better async support
* Better integration with Riverpod
* Built-in `ref` access

Today, `(Async)Notifier` is Riverpod's recommended approach for state management.

---

## How do you override a provider inside ProviderScope?

Providers can be overridden inside `ProviderScope`.

This is commonly used for:

* Unit testing
* Mock repositories
* Environment-specific configuration

Example:

```dart
ProviderScope(
  overrides: [
    apiProvider.overrideWithValue(MockApi()),
  ],
  child: MyApp(),
);
```

---

## How do you depend on or combine multiple providers?

A provider can depend on another provider using `ref.watch()`.

Example:

```dart
final fullNameProvider = Provider((ref) {
  final first = ref.watch(firstNameProvider);
  final last = ref.watch(lastNameProvider);

  return '$first $last';
});
```

This makes Riverpod providers highly composable and reusable.
