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
  - **Definition:** Routes are used to define navigation paths in a Flutter app using a map of route names and widgets.
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

