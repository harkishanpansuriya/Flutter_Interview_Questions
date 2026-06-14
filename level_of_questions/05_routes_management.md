## How do you deal with deep linking in a large app?

- In a large Flutter app, I handle deep linking using a centralized routing system. I configure deep links using packages like go_router or uni_links, and map incoming URLs to specific screens with required parameters.

I also ensure proper handling of authenticated and unauthenticated flows, so users are redirected correctly based on app state.

## How do you handle back navigation with nested navigators (BottomNav + routes)?

- I use a nested navigation structure where each Bottom Navigation tab has its own navigator stack.

This allows each tab to maintain its own history independently. I manage back button behavior using WillPopScope or router-level back handling so that pressing back first pops the current tab stack before exiting the app.
- 
## How do you handle back navigation when using nested navigators?

- In nested navigation, I manage separate navigation stacks for each section of the app. When the user presses back, I first check if the current navigator can pop a route; if not, I switch tabs or exit the app accordingly.

This ensures a smooth and expected back navigation experience.

## Differences between Navigator and Router in Flutter

* **Navigator**:

    * Uses a **stack-based approach** (push/pop).
    * Simple and easy to use for basic navigation.
    * Best for **small to medium apps**.

* **Router** (Navigator 2.0):

    * Uses a **declarative approach** (state-driven navigation).
    * More flexible and powerful.
    * Best for **large apps, deep linking, and web support**.

## What are the navigation methods and what is the difference between them?

- **Navigation Methods in Flutter:**
    - **Navigator.push():** Pushes a new route onto the navigator stack.
    - **Navigator.pop():** Pops the current route off the navigator stack.
    - **Navigator.pushReplacement():** Replaces the current route with a new route.
    - **Navigator.pushNamed():** Pushes a named route onto the navigator stack.
    - **Navigator.popUntil():** Pops routes off the stack until a given predicate is true.
    - **Navigator.pushAndRemoveUntil():** Pushes a new route and removes all previous routes until a
      given predicate is true.

## How to pass values between Flutter screens?

- We can pass values between Flutter screens using Navigator arguments (in Navigator.pushNamed),
  constructors, or named routes.
    - Via Constructor (Navigator.push): Pass data using the constructor when navigating to the next
      screen.
    - Named Routes: Use arguments in Navigator.pushNamed and retrieve them using ModalRoute.of(
      context)!.settings.arguments.
    - State Management: Use tools like GetX, Provider, or Bloc to share data reactively across
      screens.

## Navigator in Flutter (Navigator 1.0 vs Navigator 2.0).

- Navigator is used to manage screen navigation in Flutter using a stack-based approach.

## How do you navigate between screens in Flutter?

- Navigator.push()

## Routes vs Route Generator in Flutter

- **Routes:**
    - **Definition:** Routes are used to define navigation paths in a Flutter app using a map of
      route names and widgets.
    - It is a simple way to manage navigation using predefined routes.
    - Best for **small apps** with limited screens.

### Route Generator

- Definition: Route Generator is a centralized function used to handle navigation dynamically.
- It uses onGenerateRoute to manage all routes in one place.
- Best for large apps with complex navigation and arguments passing.

#### Example

```dart
void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (_) => HomePage(),
        '/foo': (_) => FooPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/bar') {
          final value = settings.arguments as int;
          return MaterialPageRoute(builder: (_) => BarPage(value));
        }
        return null;
      },
    ),
  );
}
```

### HomePage

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/foo'),
              child: Text('Go to FooPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/bar', arguments: 42),
              child: Text('Go to BarPage'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### FooPage

```dart
class FooPage extends StatelessWidget {
  @override
  Widget build(_) => Scaffold(appBar: AppBar(title: Text('FooPage')));
}
```

### BarPage

```dart
class BarPage extends StatelessWidget {
  final int value;

  BarPage(this.value);

  @override
  Widget build(_) => Scaffold(appBar: AppBar(title: Text('BarPage, value = $value')));
}
```

## What happens internally when you navigate in Flutter?

* Flutter navigation works like a **stack system (LIFO)**.
* When you push a screen → it goes on top of stack.
* When you pop → top screen is removed.
* Navigator rebuilds only affected routes, not whole app.
* Internally uses **Route objects managed by Navigator widget**.

👉 In short: Flutter navigation = stack of pages.

---

## What is the difference between routes, widgets, and navigation stack?

* **Widget** → UI screen definition
* **Route** → wrapper around widget used by Navigator
* **Navigation Stack** → runtime structure that stores routes

👉 In short:
Widget = screen
Route = container
Stack = history of screens

---

## What is `onGenerateRoute` and why is it used?

* It is a **central navigation handler**
* Used when you want:

    * dynamic routing
    * passing arguments safely
    * control over page creation

👉 Better than `routes` when app grows.

---

## How does argument passing work in navigation?

* You can pass data using:

    * constructor (most safe)
    * `pushNamed(arguments: )`
    * route generator

👉 Best practice:
Use **constructor passing for type safety**

---

## What is deep linking in Flutter routing?

* Deep linking means opening a **specific screen directly from URL**

* Example:
  `/profile/123` opens profile page directly

* Works better with:

    * Navigator 2.0
    * Router APIs like `go_router`

👉 Used in web + Android app links

---

## What is Navigator 1.0 vs Navigator 2.0 difference?

* **Navigator 1.0**

    * push/pop based
    * imperative
    * easy but limited

* **Navigator 2.0**

    * declarative (state-based)
    * supports deep linking
    * better for large apps + web

👉 Simple vs scalable architecture

---

## What is route lifecycle in Flutter navigation?

When navigating:

* route is created
* pushed into stack
* built and rendered
* later disposed when popped

👉 Important point:
Each route has its own lifecycle like a widget


