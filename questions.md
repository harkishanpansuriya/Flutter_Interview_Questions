# Flutter Interview Questions and Answers

1. What is `Flutter`?

   `Flutter` is a free, open-source software development kit (SDK) for building cross-platform
   mobile
   applications. It was created by Google and released in May 2017


2. What is `Dart`?

   `Dart` is a general-purpose, object-oriented programming language with C-style syntax. It is
   open-source and developed by Google in 2011. The purpose of Dart programming is to create a
   frontend user interfaces for the web and mobile apps. It is an important language for creating
   Flutter apps. The Dart language can be compiled both AOT (Ahead-of-Time) and JIT (Just-in-Time).


3. What is role of sdk in the flutter?
    - The Flutter SDK provides tools, libraries, and resources to create user interfaces for Android
      and iOS. It uses a single codebase to help developers build high-performance, scalable
      applications.

4. Why `Flutter` uses `Dart` as Programming Language?

   Flutter uses Dart as its programming language because Dart is declarative and programmatic,
   making it easy for developers to read and visualize. Dart also allows Flutter to avoid the need
   for a separate declarative layout language like XML or JSX.

   Dart is faster than JavaScript because it can be compiled both AOT (Ahead-of-Time) and JIT (
   Just-in-Time). Flutter uses JIT
   compilation for development and AOT for launching the application. Release versions of Flutter
   apps on all platforms use ahead-of-time (AOT) compilation, except for on the Web, where code is
   transpiled to JavaScript.


5. Tell the full form of API.

    - Application Programming Interface.

6. Diff between the Package and plugin in Flutter?

   **Package in Flutter:**
    - It's like a gift box with reusable code. A package is a collection of Dart files containing
      code
      that can be easily shared and reused across different Flutter projects.

   **Plugin in Flutter:**
    - Think of it as a power-up module for your Flutter app. A plugin is a specialized package that
      connects your Flutter app to platform-specific features or external services, like accessing
      the camera, GPS, or file system.

   **When to use a package:**
    - You need to add new features and functionality to your Flutter app.
    - You want to make your code more modular and organized.
    - You want to reuse code across multiple Flutter apps.

   **When to use a plugin:**

    - You need to interact with the underlying platform.
    - You want to use a native platform API or service in your Flutter app.
    - You want to access a device's hardware or sensors.

   **Examples:**
    - If you want to add a state management library to your Flutter app, you would use a package
      like Provider or BLoC.
    - If you want to use the camera in your Flutter app, you would use the camera plugin.
    - If you want to access the device's file system in your Flutter app, you would use the file
      system plugin.

7. Dart is known for its "Ahead of Time" (AOT) and "Just in Time" (JIT) compilation. Can you explain
   the differences between these two compilation modes and when each is typically used in Dart
   development?

   **JIT (Just in Time) Compilation**:
    - Slower startup time.
    - Can achieve better peak performance.
    - Compiles code at runtime.
    - Offers debugging tools and hot reload.
    - Suited for development and testing phases.
    - Uses more memory but has quicker iteration during development.

   **AOT (Ahead of Time) Compilation**:

    - Faster startup times.
    - Offers consistent performance.
    - Compiles code before runtime.
    - Lacks debugging tools.
    - Designed for production.
    - Produces smaller binary sizes, conserving memory.

   **Additional Notes:**

    - JIT-compiled code may have superior peak performance but slower startup.
    - AOT-compiled code prioritizes fast startup and lower memory usage.
    - JIT is easier to debug due to runtime state access.
    - AOT code is smaller because it excludes the JIT compiler.


8. What are the `Flutter widgets`?

   In Flutter, a widget is a basic unit of the user interface (UI). Widgets are reusable pieces of
   code that describe how a part of the UI should be displayed. They can be combined and nested to
   create a dynamic UI.


9. Explain the flutter architecture.

   `Upper layers`: The Dart-based platform that takes care of app widgets, gestures, animations,
   illustrations, and materials;
   `Flutter engine`: Handles the display and formatting of text.
   `Built-in service`: Used for the management of plugins, packages, and event loops.

10. Difference between GraphQl vs Rest. with pros and cons in short

`GraphQL:-`

- GraphQL is an API query language as well as a runtime for answering those queries with
  existing data.
- GraphQL’s central feature is its ability to request and receive only the specific data
  requested — nothing more. This makes it much simpler to scale your APIs along with your app.
- The most exciting part of GraphQL is its ability to provide you with all the data in one
  endpoint.

`RESTful:-`

- `Data control`: REST APIs are more limited in data control because each request needs to be
  tailored for the specific data being requested.
  `Communication`: REST uses a set of endpoints that respond to specific HTTP requests.
  `Data formats`: REST can present data in XML and YAML formats.
  `Drawbacks`: REST relies on rigid endpoints and data structures.

