# 🎨 Object-Oriented Programming (OOPS) Concepts 🚀

1. Classes and Object:
    - A class is a blueprint for creating object. class is the collection of data methods and data
      function means which includes these fields, getter, setter, constructor and functions.
    - Object is an instance of a class. an object is a variable of instance of the class used to
      access the class's properties.

2. Inheritance:
    - In Dart, you can create a new class based on an existing one by using the extends keyword.
      This process is known as inheritance, where one class inherits the properties and methods of
      another class.
    - In Simple, one class can inherit another class. i.e dart can create a new class from an
      existing class. We make use of extend keyword to do so.
        - Example: class child_class extends parent_class{ }.

   *Types of Inheritance:*

    - Single Inheritance: a class can inherit from only one class in dart. we can extend one class
      at a time.
    - Multiple Inheritance: Dart doesn't support multiple inheritance, which means a class cannot
      extend more than one class.
    - Multilevel Inheritance: a class can inherit from another class and that class can also inherit
      from another class.
        - Example is as below:
            - Animal is the base class.
            - Mammal inherits from Animal.
            - Dog inherits from Mammal.
    - hierarchical Inheritance: Hierarchical inheritance in Dart is a type of inheritance where
      multiple subclasses inherit from a single parent class. This allows subclasses to share the
      properties and methods of their parent class, while also adding their own unique features.
        - Example:
            - Cat and Dog are both derived classes from the common parent class Animal.
            - Both Cat and Dog inherit the eat() method from the Animal class.
            - Cat has its own method meow(), and Dog has its own method bark().

3. Abstraction:
    - Abstract classes are classes that cannot be initialized. it is used to define the behavior of
      the class that can be inherited by another class. an abstract class is declared using the
      abstract keyword.
    - abstract class's objects cannot be created but can be extended.
    - abstract classes can contain abstract methods (without implementation) and concrete methods (
      with implementation).

4. Polymorphism:
    - polymorphism is updating or modifying a feature, function or implementation that already
      exists in the parent class.
    - subclass can override the behavior of the parent class.

5. Encapsulation:
    - concepts of bundling data and methods within a class. hiding the internal implementation
      details from the outside the class.
        - How To Achieve Encapsulation In Dart?
            - Providing public getter and setter methods to access and update the value of private
              property.
            - Getter and setter methods are used to access and update the value of private property.
              Getter methods are used to access the value of privatasserte property. Setter methods
              are used to update the value of private property.

# 🚀 Flutter Interview Questions and Answers 💡

1. What is `Flutter` and Explain Flutter Inspector. Write features,Advantages and limitations?

   `Flutter` is a free, open-source software development kit (SDK) for building cross-platform
   mobile applications. It was created by Google and released in May 2017. Flutter is built using C,
   C++, Skia - 2D rendering engine, and Dart-object-oriented language.

   In the same manner, as with Native Android, the XML file allows us to view our app's blueprint
   and properties. There is a powerful tool called Flutter Inspector for Flutter applications that
   allows you to visualize the blueprint of your widgets and their properties. Using it, you can
   diagnose various layout issues and understand the current layout.

   **Flutter Inspector offers the following benefits:**
    - Select widget mode
    - Toggle platform
    - Show paint baselines
    - Show debug paint
    - Refresh widget
    - Enable slow animations
    - Show/hide performance overlay

   **Advantages**:
    - Reduce Code Development
    - Cross-platform Development
    - Live and Hot Reloading
    - Similar to Native App performance
    - Good Community Support
    - Little/Minimal Code
    - Expressive and Flexible UI

   **Features:**
    - Flexibility, scalability, and integration
    - Hot Reload
    - One-Stop Solution
    - Native Performance and Internationalized Flutter Libraries
    - Huge Widget Library

   **limitations:**
    - Third-party libraries are limited
    - Release size is larger
    - Requirements of Dart
    - Limited complexity
    - Lack of overall support

2. What is `Dart`?

   `Dart` is a general-purpose, object-oriented programming language with C-style syntax. It is
   open-source and developed by Google in 2011. The purpose of Dart programming is to create a
   frontend user interfaces for the web and mobile apps. It is an important language for creating
   Flutter apps. The Dart language can be compiled both AOT (Ahead-of-Time) and JIT (Just-in-Time).


1. What is role of `sdk` in the flutter and it's features?
    - The Flutter SDK provides tools, libraries, and resources to create user interfaces for Android
      and iOS. It uses a single codebase to help developers build high-performance, scalable
      applications.
    - **Features:**
        - Dart SDK
        - Contains a rendering engine, widgets, APIs for testing and integration, etc.
        - Compilation tools for Native Machine Code (code for iOS and Android).
        - React-style modern framework
        - Provide Interop and plugin APIs to connect with system and 3rd-party SDKs.
        - A headless test runner that runs tests on Windows, Linux, and Mac.
        - Use the Dart DevTools to test, debug, and profile your app. Use
        - Flutter and Dart command-line tools to develop, build, test and compile your apps across
          platforms.

2. Why `Flutter` uses `Dart` as Programming Language and Why does it generally take a long time to
   develop a Flutter app??

    - Flutter uses Dart as its programming language because Dart is declarative and programmatic,
      making it easy for developers to read and visualize. Dart also allows Flutter to avoid the
      need for a separate declarative layout language like XML or JSX.

    - Dart is faster than JavaScript because it can be compiled both AOT (Ahead-of-Time) and JIT (
      Just-in-Time). Flutter uses JIT compilation for development and AOT for launching the
      application. Release versions of Flutter apps on all platforms use ahead-of-time (AOT)
      compilation, except for on the Web, where code is transpiled to JavaScript.

    - Because Flutter generates a device-specific IPA or APK file, building a Flutter application
      takes substantially longer the first time. This method, which normally takes a long time, uses
      Xcode and Gradle to build a file.

3. Tell the full form of API.

    - Application Programming Interface.

4. Diff between the Package and plugin in Flutter?
    - A `plugin` is a special kind of package that involves native `Kotlin`/`Java`(for Android)
      or `swift`/`Objective-C`(for iOS) code.
    - A package contains only dart code.

   You need a plugin when you need to communicate with native OS.

   Some examples of packages and plugins are as follow:

   Package:

    - `http`: A package that provides an easy-to-use API for making HTTP requests from a Flutter
      app.

    - `shared_preferences`: A package that provides a simple way to store and retrieve key-value
      pairs in persistent storage.

    - `intl`: A package that provides internationalization and localization support for Flutter
      apps.

   Plugin:

    - `camera`: A plugin that provides access to the device's camera and allows taking pictures and
      recording videos.
    - `firebase_messaging`: A plugin that allows Flutter apps to receive and handle push
      notifications using Firebase Cloud Messaging.
    - `google_maps_flutter`: A plugin that provides a Flutter widget for displaying interactive maps
      using the Google Maps API.

   From the examples it should be clear why plugin require native code.