11. What is the difference between `Stateful` widget and `Stateless` widget and it's lifeCycle
    methods?

    - Stateless widgets cannot change their state during the runtime of the app,
    - it has an immutable state.
    - LifeCycle methods is as below
        1. `the build method` - This method is automatically called when the widget is built.

    - Stateful Widgets are the ones that change its properties during run-time.
    - it has an mutable state.
    - LifeCycle methods is as below

        1. `createState():`
            - When creating a stateful widget, this method is needed to return an instance of the
              state associated with the widget.

        2. `mounted:`
            - A boolean value that turns true when the `BuildContext` is assigned to the widget.

        3. `initState():`
            - Called just before the widget is built, this method allows the initialization of
              variables required by the build method.

        4. `didChangeDependencies():`
            - Called just after `initState()`, this method is invoked when the dependencies of the
              state object change. It can be called multiple times.

        5. `build():`
            - Displays the UI on the screen, returning a widget. Called after `initState()`, this
              method rebuilds when `setState` is called.

        6. `didUpdateWidget(Widget oldWidget):`
            - Helpful for unsubscribing the old object and subscribing to the new one if necessary
              when the widget changes. Overrides this method to respond when the widget changes,
              such as for implicit animations.

        7. `setState():`
            - Method used to update the UI. It triggers a rebuild of the UI by calling the `build`
              method again. Cannot be called immediately after the `build` method.

        8. `deactivate():`
            - Called when the widget is popped but might be reinserted before the current frame
              change is finished.

        9. `dispose():`
            - Called after the state object is completely removed or when the screen is popped. Used
              for cleanup operations.

12. What is `setState()` ?

setState() is a method that changes the state of a widget. It's the main way to update a widget's
state and trigger a rebuild of the widget tree.

13. What is the use of `pubspec.yaml` and `pubspec.lock` file in Flutter?

The `pubspec.yaml` file allows you to define the packages your app relies on,Project name,
Project description, Project version, Project dependencies, SDK constraints, Flutter-specific
configurations and declare your assets
like font, images, audio, video, etc.
For Android developers, this is roughly similar to a `build.gradle` file.

The `pubspec.lock` file in Flutter contains specific versions of the packages included in a
project. It's automatically generated when you build your project for the first time.
The .lock file locks the specific versions of dependencies, ensuring that everyone working on the
project uses the exact same versions.

14. What is the difference between `main()` and `runApp()` functions in Flutter?

    - the `main()` function is the entry point of a Dart program.
      It sets up the app and is responsible for starting the program.
    - The `runApp()` function is a Flutter-specific method that initializes the app and connects the
      widget tree to the screen. It is responsible for starting the app execution and displaying the
      root widget on the screen.
    - The `main()` function should call `runApp()` to start the Flutter application.

Here are some more details about the main() and runApp() functions:

- `main()`: This function came from Java-like languages. Without it, you can't write any
  programs on Flutter.
- `runApp()`: This function returns the widgets that are attached to the screen as a root of the
  widget tree. It inflates the given widget and attaches it to the screen.

15. What's the difference between a method and a function?

    - A method is on an object or is static in class. It is associated with a class. Methods are
      called using the dot notation (e.g. object.method()). Methods can be used to modify the state
      of an object.
    - A function is independent of any object (and outside of any class). It is not associated with
      a class. Functions are called using their name (e.g. function()). Functions cannot modify the
      state of an object.

16. Types of Keys in Flutter.

    - `ValueKey`: A key based on a specific value, such as a string or an integer. Useful when the
      value uniquely identifies the widget.

    - `ObjectKey`: A key based on the identity of an object. Useful when the object itself
      represents the widget's identity.

    - `UniqueKey`: A key that generates a unique identifier for each widget instance. Useful when
      there's no natural key to identify the widget.

    - `GlobalKey`: A key that can be accessed from anywhere in the app. Useful for accessing state
      or performing actions on a specific widget.

    **When to Use Keys in Flutter:**

    Lists and Grids: When the order of items in a list or grid changes, keys ensure that the state
    of each item is maintained correctly.

    Form Inputs: When preserving user input in forms, keys ensure that the input values are not lost
    during widget rebuilds.

    Animation Transitions: When animating widgets, keys help identify the correct widgets for smooth
    and consistent transitions.

    Stateful Widgets: When a widget's state needs to persist even if its position in the tree
    changes, a key can help maintain that state.

    Accessing Specific Widgets: Global keys can be used to access or control specific widgets from
    anywhere in the app.

17. What is future.wait?

    - the Future.wait() method allows you to wait for multiple Future objects to complete. It takes
      a list of Future objects as an argument and returns a new Future that completes when all the
      input Future objects complete

18. What is the Flutter Hot Reload feature, and how does it benefit developers during app
    development?

    - Flutter's hot reload feature enables developers to see the changes they make to the code
      almost instantly on the app screen.
    - fix bugs quickly and seeing instant results without restarting the whole app. resulting in
      faster development cycles.
    - Hot reload works by injecting updated source code files into the
      running `Dart Virtual Machine (VM)`. After the VM updates classes with the new versions of
      fields and functions, the Flutter framework automatically rebuilds the widget tree, allowing
      you to quickly view the effects of your changes.

19. Describe the structure of a Flutter app, including the main components like MaterialApp,
    Scaffold, and Widgets.

    1. **`MaterialApp`:**

    - It's like the blueprint for your app, setting the overall theme and structure.
    - The MaterialApp widget is the starting point of the app and it tells Flutter that we are going
      to use Material components and follow the material design in our app.

    2. **`Scaffold`:**
        - The Scaffold widget is used to create the basic layout of the screen and it includes the
          AppBar and the body of the screen.

    3. **`Widgets`:**
        - These are your app's building blocks, like furniture and decorations. They can be buttons,
          text, images, or anything you need to create your UI.

20. Difference between Set and List.

    `Set:`
    - Elements must be unique.
    - Elements are not ordered.

    `List:`
    - Elements can be duplicate.
    - Elements are ordered in the order they were added.

    // Set
    Set<int> mySet = {1, 2, 3, 4, 5, 5}; // The duplicate element 5 will be removed.
    // List
    List<int> myList = [1, 2, 3, 4, 5, 5]; // The duplicate element 5 will remain.

21. what is the stream in Dart? Types of streams and diff between types?

    - stream is a way to receive data over time. It can be used to implement a variety of features,
      such as real-time data updates, progress bars, and loading spinners.

    - `Single-subscription streams:` These streams can only be listened to by a single subscriber.
      Once a subscriber has listened to the stream, no other subscriber can listen to it.
    - `Broadcast streams:` These streams can be listened to by multiple subscribers. When a
      broadcast
      stream emits an event, all of its subscribers are notified.

22. what is the list?

    - List is used to representing a collection of objects.

23. what is hasMap?

    - A HashMap is an implementation of a map based on a hashtable. A map is a collection of
      key-value pairs. Each value is associated with a key. A HashMap is an unordered collection of
      key-value pairs. The keys of a HashMap must have Object.

24. what is set?

    - Sets in Dart is a special case in List where all the inputs are unique i.e it doesn't contain
      any repeated input.

25. what is iterable?

    - An Iterable is a collection of elements that can be accessed sequentially. In Dart, an
      Iterable is an abstract class, meaning that you can't instantiate it directly. However, you
      can create a new Iterable by creating a new List or Set .

26. what is instance?

    - Dart is an object-oriented language with classes and mixin-based inheritance. Every object is
      an instance of a class

27. what is internal?

    - The _`internal` construction is just a name often given to constructors that are private to
      the
      class (the name is not required to be ._internal you can create a private constructor using
      any Class._someName construction).

28. What is extend?

    - the `extends` keyword is used to change the behavior of a class using inheritance. Inheritance
      is the ability of a class to derive properties and characteristics from another class.
    - `Example:`
        - Car extending vehicle: The class car could extend the class vehicle.
        - Class B extending class A: Class B inherits all properties and methods from class A.

29. What is implement?

    - A class can use the `implements` keyword to implement an abstract class. An abstract class is
      a
      class that defines a set of methods that must be implemented by subclasses. For example, the
      Shape class is an abstract class, which means that any class that extends the Shape class must
      implement the draw() method.

30. `extends` versus `implements` versus `with`/

    - **1. `extends`:**
        - **Usage:**
            - Used in class inheritance.
        - **Explanation:**
            - When a class `B` extends another class `A`, it means that `B` is inheriting all the
              properties and methods of `A`. `B` is considered a subtype of `A`.

      **2. `implements`:**
        - **Usage:**
            - Used to declare that a class will provide specific behavior outlined by an interface.
        - **Explanation:**
            - When a class `C` implements an interface `I`, it promises to provide the methods
              declared in `I`. It's a way of defining a contract for the class.

      **3. `with`:**
        - **Usage:**
            - Used in mixin composition.
        - **Explanation:**
            - When a class `D` uses a mixin `M` with the `with` keyword, it incorporates the
              behavior of `M` into itself. Mixins are a way to reuse a class's code in multiple
              class hierarchies without the need for traditional inheritance.

      **In Summary:**
        - **`extends`:** Used for class inheritance, creating a subtype.
        - **`implements`:** Used to declare that a class adheres to a specific interface's contract.
        - **`with`:** Used for mixin composition, allowing the reuse of code across different class
          hierarchies.

      **Example:**
         ```dart
         class A {
           void methodA() {}
         }
         
         class B extends A {
           // B inherits methodA from A
         }
         
         class C implements A {
           // C promises to implement methodA as declared in interface A
           void methodA() {}
         }
         
         mixin D {
           void methodD() {}
         }
         
         class E with D {
           // E incorporates the behavior of mixin D
         }
         ```

      In this example, `B` extends `A`, `C` implements `A`, and `E` uses the `D` mixin with `with`.

    **When to use each keyword:**

    - Use `extends` when creating a class that is a specialized version of another class and
      inherits
      its properties and methods.

    - Use `implements` when a class needs to conform to the behavior defined by an interface,
      ensuring
      it adheres to a specific set of requirements.

    - Use `with` when you want to incorporate the functionality of multiple classes into a single
      class without establishing inheritance, promoting code reusability and flexibility.

31. main() is static or dynamic?

    - the `main()` function is static. It is the entry point of your application and is where the
      execution of your program begins.
32. what is a constructor?

    - A constructor is a special function of the class that is responsible for initializing the
      variables of the class. Dart defines a constructor with the same name as that of the class. A
      constructor is a function and hence can be parameterized.
    - It is automatically called when an object is created.

    **Here are some characteristics of a constructor in Dart:**
    - `Name`: A constructor has the same name as the class
    - `Parameters`: A constructor can be parameterized
    - `Return type`: A constructor does not have a return type

33. what is a named constructor?

    - a named constructor is like giving a special name to a way of creating an object. Instead of
      just the usual way (`ClassName()`), you can say something like `ClassName.named()` to create
      an
      object in a different, specific way. I