6. Dart is known for its "Ahead of Time" (AOT) and "Just in Time" (JIT) compilation. Can you explain
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

7. What are the `Flutter widgets`?

   In Flutter, a widget is a basic unit of the user interface (UI). Widgets are reusable pieces of
   code that describe how a part of the UI should be displayed. They can be combined and nested to
   create a dynamic UI.

8. Can you tell us the four main elements of Flutter? and Explain the flutter architecture.
    - Flutter engine, Widgets, Design-specific widgets, Foundation Library
    - `Upper layers`: The Dart-based platform that takes care of app widgets, gestures, animations,
      illustrations, and materials;
    - `Flutter engine`: Handles the display and formatting of text.
    - `Built-in service`: Used for the management of plugins, packages, and event loops.

9. Explain an `interface` in dart with an example?
    - Unlike other languages dart does not have any interface keyword, You can implement it with an
      abstract keyword.

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

11. What is an extension?
    - to add new methods to existing classes or interfaces without changing their original
      implementation.

12. Dart – Standard `Input` `Output`.
    - Input: In Dart programming language, you can take standard input from the user through the
      console via the use of .readLineSync() function. To take input from the console you need to
      import a library, named dart:io from libraries of Dart.

    ```dart
    void main()
    {
        print("Enter your name?");
        // Reading name of the Harkishan
        String? name = stdin.readLineSync(); 
    }
    ```

    > Stdin Class: This Stdin class allows the user to synchronously and asynchronously read data from standard input.
    > One of the methods used to take the input from the user is readLineSync(). Consider this example:

    - Output: There are two possible ways to show output in the console in Dart. By using the print
      statement, By using stdout.write() method. Let us see this with an example:

    ```dart
    void main()
    {
        // Printing in first way
        print("Welcome to My Haveli ! // printing from print statement");
        
        // Printing in second way
        stdout.write("Welcome to My Haveli! // printing from stdout.write()");
    }
    ```


13. What is the `late` keyword used for?
    - In Dart, the late keyword is used to declare a non-nullable variable that will be initialized
      later. It was introduced in Dart 2.12 as a way to support lazy initialization of variables.
    - When you declare a variable as late, you are promising the compiler that the variable will be
      initialized before it is used. If the variable is not initialized before it is used, a
      LateInitializationError will be thrown at runtime.

14. What is generic in dart?
    - In Dart, generics are a way to create reusable functions, classes, and types that can work
      with multiple data types, while still providing type safety.
    - We can achieve using T operator.

    ```dart
        class Dropdown<T> {
          final List<T> items;
          
          Dropdown(this.items);
        }
     ```

    - Using the generic class:

    ```dart
        // Create a dropdown with a list of strings
        Dropdown<String> stringDropdown = Dropdown(['Apple', 'Banana', 'Cherry']);
        
        // Create a dropdown with a list of integers
        Dropdown<int> intDropdown = Dropdown([1, 2, 3, 4, 5]);
     ```

    > By using generics, we've created a reusable Dropdown class that can work with different types of lists,
    > while still providing type safety. This means that we can't accidentally add a string to an intDropdown or vice versa.


15. What is `Expanded` and `Flexible` in Dart?
    - `Expanded`: A widget that expands a child of a Row, Column, or Flex so that the child fills
      the available space. Using an Expanded widget makes a child of a Row, Column, or Flex expand
      to fill the available space along the main axis (e.g., horizontally for a Row or vertically
      for a Column).
    - `Flexible`: Using a Flexible widget gives a child of a Row, Column, or Flex the flexibility to
      expand to fill the available space in the main axis (e.g., horizontally for a Row or
      vertically for a Column), but, unlike Expanded, Flexible does not require the child to fill
      the available space.
    > Expanded is similar to Flexible with its fit property set to FlexFit.tight by default.

16. Flex widget in dart.
    - Flex is a widget that displays its children in a one-dimensional array, either horizontally or
      vertically. It's similar to a Row or Column widget.
    ```dart
         Flex(
           direction: Axis.horizontal, // or Axis.vertical
           children: [
           Container(
            width: 100,
            height: 100,
            color: Colors.red,
           ),
           Container(
             width: 200,
             height: 100,
             color: Colors.green,
           ),
           Container(
            width: 50,
            height: 100,
            color: Colors.blue,
           ),
           ],
       )
     ```

17. didChangedependencies vs didupdatewidget
    - didChangeDependencies():
        - `didChangeDependencies()` is called when a dependency of the State object changes, such as
          when an InheritedWidget that the widget depends on changes.
        - `didChangeDependencies()` is called immediately after initState() and whenever a
          dependency changes.
        - `didChangeDependencies()` is useful for performing expensive operations (e.g., network
          fetches) when dependencies change, as the framework will only call this method when
          necessary.
    - didUpdateWidget():
        - `didUpdateWidget()` is called whenever the widget configuration changes, such as when the
          parent widget passes new data to the child widget.
        - `didUpdateWidget()` is called whenever the widget's configuration changes, typically when
          the parent widget passes new data to the child.
        - `didUpdateWidget()` is useful for updating the widget's UI in response to changes in the
          widget's configuration, such as updating the UI when the parent widget passes new data.


17. What does mean context.mounted = false?
    - When context.mounted is false, it means that the widget is no longer part of the widget tree
      and has been disposed or removed.

18. What is `as` and `is` in Dart?
    - `as` keyword: The as keyword is used for type casting, which means it converts an object of
      one type to another type.
        ```dart
            var obj = 'Hello';
            String str = obj as String;
      ```
      > In this example, obj is of type Object, but we cast it to String using the as keyword.
    - `is` keyword: The is keyword is used for type checking, which means it checks if an object is
      of a specific type and will return bool.
        ```dart
            var obj = 'Hello';
            if (obj is String) {
              print('obj is a String');
            }
       ```
      > In this example, the is keyword checks if obj is of type String. If it is, the code inside the if statement will be executed.


19. Why we use state management why not SetState?
    - Using `setState`: Let's say you have a StatefulWidget with 10 widgets, and you want to update
      the text of one of them. If you use `setState`, the entire widget tree will be rebuilt, which
      can be slow and inefficient.
    - Using State management: By using a state management solution like `Provider`, `Riverpod`,
      or `Bloc`, you can decouple your widgets from the state of your app and only rebuild the
      widgets that need to be updated.