34. what is fromJson and toJson?

    **`fromJson` in Dart:**
    - It's a method used to convert JSON (text) into Dart objects. It's like telling Dart how to
      create an object based on the data in a JSON string.

    **`toJson` in Dart:**
    - It's a method used to convert Dart objects into JSON (text). It's like saying, "Hey Dart, take
      this object and turn it into something we can send over the internet or save to a file."

35. what is a factory?

    - It's a constructor you use when creating a new object every time isn't necessary or is
      expensive. It's like a smart way to decide whether to make a new object or reuse an existing
      one.

36. what is override and overLoading in dart?

    **Override in Dart:**
    - It's when you use the same method name in a child class as in its parent class, but with a
      different implementation. It's like saying, "I want to provide my own version of this method."

    **Overloading in Dart:**
    - It's when you use the same method name but with different parameters in the same class. It's
      like having a method that can do slightly different things depending on what you give it.
    - Dart does not support function overloading.

37. what is super in dart?

    - It's like a shortcut to access the features or methods of the parent class from within the
      child class. It helps you refer to the superclass and use its functionalities.

38. what is typeDef in dart?

    - It's like giving a nickname to a function type, making it easier to reuse and understand. It's
      a way of defining custom types for functions.

39. what is Anonymous Functions?

    - An anonymous function in Dart is like a named function but they do not have names
      associated
      with it. An anonymous function can have zero or more parameters with optional type
      annotations. An anonymous function consists of self-contained blocks of code and that
      can be
      passed around in our code as a function parameter.

    **Example:**
    ```dart
    void main() {
      // Using an anonymous function
      var addNumbers = (int a, int b) {
        return a + b;
      };
          
      // Calling the anonymous function
      print(addNumbers(3, 7)); // Outputs: 10
    }
    ```

    In this example, `addNumbers` is an anonymous function that adds two numbers. It's
    defined and used right where it's needed.

40. Can we send data from the get request to the server?

    - Generally, in a GET request, data is sent as part of the URL parameters.
    - send data through get request limit is 2048 characters.
    - Example:
      GET `/api/resource?param1=value1&param2=value2`

41. types of api methods

    - `GET` /api/users to retrieve data of all users.
    - `POST` /api/users to create a new user.
    - `PUT` /api/users/:id to update the user with the specified ID.
    - `PATCH` /api/users/:id to partially update the user with the specified ID.
    - `DELETE` /api/users/:id to delete the user with the specified ID.
    - OPTIONS /api/users to retrieve the supported HTTP methods for the /api/users endpoint.

42. Constant Constructor in Dart:

    - a constant constructor creates a constant object. A constant object is an object whose value
      cannot be changed.
    - To declare a constant constructor, use the keyword const. For
      example, `const BlueSquare(size: 50)`

43. what is sealed class?

    - Sealed classes are used to restrict the users from inheriting the class. A class can be sealed
      by using the sealed keyword. The keyword tells the compiler that the class is sealed, and
      therefore, cannot be extended. No class can be derived from a sealed class.

44. what is the immutable and mutable class?

    - An immutable object is an object whose state cannot be changed after it is created. A mutable
      object can be changed after it is created.

45. What’s the difference between `hot reload` and `hot restart`?

    Hot reload maintains the app state while updating the UI almost instantaneously whereas Hot
    restart resets the app state to its initial conditions before updating the UI.


46. What is an App State?

    State that is not *ephemeral*, that you want to share across many parts of your app, and that
    you want to keep between user sessions, is what we call **application state** (sometimes also
    called *shared state*).

    Examples of application state:
    * User preferences
    * Login info
    * Notifications in a social networking app
    * The shopping cart in an e-commerce app
    * Read/unread state of articles in a news app

47. What are the different build modes in Flutter?

    The Flutter tooling supports three modes when compiling your app, and a headless mode for
    testing.
    You choose a compilation mode depending on where you are in the development cycle.
    The modes are:

    **`Debug:`** Enables hot reload, asserts, and other debugging features to aid in development.

    **`Profile:`** Similar to release mode but enables profiling tools to analyze app performance.

    **`Release:`** Produces an optimized app with improved performance and reduced size for
    production deployment.

48. What is the difference between `NetworkImage` and `Image.network` in flutter?

    - `NetworkImage` class creates an object the provides an image from the src URL passed to it. It
      is not a widget and does not output an image to the screen.

    - `Image.network` creates a widget that displays an image on the screen. It is just a named
      constructor on the Image class (a stateful widget). It sets the image property using the
      NetworkImage . This image property is used finally to display the image.

49. What is use of `Navigation.push` and `Navigation.pop` function?

    The `push` method is used to add a route to the stack of routes managed by the navigator.
    The `pop` method is used to remove the current route from the stack of routes managed by the
    navigator.

50. When do you use double.INFINITY?

    `double.INFINITY` is used to by the child widget to occupy the remaining height of the parent
    widget.

51. What is the difference between Expanded and Flexible widgets?

    `Expanded` is just a shorthand for `Flexible`

    Using expanded this way:
    ```dart
    Expanded(
        child: Foo(),
    );
    ```
    is strictly equivalent to:
    ```dart
    Flexible(
        fit: FlexFit.tight,
        child: Foo(),
    );
    ```

    You may want to use `Flexible` over `Expanded` when you want a different `fit`, useful in some
    responsive layouts.

    The difference between `FlexFit.tight` and `FlexFit.loose` is that loose will allow its child to
    have a maximum size while tight forces that child to fill all the available space.