17. Var and Dynamic.
    - dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
    - var: can't change TYPE of the variable, but can change the VALUE of the variable later in
      code.

18. What is the difference in calling Future and Future.microtask in Flutter?
    - All microtasks are executed before any other Futures/Timers.
    - This means that you will want to schedule a microtask when you want to complete a small
      computation asynchronously as soon as possible.
    ```dart
    void main() {
        Future(() => print('future 1'));
        Future(() => print('future 2'));
        // Microtasks will be executed before futures.
        Future.microtask(() => print('microtask 1'));
        Future.microtask(() => print('microtask 2'));
    }
    ```

19. What `is` and `as` keywords in dart?
    - In Dart, the is and as keywords are used for type checking and casting.
    - *The as keyword* : The as keyword is used to cast an object to a specific type. It returns the
      object if it is of the specified type, or null if it is not.
        - Here's an example:
      ```dart
        void main() {
            Object obj = 'Hello, World!';
            String str = obj as String;
            print(str); // prints "Hello, World!"
        }
      ```    
    - *The is keyword* : The is keyword is used to check if an object is of a specific type. It
      returns a boolean value indicating whether the object is of the specified type or not.
        - Here's an example:
      ```dart
      void main() {
          Object obj = 'Hello, World!';
          if (obj is String) {
          print('obj is a String');
          } else {
          print('obj is not a String');
          }
      }
      ```

20. `Queues` in Dart.
    - Dart also provides the user to manipulate a collection of data in the form of a queue. A queue
      is a FIFO (First In First Out) data structure where the element that is added first will be
      deleted first. It takes the data from one end and removes it from the other end.
    - Queues are useful when you want to build a first-in, first-out collection of data. It is the
      special case of list implementation of data in Dart.
    - For Example:

        ```dart
      void main()
        {
        // Creating a Queue
        Queue<String> geek = new Queue<String>();
        
        // Printing default
        // value of queue
        print(geek);
        
        // Adding a element
        // and displaying it
        geek.add("Geeks");
        print(geek);
        
        // Adding multiple
        // element and displaying it
        List<String> geek_data = ["For","Geeks"];
        geek.addAll(geek_data);
        print(geek);
        
        // Deleting all the
        // data from queue
        geek.clear();
        print(geek);
        
        // Checking if the
        // queue is empty or not
        print(geek.isEmpty);
        
        // Adding first element
        geek.addFirst("Geeks");
        print(geek);
        
        //Adding Last element
        geek.addLast("For");
        geek.addLast("Geeks");
        print(geek);
        
        // Checking length of the queue
        print(geek.length);
        
        // Removing First
        // Element from queue
        geek.removeFirst();
        print(geek);
        
        // Removing Last
        // element from queue
        geek.removeLast();
        print(geek);
        
        // Displaying all the
        // elements of the queue
        geek.forEach(print);
        }
      ```