52. What is Fat Arrow Notation in Dart and when do you use it?

    The fat arrow syntax is simply a short hand for returning an expression and is similar
    to `(){ return expression; }`.

    The fat arrow is for returning a single line, braces are for returning a code block.

    Only an expression—not a statement—can appear between the arrow (`=>`) and the semicolon (`;`).
    For example, you can’t put an *if* statement there, but you can use a *conditional* expression
    ```dart
    // Normal function
    void function1(int a) {
      if (a == 3) {
        print('arg was 3');
      } else {
        print('arg was not 3');
      }
    }
    
    // Arrow Function
    void function2(int a) => print('arg was ${a == 3 ? '' : 'not '}3');
    ```

53. What is ***ScopedModel/BLoC Pattern?***

    `ScopedModel` and `BLoC (Business Logic Components)` are common Flutter app architecture
    patterns to help separate business logic from UI code and using fewer Stateful Widgets.

    * `Scoped Model` is a third-party package that is not included into Flutter framework. It's a
      set of utilities that allow you to easily pass a data Model from a parent Widget down to its
      descendants. In addition, it also rebuilds all of the children that use the model when the
      model is updated. This library was originally extracted from the Fuchsia codebase.

    * `BLoC` stands for Business Logic Components. It helps in managing state and make access to
      data from a central place in your project. The gist of BLoC is that everything in the app
      should be represented as stream of events: widgets submit events; other widgets will respond.
      BLoC sits in the middle, managing the conversation.


54. What is `BuildContext` and how is it useful?

    - BuildContext is actually the widget's element in the Element tree — so every widget has its
      own BuildContext.
    - You usually use BuildContext to get a reference to the theme or to another widget. For
      example, if
    - you want to show a material dialog, you need a reference to the scaffold. You can get it with
    - Scaffold.of(context), where context is the build context. of() searches up the tree until it
      finds the nearest scaffold.

55. What is the difference between `WidgetsApp` and `MaterialApp`?

    - `WidgetsApp` provides basic navigation. Together with the `widgets` library, it includes many
      of the foundational widgets that Flutter uses.
    - `MaterialApp` and the corresponding `material` library is a layer built on top of `WidgetsApp`
      and the widgets library. It implements Material Design, which gives the app a unified look and
      feel on any platform or device. The `material` library has many additional widgets that come
      with it.
    - You certainly aren’t required to use `MaterialApp` in your project. You can use `CupertinoApp`
      to make iOS users feel at home, or you can even build your own set of custom widgets to fit
      your brand.


56. Can you nest a `Scaffold`? Why or why not?

    - Yes, you can absolutely nest a `Scaffold`. That’s the beauty of Flutter. You control the
      entire UI.
        - `Scaffold` is just a widget, so you can put it anywhere a widget might go. By nesting
          a `Scaffold`,
        - you can layer drawers, snack bars and bottom sheets.

57. What is the purpose of `SafeArea` in Flutter?

    `SafeArea` is an important and useful widget in Flutter which makes UI dynamic and adaptive to a
    wide variety of devices. While designing the layout of widgets, we consider different types of
    devices and their pre-occupied constraints of screen like status bar, notches, navigation bar,
    etc.

58. How does Flutter handle platform-specific code and integrate with native features in iOS and
    Android?

    Flutter handles platform-specific code and integrates with native features through the following
    mechanisms:

    1. **Platform Channels:**
        - Flutter uses platform channels to communicate with native code. This allows Flutter to
          call platform-specific code written in languages like Java (for Android) or Swift (for
          iOS) and vice versa. It's a bridge for exchanging messages between Dart code in Flutter
          and native code.

    2. **Plugins:**
        - Flutter provides a rich ecosystem of plugins, which are packages that include both Dart
          code for the Flutter app and native code for each platform. These plugins encapsulate
          platform-specific functionality, allowing developers to access native features seamlessly.
          Examples include camera access, GPS, or device sensors.

    3. **Method Channels:**
        - Method channels are a specific type of platform channel that allows Dart and native code
          to invoke methods on each other. This enables Flutter to trigger platform-specific
          functionality and receive results back.

    4. **Platform-specific Code:**
        - Flutter apps can include platform-specific code written in the native language of each
          platform. This code can be placed in designated folders (e.g., `android` and `ios`
          directories) and is integrated into the build process. Flutter's build system ensures that
          the appropriate platform-specific code is compiled and packaged with the app.

    5. **Widgets and Themes:**
        - Flutter provides widgets that adapt to the underlying platform's design guidelines. For
          example, `Cupertino` widgets provide an iOS-specific design, while `Material` widgets
          adhere to Android's Material Design. This allows Flutter apps to look and feel native on
          each platform.

    - In summary, Flutter handles platform-specific code through platform channels, plugins, and
      method
      channels. It allows seamless integration with native features on iOS and Android, enabling
      developers to build cross-platform apps with a native look and feel.

59. How to call native methods in flutter web?

    - Native methods cannot be called directly in Flutter web
    - Flutter web does not support platform channels
    - Use JavaScript interop to communicate with web APIs
    - Consider using conditional imports to switch between web and native implementations

60. How do you `talk to native code` from within a Flutter app?

    - One type of platform channel is a method channel. Data is serialized on the Dart side and then
      sent to the native side. You can write native code to interact with the platform before
      sending a serialized message back. That message might be written in Java or Kotlin on Android
      or Objective-C or Swift on iOS.
    - The second type of platform channel is the event channel, which you use to send a stream of
      data from the native platform back to Flutter. This is useful for monitoring sensor data.

61. What is the use of having `Android and iOS folders` in the Flutter project?

    - `Android`:  This folder is meant for holding an entire Android project. This will come into
      usage when you want to build a Flutter application for the Android platform. When you compile
      a Flutter code into the native code, it will enter into the Android project and gives you a
      native Android application.

    - `iOS`: This folder is meant for holding an entire Mac project. This will come into usage when
      you want to build a Flutter application for the iOS platform. It works similarly to the
      Android folder.
      When you compile a Flutter code into the native code, it will enter into the Android iOS
      project and gives you a native Android application. Building a Flutter application will only
      be possible when you work on Xcode IDE and macOS.

62. Explain `async`, `await`, `then`, `whenComplete` and `Future` in Dart?

    - `Async` means that this function is asynchronous and you might need to wait a bit to get its
      result.
    - `Await` literally means - wait here until this function is finished and you will get its
      return
      value.
    - `.Then((value){…})` is a callback that’s called when future completes successfully(with a
      value)
    - `Future` is a type that ‘comes from the future’ and returns value from your asynchronous
      function.
      A Future completes successfully with a value or fails with an error.
    - `.whenComplete` will fire a function either when the Future completes with an error or not,
      instead.

63. What is future builder in flutter?

    - FutureBuilder in Flutter is a widget that helps you to display data from an asynchronous
      operation. It allows you to specify a widget to be displayed while the operation is in
      progress, and a widget to be displayed when the operation is complete.

    **The FutureBuilder widget has three states:**
    - `Waiting`: The Future is not yet complete.
    - `Done`: The Future has completed successfully and its value is available.
    - `Error`: The Future has completed with an error.

64. what is the stream builder flutter

    - StreamBuilder is a widget in Flutter that helps you build UIs that respond to asynchronous
      operations. It takes a Future or a Stream as an argument and builds a widget based on the
      state of the Future or Stream.

    - waiting , done or complete states.

    - To display real-time data from a sensor, such as the accelerometer or gyroscope.
    - To display the results of a search query as the user types.
    - To display a list of messages as they are received from a server.
    - To display the progress of a long-running operation, such as uploading a file.

65. difference between Futurebuilder and streambuilder.

    **FutureBuilder:**

    - Used for one-time asynchronous data retrieval.
    - Retrieves data from a Future object, which represents a single asynchronous operation.
    - Suitable for scenarios where the data is retrieved once and does not change dynamically.
    - Example: Fetching data from an API, loading an image from a URL.

    **StreamBuilder:**

    - Used for continuous asynchronous data retrieval.
    - Retrieves data from a Stream object, which represents a sequence of events or updates.
    - Suitable for scenarios where the data is constantly changing and needs to be updated in
      real-time.
    - Example: Real-time chat applications, live sensor data monitoring.

    **When to use:**

    `FutureBuilder`: Choose FutureBuilder when you need to retrieve data once and display it in a
    static manner. Examples include fetching product information from an API or loading a
    configuration file.

    `StreamBuilder`: Opt for StreamBuilder when you need to display data that changes over time.
    This includes scenarios like live chat conversations, real-time sensor readings, or dynamic data
    updates.
66. What is chanel socket?

    - A channel socket in Flutter is a communication channel between two Flutter applications or
      between a Flutter application and a native platform. It can be used to send and receive data
      in real time.
      There are two main types of channel sockets in Flutter:
    - `Method channels`: Method channels are used to send and receive synchronous messages.
    - `Stream channels`: Stream channels are used to send and receive asynchronous messages.

    **Examples:**
    1. To communicate between two Flutter applications: You can use channel sockets to send and
       receive messages between two Flutter applications that are running on the same device or on
       different devices. For example, you could use channel sockets to implement a chat application
       or a multiplayer game.
    2. To communicate between a Flutter application and a native platform: You can use channel
       sockets to send and receive messages between a Flutter application and a native platform,
       such as Android or iOS. For example, you could use channel sockets to access the device's
       camera or microphone.

67. What is a method channel?

    - A method channel in Flutter is a way for Dart code to communicate with native code on Android
      and iOS. This allows Flutter developers to access platform-specific features, such as device
      sensors, GPS, and camera, without having to write native code.

68. How does MVVM structure work?

    MVVM, or Model-View-ViewModel, is a software design pattern that separates the
    application's business logic from its presentation layer. This makes the application
    easier to maintain and test, and also makes it more reusable.

    **Three component:**

    - Model: The model represents the application's data and business logic. It is responsible
      for storing and managing the data, and for performing any necessary calculations or
      transformations.
    - View: The view is the user interface of the application. It is responsible for displaying
      the data to the user and for collecting user input.
    - ViewModel: The view model is the intermediary between the model and the view. It is
      responsible for exposing the data from the model to the view in a way that is easy for the
      view to consume. It is also responsible for handling user input and updating the model
      accordingly.

    - The MVVM pattern works by having the view bind to the view model. This means that the view
      observes
      the view model for changes. When the view model changes, the view is automatically updated.

    - Diagram:
      `[View] <---> [ViewModel] <---> [Model]`