21. route vs routeGenerator.

    `routes` is static and doesn't offer functionalities like passing an argument to the widget,
    implementing a different `PageRoute` etc, which is why `onGenerateRoute` exists.

    In the given code, you'll find that how using `onGenerateRoute` property, you can parse an
    argument and send it over, which isn't possible with simple `routes`.

    `FooPage` is navigated through `routes` and `BarPage` through `onGenerateRoute`.
     
    ---

    Initial setup in `MaterialApp`.

     ```dart
     void main() {
       runApp(
         MaterialApp(
           routes: {
             '/': (_) => HomePage(), // You can also use MaterialApp's `home` property instead of '/'
             '/foo': (_) => FooPage(), // No way to pass an argument to FooPage.
           },
           onGenerateRoute: (settings) {
             if (settings.name == '/bar') {
               final value = settings.arguments as int; // Retrieve the value.
               return MaterialPageRoute(builder: (_) => BarPage(value)); // Pass it to BarPage.
             }
             return null; // Let `onUnknownRoute` handle this behavior.
           },
         ),
       );
     }
     ```

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
                   onPressed: () => Navigator.pushNamed(context, '/bar', arguments: 42), // Passing argument
                   child: Text('Go to BarPage'),
                 ),
               ],
             ),
           ),
         );
       }
     }
     ```

    `foo.dart`

     ```dart
     class FooPage extends StatelessWidget {
       @override
       Widget build(_) => Scaffold(appBar: AppBar(title: Text('FooPage')));
     }
     ```

    And `bar.dart`:

     ```dart
     class BarPage extends StatelessWidget {
       final int value;
       BarPage(this.value);
     
       @override
       Widget build(_) => Scaffold(appBar: AppBar(title: Text('BarPage, value = $value')));
     }
     ```

22. 
23. Push vs pushnamed methods.
    - `push` requires a Route object, while `pushNamed` requires a String argument (the name of the
      route).

24. `Enum` in dart.
    - Enum are a special kind of class used to represent a fixed number of constant values. info
      Note. All enums automatically extend the Enum class. They are also sealed, meaning they cannot
      be subclassed, implemented, mixed in, or otherwise explicitly instantiated.
    - Enums are used to give names to constants, which makes the code easier to read and maintain.


14. Casting in dart.
    - **Definition**: Convert an object of one data type into another Or Casting in Dart is used to
      tell the compiler that you want to treat an object of one type as if it were of a different
      type.
    - Explicit cast: Convert an object of one type to another using the as keyword.
        - For Example:
          ```
          void main() {
              Object x = 12;
              int y = x as int; // explicit cast from Object to int
              print(y.runtimeType); // prints: int
          }
          ```
    - Implicit cast: Dart's type system automatically converts one type to another if it's safe. For
      instance, an integer can be implicitly cast to a double.
        - Here's an example:
          ```
          void main() {
             int integer = 10; 
             double doubleValue = integer.toDouble(); 
             print(doubleValue); 
          }
          ```

    > In Dart, implicit casting is performed using methods like `toString`, `toInt`, `toDouble`, `int.parse`, and `double.parse`,
    > while explicit casting is done with the `as` keyword, particularly for type assertions with objects.

15. Implicit interface in dart.
    - In Dart, an implicit interface is a way to define an interface without explicitly declaring
      it. This is achieved by using abstract classes.
    - In Dart, an abstract class is a class that cannot be instantiated and is intended to be
      inherited by other classes. An abstract class can define abstract methods, which are methods
      that must be implemented by any subclass.
    - When you define an abstract class, you are implicitly defining an interface. Any class that
      extends the abstract class must implement all the abstract methods defined in the abstract
      class.
        - Here's an example:
      ```dart


        abstract class Printable {
        void print();
        }

        class Document implements Printable {
           @override
           void print() {
           print('Printing a document...');
           }
        }

       class Image implements Printable {
         @override
         void print() {
         print('Printing an image...');
         }
      }
      ```

16. What is assert in dart?
    - The assert statement in Dart is a debugging tool used to verify assumptions made about the
      state of your program during development. It takes a boolean expression as an argument. If the
      expression evaluates to true, the assert statement does nothing, and program execution
      continues normally.
    - However, if the expression evaluates to false, an AssertionError exception is thrown, halting
      program execution and providing an error message (optional) to help you identify the source of
      the issue.

    - here's an example:
    - Imagine you're building a program and making guesses about how things should be (like a name
      not being blank). The assert statement in Dart is your double-checker during development.
        ```dart
      void greet(String name) {
         assert(name != null, "Name cannot be null"); // Check for null name
         print("Hello, $name!");
      }

      void main() {
         greet("Alice");  // Assertion passes, "Hello, Alice!" is printed
         greet(null);     // Assertion fails, throws AssertionError with message
      }
    ```

17. Final vs const.
    - Final: A final variable can only be set once and it is initialized when accessed.
    - Const: A constant variable is a compile-time constant and its value must be known before the
      program runs.


12. What is Mixin and how to use?.
    - Mixins are a way of reusing the code in multiple classes. Mixins are declared using the
      keyword `mixin`.
    - Mixins are a way to reuse code in multiple classes.
        - Usage:
            - Using `on` keyword:
                - Use the `on` clause to declare a superclass.
                - The `on` clause exists to define the type that super calls are resolved against.
                  So, you should only use it if you need to have a super call inside a mixin.
              > The `on` clause forces any class that uses a mixin to also be a subclass of the type in the on clause. If the mixin depends on members in the superclass, this ensures those members are available where the mixin is used:

            ```dart

             class Musician {
                musicianMethod() {
                print('Playing music!');
                }
             }
             
             mixin MusicalPerformer on Musician {
                perfomerMethod() {
                print('Performing music!');
                super.musicianMethod();
                }
             }
             
             class SingerDancer extends Musician with MusicalPerformer { }
             
             main() {
                SingerDance().performerMethod();
             }
             
           ```             

            - Using `with` keyword:
                - The with keyword is used to specify one or more mixins that a class will use. A
                  mixin is a way of defining code that can be reused in multiple class hierarchies.
                  When a class uses a mixin, it inherits all the members of the mixin.
                - Code example:
              ```dart
                 mixin Musician {
                   void playInstrument(String instrumentName);
                         
                   void playPiano() {
                   playInstrument('Piano');
                   }
                         
                   void playFlute() {
                   playInstrument('Flute');
                   }
                 }
                         
                 class Virtuoso with Musician {
                   void playInstrument(String instrumentName) {
                   print('Plays the $instrumentName beautifully');
                   }
                 }
            ```


13. spacer in dart.
    - Spacer is a widget in Flutter that takes up available space in a `Row`, `Column` or `flex`
      layout.

14. What is the difference between `Stateful` widget and `Stateless` widget and it's lifeCycle
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

15. What is `setState()` ?

    - In Dart, `setState` is a method used in Flutter to update the state of a widget. It is a part
      of the StatefulWidget class.
    - When you call `setState`, it triggers a rebuild of the widget tree, which means that the
      framework will re-run the `build` method of the widget and its children.

16. What is the use of `pubspec.yaml` and `pubspec.lock` file in Flutter?

    - The pubspec.yaml file, also known as 'pubspec', is a file that is included when you create a
      Flutter project and is located at the top of the project tree. This file contains information
      about the dependencies like packages and their versions, fonts, assets(Like: images, audio,
      etc.) etc., that a project requires. It makes sure that the next time you build the project,
      you will get the same package version. For **Android developers,** this is roughly similar to
      a **`build.gradle`** file.

    - The **`pubspec.lock`** file in Flutter contains specific versions of the packages included in
      a project. It's automatically generated when you build your project for the first time. The
      .lock file locks the specific versions of dependencies, ensuring that everyone working on the
      project uses the exact same versions.

17. What is the difference between `main()` and `runApp()` functions in Flutter?

    - the `main()` function is the entry point of a Dart program. It sets up the app and is
      responsible for starting the program.
    - The `runApp()` function is a Flutter-specific method that initializes the app and connects the
      widget tree to the screen. It is responsible for starting the app execution and displaying the
      root widget on the screen.
    - The `main()` function should call `runApp()` to start the Flutter application.

    Here are some more details about the main() and runApp() functions:

    - `main()`: This function came from Java-like languages. Without it, you can't write any
      programs on Flutter.
    - `runApp()`: This function returns the widgets that are attached to the screen as a root of the
      widget tree. It inflates the given widget and attaches it to the screen.

18. What's the difference between a method and a function?

    - A method is on an object or is static in class. It is associated with a class. Methods are
      called using the dot notation (e.g. object.method()). Methods can be used to modify the state
      of an object.
    - A function is independent of any object (and outside of any class). It is not associated with
      a class. Functions are called using their name (e.g. function()). Functions cannot modify the
      state of an object.

19. Types of Keys in Flutter.

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

20. What is future.wait?

    - the Future.wait() method allows you to wait for multiple Future objects to complete. It takes
      a list of Future objects as an argument and returns a new Future that completes when all the
      input Future objects complete

21. What is the Flutter Hot Reload feature, and how does it benefit developers during app
    development?

    - Flutter's hot reload feature enables developers to see the changes they make to the code
      almost instantly on the app screen.
    - fix bugs quickly and seeing instant results without restarting the whole app. resulting in
      faster development cycles.
    - Hot reload works by injecting updated source code files into the
      running `Dart Virtual Machine (VM)`. After the VM updates classes with the new versions of
      fields and functions, the Flutter framework automatically rebuilds the widget tree, allowing
      you to quickly view the effects of your changes.

22. Describe the structure of a Flutter app, including the main components like MaterialApp,
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

23. Difference between Set and List.

    `Set:`
    - Elements must be unique.
    - Elements are not ordered.

    `List:`
    - Elements can be duplicate.
    - Elements are ordered in the order they were added.

    // Set Set<int> mySet = {1, 2, 3, 4, 5, 5}; // The duplicate element 5 will be removed. // List
    List<int> myList = [1, 2, 3, 4, 5, 5]; // The duplicate element 5 will remain.

24. what is the stream in Dart? Types of streams and diff between types?

    - stream is a way to receive data over time. It can be used to implement a variety of features,
      such as real-time data updates, progress bars, and loading spinners.
    - A stream is a sequence of asynchronous data events.

    - `Single-subscription streams:` These streams can only be listened to by a single subscriber.
      Once a subscriber has listened to the stream, no other subscriber can listen to it.
    - `Broadcast streams:` These streams can be listened to by multiple subscribers. When a
      broadcast stream emits an event, all of its subscribers are notified.

25. what is the list?

    - List is used to representing a collection of objects.

26. what is hasMap?

    - A HashMap is an implementation of a map based on a hashtable. A map is a collection of
      key-value pairs. Each value is associated with a key. A HashMap is an unordered collection of
      key-value pairs. The keys of a HashMap must have Object.

27. what is set?

    - Sets in Dart is a special case in List where all the inputs are unique i.e it doesn't contain
      any repeated input.

28. what is iterable?

    - An Iterable is a collection of elements that can be accessed sequentially. In Dart, an
      Iterable is an abstract class, meaning that you can't instantiate it directly. However, you
      can create a new Iterable by creating a new List or Set .

29. what is instance?

    - Dart is an object-oriented language with classes and mixin-based inheritance. Every object is
      an instance of a class

30. what is internal?

    - The _`internal` construction is just a name often given to constructors that are private to
      the class (the name is not required to be ._internal you can create a private constructor
      using any Class._someName construction).

31. What is extend?

    - the `extends` keyword is used to change the behavior of a class using inheritance. Inheritance
      is the ability of a class to derive properties and characteristics from another class.
    - `Example:`
        - Car extending vehicle: The class car could extend the class vehicle.
        - Class B extending class A: Class B inherits all properties and methods from class A.

32. What is implement?

    - A class can use the `implements` keyword to implement an abstract class. An abstract class is
      a class that defines a set of methods that must be implemented by subclasses. For example, the
      Shape class is an abstract class, which means that any class that extends the Shape class must
      implement the draw() method.

33. `extends` versus `implements` versus `with`.

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
      inherits its properties and methods.

    - Use `implements` when a class needs to conform to the behavior defined by an interface,
      ensuring it adheres to a specific set of requirements.

    - Use `with` when you want to incorporate the functionality of multiple classes into a single
      class without establishing inheritance, promoting code reusability and flexibility.

34. main() is static or dynamic?

    - the `main()` function is static. It is the entry point of your application and is where the
      execution of your program begins.

35. What is a constructor? Name types of constructor in dart?
    - a constructor is a special method that is used to initialize objects when they are created.
    - It is called when an object is instantiated, and it sets the initial state of the object by
      assigning values to its properties.
    - https://dart.dev/language/constructors#generative-constructors
    - https://codingwithtashi.medium.com/dart-interview-questions-and-answers-866d5c6a5141
    - ///todo <- takes info from that and write here

36. what is fromJson and toJson?

    **`fromJson` in Dart:**
    - It's a method used to convert JSON (text) into Dart objects. It's like telling Dart how to
      create an object based on the data in a JSON string.

    **`toJson` in Dart:**
    - It's a method used to convert Dart objects into JSON (text). It's like saying, "Hey Dart, take
      this object and turn it into something we can send over the internet or save to a file."

37. what is a factory?

    - It's a constructor you use when creating a new object every time isn't necessary or is
      expensive. It's like a smart way to decide whether to make a new object or reuse an existing
      one.

38. what is override and overLoading in dart?

    **Override in Dart:**
    - It's when you use the same method name in a child class as in its parent class, but with a
      different implementation. It's like saying, "I want to provide my own version of this method."

    **Overloading in Dart:**
    - It's when you use the same method name but with different parameters in the same class. It's
      like having a method that can do slightly different things depending on what you give it.
    - Dart does not support function overloading.

39. what is super in dart?

    - It's like a shortcut to access the features or methods of the parent class from within the
      child class. It helps you refer to the superclass and use its functionalities.

40. what is typeDef in dart?

    - It's like giving a nickname to a function type, making it easier to reuse and understand. It's
      a way of defining custom types for functions.

41. what is Anonymous Functions?

    - An anonymous function in Dart is like a named function but they do not have names associated
      with it. An anonymous function can have zero or more parameters with optional type
      annotations. An anonymous function consists of self-contained blocks of code and that can be
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

    In this example, `addNumbers` is an anonymous function that adds two numbers. It's defined and
    used right where it's needed.

42. Can we send data from the get request to the server?

    - Generally, in a GET request, data is sent as part of the URL parameters.
    - send data through get request limit is 2048 characters.
    - Example:
      GET `/api/resource?param1=value1&param2=value2`

43. types of api methods

    - `GET` /api/users to retrieve data of all users.
    - `POST` /api/users to create a new user.
    - `PUT` /api/users/:id to update the user with the specified ID.
    - `PATCH` /api/users/:id to partially update the user with the specified ID.
    - `DELETE` /api/users/:id to delete the user with the specified ID.
    - OPTIONS /api/users to retrieve the supported HTTP methods for the /api/users endpoint.

44. Constant Constructor in Dart:

    - a constant constructor creates a constant object. A constant object is an object whose value
      cannot be changed.
    - To declare a constant constructor, use the keyword const. For
      example, `const BlueSquare(size: 50)`

45. what is sealed class?

    - Sealed classes are used to restrict the users from inheriting the class. A class can be sealed
      by using the sealed keyword. The keyword tells the compiler that the class is sealed, and
      therefore, cannot be extended. No class can be derived from a sealed class.

46. what is the immutable and mutable class?

    - An immutable object is an object whose state cannot be changed after it is created. A mutable
      object can be changed after it is created.

47. What’s the difference between `hot reload` and `hot restart`?

    Hot reload maintains the app state while updating the UI almost instantaneously whereas Hot
    restart resets the app state to its initial conditions before updating the UI.

    **Hot reload:**
    - Hot reload doesn’t rerun main() or initState(), it loads code changes into the virtual machine
      and rebuilds the widget tree, thus preserving the app state.

    **Hot restart:**
    - Hot restart doesn’t preserve the app state. It loads code changes into the VM and restarts the
      Flutter app.

48. Which widget allows us to refresh the screen?

    - RefreshIndicator Widget enables us to refresh the screen. When the user pulls down on the
      widget, the onRefresh callback is triggered, which typically involves fetching new data from a
      server or updating the UI in some way.

49. What are the different build modes in Flutter?

    The Flutter tooling supports three modes when compiling your app, and a headless mode for
    testing. You choose a compilation mode depending on where you are in the development cycle. The
    modes are:

    **`Debug:`** Enables hot reload, asserts, and other debugging features to aid in development.
    “Flutter run”

    **`Profile:`** Similar to release mode but enables profiling tools to analyze app performance.
    “Flutter run -- profile”

    **`Release:`** Produces an optimized app with improved performance and reduced size for
    production deployment.It is used for deploying the app on marketplaces. “Flutter run - -
    release”

50. What is the difference between `NetworkImage` and `Image.network` in flutter?

    - `NetworkImage` class creates an object the provides an image from the src URL passed to it. It
      is not a widget and does not output an image to the screen.

    - `Image.network` creates a widget that displays an image on the screen. It is just a named
      constructor on the Image class (a stateful widget). It sets the image property using the
      NetworkImage . This image property is used finally to display the image.

51. What is use of `Navigation.push` and `Navigation.pop` function?

    The `push` method is used to add a route to the stack of routes managed by the navigator.
    The `pop` method is used to remove the current route from the stack of routes managed by the
    navigator.

52. When do you use double.INFINITY?

    `double.INFINITY` is used to by the child widget to occupy the remaining height of the parent
    widget.

53. What is Fat Arrow Notation in Dart and when do you use it?

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

54. What is ***ScopedModel/BLoC Pattern?***

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

55. What is `BuildContext` and how is it useful?

    - BuildContexts are used to identify or locate widgets in widget trees. Each widget has its own
      BuildContext, i.e., one BuildContext per widget. Basically, we're using it to find references
      to other widgets and themes. In addition, you can utilize it to interact with widget parents
      and access widget data.
    - You usually use BuildContext to get a reference to the theme or to another widget. For
      example, if
    - you want to show a material dialog, you need a reference to the scaffold. You can get it with
    - Scaffold.of(context), where context is the build context. of() searches up the tree until it
      finds the nearest scaffold.

56. What is the difference between `WidgetsApp` and `MaterialApp`?

    - `WidgetsApp` provides basic navigation. Together with the `widgets` library, it includes many
      of the foundational widgets that Flutter uses.
    - `MaterialApp` and the corresponding `material` library is a layer built on top of `WidgetsApp`
      and the widgets library. It implements Material Design, which gives the app a unified look and
      feel on any platform or device. The `material` library has many additional widgets that come
      with it.
    - You certainly aren’t required to use `MaterialApp` in your project. You can use `CupertinoApp`
      to make iOS users feel at home, or you can even build your own set of custom widgets to fit
      your brand.

57. Can you nest a `Scaffold`? Why or why not?

    - Yes, you can absolutely nest a `Scaffold`. That’s the beauty of Flutter. You control the
      entire UI.
        - `Scaffold` is just a widget, so you can put it anywhere a widget might go. By nesting
          a `Scaffold`,
        - you can layer drawers, snack bars and bottom sheets.

58. What is the purpose of `SafeArea` in Flutter?

    `SafeArea` is an important and useful widget in Flutter which makes UI dynamic and adaptive to a
    wide variety of devices. While designing the layout of widgets, we consider different types of
    devices and their pre-occupied constraints of screen like status bar, notches, navigation bar,
    etc.

59. Method channel vs Event Channel. These channels are used to communicate between native code (
    plugins or native code inside of your project) and the Flutter framework.

    ### MethodChannel

    A **`MethodChannel`** is used for "[communicating with platform plugins using *asynchronous
    method calls*](https://docs.flutter.io/flutter/services/MethodChannel-class.html)". This means
    that you use this channel
    to [invoke methods](https://docs.flutter.io/flutter/services/MethodChannel/invokeMethod.html) on
    the native side and can return back a value and vise versa.  
    You can e.g. call a method that retrieves the device name this way.

    ### EventChannel

    An [**`EventChannel`**](https://docs.flutter.io/flutter/services/EventChannel-class.html) is
    used to *stream* data. This results
    in [having a `Stream`](https://docs.flutter.io/flutter/services/EventChannel/receiveBroadcastStream.html)
    on the *Dart* side of things and being able to feed that stream from the native side.  
    This is useful if you want to send data every time a particular *event* occurs, e.g. when the
    wifi connection of a device changes.


60. How does Flutter handle platform-specific code and integrate with native features in iOS and
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
      method channels. It allows seamless integration with native features on iOS and Android,
      enabling developers to build cross-platform apps with a native look and feel.

61. How to call native methods in flutter web?

    - Native methods cannot be called directly in Flutter web
    - Flutter web does not support platform channels
    - Use JavaScript interop to communicate with web APIs
    - Consider using conditional imports to switch between web and native implementations

62. How do you `talk to native code` from within a Flutter app?

    - One type of platform channel is a method channel. Data is serialized on the Dart side and then
      sent to the native side. You can write native code to interact with the platform before
      sending a serialized message back. That message might be written in Java or Kotlin on Android
      or Objective-C or Swift on iOS.
    - The second type of platform channel is the event channel, which you use to send a stream of
      data from the native platform back to Flutter. This is useful for monitoring sensor data.

63. What is the use of having `Android and iOS folders` in the Flutter project?

    - `Android`:  This folder is meant for holding an entire Android project. This will come into
      usage when you want to build a Flutter application for the Android platform. When you compile
      a Flutter code into the native code, it will enter into the Android project and gives you a
      native Android application.

    - `iOS`: This folder is meant for holding an entire Mac project. This will come into usage when
      you want to build a Flutter application for the iOS platform. It works similarly to the
      Android folder. When you compile a Flutter code into the native code, it will enter into the
      Android iOS project and gives you a native Android application. Building a Flutter application
      will only be possible when you work on Xcode IDE and macOS.

64. Explain `async`, `await`, `then`, `whenComplete` and `Future` in Dart?

    - `Async` means that this function is asynchronous and you might need to wait a bit to get its
      result.
    - `Await` literally means - wait here until this function is finished and you will get its
      return value.
    - `.Then((value){…})` is a callback that’s called when future completes successfully(with a
      value)
    - `Future` is a type that ‘comes from the future’ and returns value from your asynchronous
      function. A Future completes successfully with a value or fails with an error.
    - `.whenComplete` will fire a function either when the Future completes with an error or not,
      instead.

65. What is future builder in flutter?

    - FutureBuilder in Flutter is a widget that helps you to display data from an asynchronous
      operation. It allows you to specify a widget to be displayed while the operation is in
      progress, and a widget to be displayed when the operation is complete.

    **The FutureBuilder widget has three states:**
    - `Waiting`: The Future is not yet complete.
    - `Done`: The Future has completed successfully and its value is available.
    - `Error`: The Future has completed with an error.

66. what is the stream builder flutter

    - StreamBuilder is a widget in Flutter that helps you build UIs that respond to asynchronous
      operations. It takes a Future or a Stream as an argument and builds a widget based on the
      state of the Future or Stream.

    - waiting , done or complete states.

    - To display real-time data from a sensor, such as the accelerometer or gyroscope.
    - To display the results of a search query as the user types.
    - To display a list of messages as they are received from a server.
    - To display the progress of a long-running operation, such as uploading a file.

67. difference between Futurebuilder and streambuilder.

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

68. What is chanel socket?

    - A channel socket in Flutter is a communication channel between two Flutter applications or
      between a Flutter application and a native platform. It can be used to send and receive data
      in real time. There are two main types of channel sockets in Flutter:
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

69. What is a method channel?

    - A method channel in Flutter is a way for Dart code to communicate with native code on Android
      and iOS. This allows Flutter developers to access platform-specific features, such as device
      sensors, GPS, and camera, without having to write native code.

70. How does MVVM structure work?

    MVVM, or Model-View-ViewModel, is a software design pattern that separates the application's
    business logic from its presentation layer. This makes the application easier to maintain and
    test, and also makes it more reusable.

    **Three component:**

    - Model: The model represents the application's data and business logic. It is responsible for
      storing and managing the data, and for performing any necessary calculations or
      transformations.
    - View: The view is the user interface of the application. It is responsible for displaying the
      data to the user and for collecting user input.
    - ViewModel: The view model is the intermediary between the model and the view. It is
      responsible for exposing the data from the model to the view in a way that is easy for the
      view to consume. It is also responsible for handling user input and updating the model
      accordingly.

    - The MVVM pattern works by having the view bind to the view model. This means that the view
      observes the view model for changes. When the view model changes, the view is automatically
      updated.

    - Diagram:
      `[View] <---> [ViewModel] <---> [Model]`

71. How does MVC structure work?

    MVC, or Model-View-Controller, is another software design pattern that separates the
    application's business logic from its presentation layer. It is similar to the MVVM pattern, but
    there are some key differences. In the MVC pattern, the controller is responsible for handling
    user input and updating the model accordingly. The view is then responsible for displaying the
    data from the model. The controller is typically implemented as a class that handles user input
    events. When the user interacts with the view, the view fires an event. The controller then
    listens for these events and takes appropriate action.

    - For example, if the user clicks on a button, the view might fire a buttonClicked() event. The
      controller would then listen for this event and update the model accordingly. For example, the
      controller might call a method on the model to create a new record.

    - Once the model has been updated, the controller would then notify the view that the data has
      changed. The view would then update its own display to reflect the new data.

    - Diagram:
      `[View] <---> [Controller] <---> [Model]`

72. What is the Bloc and why we should use it as state management tool

    - BLoC, or Business Logic Component, is a state management pattern for Flutter apps. It
      separates the app's business logic from its presentation layer, making it easier to test and
      maintain your code.
    - To use BLoC in your Flutter app, you will need to create a BLoC class for each part of your
      app that needs to manage state. The BLoC class will contain the app's business logic and will
      expose a stream of events that the UI can listen to.
    - The UI will listen to the stream of events from the BLoC and update itself accordingly. When
      the user interacts with the UI, it will dispatch events to the BLoC. The BLoC will then update
      its state and emit a new event.

73. How many threads are used by flutter

    - Flutter uses a single thread for the main UI and multiple threads for background tasks. The
      main UI thread is responsible for rendering the widget tree and handling user input. The
      background threads are used for tasks such as networking, file I/O, and image decoding.
    - The number of background threads used by Flutter depends on the platform and the specific
      tasks that are being performed. For example, on Android, Flutter uses a thread pool of four
      threads for background tasks.
    - Flutter also uses isolates to isolate background tasks from the main UI thread. This helps to
      improve performance and prevent the app from crashing if a background task fails.

74. What's the difference between async and async* in Dart?
    - async gives you a Future
    - async* gives you a Stream.

75. Yield and yield*
    - the `yield` keyword returns a single value from a generator function. It also pauses the
      function's execution until the next value is requested.

    - `yield*` provides multiple values from another Iterable or Stream.

76. Yield and return
    - the `yield` keyword is used to return a value from a generator function and pause the
      function's execution until the next value is requested.
        - Ex: It's akin to a storyteller concluding a tale, offering the resolution or final
          outcome.
    - `Return` a value from a function and terminates its execution.
        - Ex: Picture a teacher distributing one question at a time during an exam, allowing
          students to respond gradually. Each question "yields" an answer.

77. In Dart, what are the main differences between a var, final, and const variable declaration, and
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

78. What is a "callback function," and how does it relate to asynchronous programming in Dart?

    - It's like telling Dart, "When you're done with this task, here's a function to call." In
      asynchronous programming, it helps handle tasks that take time, like fetching data or reading
      files, without blocking the rest of your program.

    In other words, a callback function is a function passed as an argument to another function, and
    it's called back when a specific task is complete, making it crucial in asynchronous operations
    in Dart.

79. Explain the concept of "dependency injection" and how it can be implemented in Dart
    applications.

    **Dependency Injection in Dart:**
    - It's like giving your app a shopping list. Instead of creating objects directly, you provide a
      list of things your objects need. Dart then hands you the ready-made objects, making your app
      more organized and modular.

    In Dart, you can implement dependency injection by either manually passing dependencies as
    parameters or using packages like `get_it` or built-in tools like `Provider` for Flutter.

80. Dart provides a rich standard library. Name and briefly explain the purpose of three built-in
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

81. How does Dart handle memory management and garbage collection? Is manual memory management
    required in Dart?

    - Dart uses automatic memory management and has a garbage collector. You don't need to manually
      allocate or deallocate memory. The garbage collector automatically identifies and frees up
      memory that is no longer in use, making memory management more convenient and less
      error-prone.

82. what is firebase? And How You use it in your App?

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

83. What is `profile mode` and when do you use it?

    - In profile mode, some debugging ability is maintained—enough to profile your app’s
      performance. Profile mode is disabled on the emulator and simulator, because their behavior is
      not representative of real performance.

84. What types of `tests` can you perform?

    There are three main kinds of tests:
    - unit tests, widget tests and integration tests.
    - **`Unit tests`** are all about checking the validity of your business logic.
    - **`Widget tests`** are for making sure UI widgets have the components that you expect them to.
    - **`Integration tests`** check that your app is working as a whole.

85. What is the difference between debug mode, profile mode and release mode?

    * Use debug mode during development, when you want to use hot reload. This mode is for debugging
      apps on a device or a simulator.
    * Use profile mode when you want to analyze performance.
    * Use release mode when you are ready to release your app.

86. Deploy Flutter app on playstore
    - [https://medium.com/@bernes.dev/deploying-flutter-apps-to-the-playstore-1bd0cce0d15c](https://medium.com/@bernes.dev/deploying-flutter-apps-to-the-playstore-1bd0cce0d15c)
87. Deploy Flutter app on Appstore
    - [https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android](https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android)
88. From your application to AWS how you can call the API securely?
    - Use AWS Signature Version 4 (SigV4): SigV4 is a signing algorithm that ensures that your API
      calls are authentic and authorized. When you make an API call, you must sign the request using
      your AWS access key ID and secret access key.

89. What is ipv4?
    - IPv4, or Internet Protocol version 4, is the fourth version of the Internet Protocol. It is
      the most widely used version of the protocol today.

    - IPv4 is a 32-bit protocol, which means that it uses 32 bits to represent an IP address. An
      IPv4 address is typically written in dotted decimal format, where each octet is represented by
      a number between 0 and 255. For example, 192.168.1.1 is a valid IPv4 address.

90. what is MQTT? How it works?

    - MQTT is a way for devices to talk to each other over low-bandwidth networks.

    Here is a simple example of how MQTT can be used:

    - A temperature sensor publishes its current reading to the topic temperature/sensor1.
    - A smartphone app subscribes to the topic temperature/sensor1.
    - When the temperature sensor publishes a new reading, the smartphone app will receive the
      message and update its display.
    - MQTT works on a publish/subscribe basis. Publishers send messages to topics, and subscribers
      subscribe to topics. When a publisher sends a message to a topic, all subscribers to that
      topic will receive the message.

91. What is Sqflite? pros and cons in comparison to another database like Hive.

    - Sqflite is a relational database management system (RDBMS) that is lightweight, easy to use,
      and supports a wide range of SQL features. Hive is a NoSQL database that is lightweight, fast,
      and easy to use.
    - Which database you choose will depend on your specific needs. If you need a database that
      supports a wide range of SQL features and is well-documented, then Sqflite is a good choice.
      If you need a database that is lightweight, fast, and easy to use, then Hive is a good choice.
    - `Sqflite` is a good choice for complex applications that require a wide range of SQL features.
    - `Hive` is a good choice for simple applications that need a lightweight and fast database.

92. Explain the role of state management in Flutter, and discuss some popular state management
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

93. How can you use Flutter to create responsive and adaptive user interfaces for different screen
    sizes and orientations?

    - Media Query. Media Query can be used to get the real-time size (width/height) and
      orientation (portrait/landscape) of the window screen.
    - Layout Builder
    - Orientation Builder
    - Expanded and Flexible Widgets
    - Aspect Ratio Widget
    - Fractionally Sized Box Widgets
    - Custom MutiChild Layout Class.

94. What do you understand about tween animation?

    - The shortened version of in-between animation is tween animation. The start and endpoints of
      an animation must be specified in tween animation. Using this method, the animation can begin
      at the beginning and can progress through a series of values until it reaches the endpoint.
      Transition speed and duration are also determined by using the tween animation. Calculating
      the transition from the beginning to the end will be easier with the widget framework.
    - Ex: The Tween class specifies a range of values for opacity, typically from 0.0 (completely
      transparent) to 1.0 (fully opaque).

95. Write the difference between SizedBox Vs Container.
    - **`Container`**: In this parent widget, multiple child widgets can be easily controlled and
      handled by adjusting their size, padding, and color efficiently. We can wrap a widget in a
      container widget if it needs any styling, like a color, a shape, or a size constraint, etc.
    - **`SizedBox`**: This is a specific size box. It does not allow us to set the widget's color or
      decoration, unlike Container. In this case, we only need to resize the widget that is passed
      as a child. In other words, it forces its child widget to have a specific size.

96. Can you tell us what you know about Rune In Dart?

    - A rune can be defined as an integer used to represent any Unicode code point. As a Dart string
      is a simple sequence of UTF-16 code units, 32-bit Unicode values in a string are represented
      using a special syntax. The String class in the dart:core library gives ways to access runes.

97. Why do we use a ticker in Flutter?

    - a ticker is a class that updates the user interface (UI) at a fixed interval. Tickers are used
      to create smooth animations and transitions, and to ensure that the UI has a "fluid motion".

98. Explain how you will deploy a Flutter app to the Google Play/App Store?

    **Deploying to Google Play Store:**

    - Create a Google Play Developer account
    - Create a signing key
    - Configure your app
    - Submit your app for review
    - Publish your app

    **Deploying to App Store:**

    - Create an Apple Developer account
    - Create a signing certificate and provisioning profile
    - Configure your app
    - Submit your app for review
    - Publish your app

99. What's new in flutter 3.16?

    **Performance Enhancements**

    * **Impeller Preview:** Impeller, a new rendering engine for Flutter, is now available in
      preview mode for Android. Impeller promises significant performance improvements, particularly
      on Vulkan-capable devices.

    * **Reduced App Startup Times:** Flutter 3.16 introduces optimizations that reduce app startup
      times.

    * **Improved Scrolling and Gesture Performance:** Scrolling and gesture performance have been
      improved in Flutter 3.16.

    **Accessibility Enhancements**

    * **Predictive Back Navigation:** Flutter 3.16 adds predictive back navigation support for
      Android 14. This feature improves accessibility for users with physical disabilities.

    * **Flutter for iOS Extensions:** Flutter widgets can now be used in some iOS extensions, such
      as Today widgets and Action extensions.

    **Material 3 by Default**

    Material 3 is now the default design language for Flutter apps. Material 3 offers a fresh and
    modern look, with improved accessibility and customization options.

    **Casual Games Toolkit Updates**

    The Flutter Casual Games Toolkit has received several updates, including:

    * **Improved performance for 2D games**
    * **New visual effects and animations**
    * **Support for new game genres**

    **Other Notable Features**

    * **Precompiled Fonts:** Precompiled fonts reduce app size and improve startup time.

    * **Optimized Image Loading:** Image loading has been optimized for faster loading times.

    * **Improved Text Rendering:** Text rendering has been improved for sharper and more legible
      text.

    **Overall, Flutter 3.16 is a significant release that brings performance improvements,
    accessibility enhancements, and new features to the Flutter framework. Developers should
    consider upgrading their apps to Flutter 3.16 to take advantage of these new features.**