69. How does MVC structure work?

    MVC, or Model-View-Controller, is another software design pattern that separates the
    application's business logic from its presentation layer. It is similar to the MVVM pattern, but
    there are some key differences.
    In the MVC pattern, the controller is responsible for handling user input and updating the model
    accordingly. The view is then responsible for displaying the data from the model.
    The controller is typically implemented as a class that handles user input events. When the user
    interacts with the view, the view fires an event. The controller then listens for these events
    and takes appropriate action.

    - For example, if the user clicks on a button, the view might fire a buttonClicked() event. The
      controller would then listen for this event and update the model accordingly. For example, the
      controller might call a method on the model to create a new record.

    - Once the model has been updated, the controller would then notify the view that the data has
      changed. The view would then update its own display to reflect the new data.

    - Diagram:
      `[View] <---> [Controller] <---> [Model]`


70. What is the Bloc and why we should use it as state management tool

    - BLoC, or Business Logic Component, is a state management pattern for Flutter apps. It
      separates the app's business logic from its presentation layer, making it easier to test and
      maintain your code.
    - To use BLoC in your Flutter app, you will need to create a BLoC class for each part of your
      app that needs to manage state. The BLoC class will contain the app's business logic and will
      expose a stream of events that the UI can listen to.
    - The UI will listen to the stream of events from the BLoC and update itself accordingly. When
      the user interacts with the UI, it will dispatch events to the BLoC. The BLoC will then update
      its state and emit a new event.

71. How many threads are used by flutter

    - Flutter uses a single thread for the main UI and multiple threads for background tasks. The
      main UI thread is responsible for rendering the widget tree and handling user input. The
      background threads are used for tasks such as networking, file I/O, and image decoding.
    - The number of background threads used by Flutter depends on the platform and the specific
      tasks that are being performed. For example, on Android, Flutter uses a thread pool of four
      threads for background tasks.
    - Flutter also uses isolates to isolate background tasks from the main UI thread. This helps to
      improve performance and prevent the app from crashing if a background task fails.

72. Yield and yield*
    - the `yield` keyword returns a single value from a generator function. It also pauses the
      function's execution until the next value is requested.

    - `yield*` provides multiple values from another Iterable or Stream.

73. Yield and return
    - the `yield` keyword is used to return a value from a generator function and pause the
      function's execution until the next value is requested.
        - Ex: It's akin to a storyteller concluding a tale, offering the resolution or final
          outcome.
    - `Return` a value from a function and terminates its execution.
        - Ex: Picture a teacher distributing one question at a time during an exam, allowing
          students to respond gradually. Each question "yields" an answer.

74. In Dart, what are the main differences between a var, final, and const variable declaration, and
    when would you choose to use each of them in your code?

    **var:**

    - Used to declare a variable without explicitly specifying its type.
    - Dart infers the type based on the initial value assigned.
    - The variable's value can be reassigned at any time.

    **final:**

    - Similar to `var`, but the variable's value can only be assigned once.
    - The type can be explicitly specified or inferred.
    - Commonly used for immutable values that don't change during runtime.

    **const:**

    - Similar to `final`, but the variable's value must be known at compile time.
    - The type must be explicitly specified.
    - Primarily used for constant values that remain unchanged throughout the program's execution.

    **When to use each:**

    - **var:** Use for variables whose type is clear and may change during runtime.
    - **final:** Use for variables whose value is fixed and should not be reassigned.
    - **const:** Use for constant values that are known at compile time and never change.

75. What is a "callback function," and how does it relate to asynchronous programming in Dart?

    - It's like telling Dart, "When you're done with this task, here's a function to call." In
      asynchronous programming, it helps handle tasks that take time, like fetching data or reading
      files, without blocking the rest of your program.

    In other words, a callback function is a function passed as an argument to another function, and
    it's called back when a specific task is complete, making it crucial in asynchronous operations
    in Dart.

76. Explain the concept of "dependency injection" and how it can be implemented in Dart
    applications.

    **Dependency Injection in Dart:**
    - It's like giving your app a shopping list. Instead of creating objects directly, you provide a
      list of things your objects need. Dart then hands you the ready-made objects, making your app
      more organized and modular.

    In Dart, you can implement dependency injection by either manually passing dependencies as
    parameters or using packages like `get_it` or built-in tools like `Provider` for Flutter.

77. Dart provides a rich standard library. Name and briefly explain the purpose of three built-in
    libraries in Dart.

    1. **`dart:core`:**
        - It's like the essential toolbox. It includes fundamental classes and types, like `String`
          , `List`, and `Map`, along with core functionality such as exception handling and basic
          operators.

    2. **`dart:io`:**
        - This is your connection to the outside world. It includes classes for input and output
          operations, allowing your Dart programs to interact with files, directories, and the
          system.

    3. **`dart:async`:**
        - It's like the timekeeper. This library provides classes and utilities for asynchronous
          programming, including futures, streams, and timers. It's crucial for handling tasks that
          take time without blocking the program's flow.

78. How does Dart handle memory management and garbage collection? Is manual memory management
    required in Dart?

    - Dart uses automatic memory management and has a garbage collector. You don't need to manually
      allocate or deallocate memory. The garbage collector automatically identifies and frees up
      memory that is no longer in use, making memory management more convenient and less
      error-prone.

79. what is firebase? And How You use it in your App?

    - Google Firebase is a set of cloud-based development tools that helps mobile app developers
      build, deploy and scale their apps.
    - No-Sql Database.
    - In my app, I use Firebase to:
    - Authentication: Implement user sign-up, sign-in, and account management.
    - Realtime Database or Firestore: Store and sync app data in real-time, including user-generated
      content and structured data.
    - Cloud Functions: Execute serverless functions in response to events or HTTP requests.
    - Cloud Messaging (FCM): Send push notifications to engage with users.
    - Analytics: Track user engagement and app performance.
    - Cloud Storage: Store and serve user-generated content like images and videos.
    - Hosting: Deploy web apps and serve them through Firebase Hosting.

80. What is `profile mode` and when do you use it?

    - In profile mode, some debugging ability is maintained—enough to profile your app’s
      performance. Profile mode is disabled on the emulator and simulator, because their behavior is
      not representative of real performance.

81. What types of `tests` can you perform?

    There are three main kinds of tests:
    - unit tests, widget tests and integration tests.
    - `Unit tests` are all about checking the validity of your business logic.
    - `Widget tests` are for making sure UI widgets have the components that you expect them to.
    - `Integration tests` check that your app is working as a whole.


82. What is the difference between debug mode, profile mode and release mode?

    * Use debug mode during development, when you want to use hot reload.
    * Use profile mode when you want to analyze performance.
    * Use release mode when you are ready to release your app.

83. Deploy Flutter app on playstore
    - [https://medium.com/@bernes.dev/deploying-flutter-apps-to-the-playstore-1bd0cce0d15c](https://medium.com/@bernes.dev/deploying-flutter-apps-to-the-playstore-1bd0cce0d15c)
84. Deploy Flutter app on Appstore
    - [https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android](https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android)
85. From your application to AWS how you can call the API securely?
    - Use AWS Signature Version 4 (SigV4): SigV4 is a signing algorithm that ensures that your API
      calls are authentic and authorized. When you make an API call, you must sign the request using
      your AWS access key ID and secret access key.

86. What is ipv4?
    - IPv4, or Internet Protocol version 4, is the fourth version of the Internet Protocol. It is
      the most widely used version of the protocol today.

    - IPv4 is a 32-bit protocol, which means that it uses 32 bits to represent an IP address. An
      IPv4 address is typically written in dotted decimal format, where each octet is represented by
      a number
      between 0 and 255. For example, 192.168.1.1 is a valid IPv4 address.

87. what is MQTT? How it works?

    - MQTT is a way for devices to talk to each other over low-bandwidth networks.

    Here is a simple example of how MQTT can be used:

    - A temperature sensor publishes its current reading to the topic temperature/sensor1.
    - A smartphone app subscribes to the topic temperature/sensor1.
    - When the temperature sensor publishes a new reading, the smartphone app will receive the
      message and update its display.
    - MQTT works on a publish/subscribe basis. Publishers send messages to topics, and subscribers
      subscribe to topics. When a publisher sends a message to a topic, all subscribers to that
      topic will receive the message.

88. What is Sqflite? pros and cons in comparison to another database like Hive.

    - Sqflite is a relational database management system (RDBMS) that is lightweight, easy to use,
      and supports a wide range of SQL features. Hive is a NoSQL database that is lightweight, fast,
      and easy to use.
    - Which database you choose will depend on your specific needs. If you need a database that
      supports a wide range of SQL features and is well-documented, then Sqflite is a good choice.
      If you need a database that is lightweight, fast, and easy to use, then Hive is a good choice.
    - `Sqflite` is a good choice for complex applications that require a wide range of SQL features.
    - `Hive` is a good choice for simple applications that need a lightweight and fast database.

89. Explain the role of state management in Flutter, and discuss some popular state management
    approaches or libraries.

    **Role of State Management in Flutter:**
    - It's like keeping track of the variables your app uses. State management helps Flutter know
      what data has changed, so it can update the user interface accordingly.

    **Popular State Management Approaches:**
    1. **`setState`:**
        - It's the built-in way in Flutter. When the state changes, you call `setState`, and Flutter
          redraws the UI. Simple and effective for smaller apps.

    2. **Provider:**
        - It's like a global manager for your data. It allows components to listen and react to
          changes in the data it manages.

    3. **Bloc (Business Logic Component):**
        - It's like a traffic cop for your app's data. It helps organize and manage the flow of
          information between different parts of your app.

    4. **GetX:**
        - It's like a Swiss Army knife for state management. It provides a simple and powerful way
          to manage state, routes, dependencies, and more.

90. How can you use Flutter to create responsive and adaptive user interfaces for different screen
    sizes and orientations?

    - Media Query. Media Query can be used to get the real-time size (width/height) and
      orientation (portrait/landscape) of the window screen.
    - Layout Builder
    - Orientation Builder
    - Expanded and Flexible Widgets
    - Aspect Ratio Widget
    - Fractionally Sized Box Widgets
    - Custom MutiChild Layout Class.
