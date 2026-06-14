## When was Flutter first announced and by whom?​

- ​Flutter was first announced by ​​Google​​at the ​​Google ​​I/O conference in May 2017​​.​
- The first​ ​stable release (Flutter 1.0) ​​came in​​ December​ ​2018​​.​
- Google created Flutter to solve the problem of writing separate apps for Android and​
  ​iOS.​

## What is Flutter and why is it popular?

- ​Flutter​​ is an​ ​open-source UI toolkit ​​from Google.​ I​t allows developers to create
  ​​cross-platform apps​​(Android, iOS, Web, Desktop) with a​
  ​single codebase​​.​

**​Why is it popular?​**

-
    1. ​Fast development ​​with hot reload.​
- ​2.​ ​Beautiful UI​​– built-in Material & Cupertino widgets.​
- ​3.​ ​Single codebase ​​saves time & cost.​
- ​4.​ ​High performance​​– runs using its own rendering engine.​

#### Advantages of Flutter 🚀

✅ **Beautiful UI** – Customizable widgets with smooth animations.  
✅ **Fast Development** – *Hot reload* lets you see changes instantly.  
✅ **Single Codebase** – Write once, run on Android & iOS.  
✅ **High Performance** – Compiles to native ARM code for fast execution.  
✅ **Rich Widget Library** – Pre-built widgets for quick UI building.  
✅ **Strong Community** – Plenty of plugins, support, and resources.

---

#### Features of Flutter ✨

🔹 **Hot Reload** – See updates instantly without restarting the app.  
🔹 **Flexible & Scalable** – Works for mobile, web, and desktop.  
🔹 **Native Performance** – Optimized for smooth experiences.  
🔹 **Rich Widget Library** – Pre-built and customizable widgets.  
🔹 **Easy Integration** – Works with Firebase, APIs, and native code.

---

#### Limitations of Flutter ⚠️

❌ **Large App Size** – Includes its own engine, making apps bigger.  
❌ **Limited Native API Access** – Custom platform code may be needed.  
❌ **Performance for Heavy Graphics** – Not ideal for advanced 3D/AR apps.  
❌ **Library Gaps** – Some native features require custom plugins.

## Which are the most popular apps that use Flutter?

* NotebookLM · Google Pay · Google Earth · Google Ads · Google Classroom · YouTube Create · Google Cloud · Google One · Alibaba · BMW · Toyota · eBay Motors · Dream11 · Hamilton · Philips Hue · Reflectly

## What is Dart?

Dart is a **general-purpose, object-oriented** programming language developed by **Google** in 2011.
It’s designed for building web and mobile apps and is the **core language** of Flutter.

🔹 **C-style syntax** – Easy for JavaScript & Java developers.  
🔹 **Fast execution** – Uses **JIT (Just-in-Time)** for development and **AOT (Ahead-of-Time)** for
production.  
🔹 **Strong typing** – Helps catch errors early.

## What is Flutter SDK?

- The Flutter SDK is the complete toolkit for building Flutter apps. It includes the Dart SDK, rendering engine, widget libraries, and tools like DevTools and the CLI. For example, when I run flutter create, the SDK sets up everything I need to build and test an app. It matters because it simplifies cross-platform development by providing all tools in one package.

## “Why is Flutter fast?”

“Because Flutter renders UI directly using the Skia engine instead of relying on native OEM widgets,
which reduces bridge communication overhead.”

## What are Widgets in Flutter?

In Flutter, everything you see on the screen is a Widget. Widgets are the basic building blocks of the user interface — they describe what the UI should look like and how it should behave. 

## What is Flutter Inspector?

Flutter Inspector is a tool that helps developers visualize and debug the widget tree. It’s useful for fixing layout issues, checking widget properties, and improving performance.


#### Features of Flutter Inspector:

- Select widget mode
- Toggle platform
- Show paint baselines
- Show debug paint
- Refresh widget
- Enable slow animations
- Show/hide performance overlay

Flutter Inspector is a debugging tool that lets you explore the widget tree visually. You can click on any widget in your app to see its properties, constraints, and layout. For example, if a button looks misaligned, the inspector shows which parent widget is causing the issue. It’s important because it makes debugging UI faster and more accurate.

## Stateful vs Stateless Widget in Flutter & Lifecycle

#### Stateless Widget:

- A StatelessWidget is immutable and cannot change once created.
- Rebuild: Only rebuilt when parent widget updates.
- Use Cases: Static UI elements like Text, Icon, ElevatedButton

in short, “A Stateless Widget is a widget whose UI depends only on the input data and does not
change during its lifecycle.”

#### Stateful Widget:

- A widget that can change its UI during runtime using setState.
- A Stateful widget has two classes: the widget class and the State class.
- State: Mutable (changes when `setState()` is called).
- Use Cases: Dynamic UI like counters, forms, API data, animations.

in short, A StatefulWidget is a widget that can change over time. It has a mutable state, so when something changes (like user input), the widget rebuilds to reflect that change.

### Stateless Widget Lifecycle in Flutter
- build() → Called once when the widget is created.

### Stateful Widget Lifecycle in Flutter

- **Definition:** The lifecycle defines the **sequence of methods** called when a StatefulWidget is
  created, updated, and removed.

#### Lifecycle Methods

1. **createState()**
    - Creates the State object
    - Called once when widget is inserted

2. **initState()**
    - Called once when the State is created
    - Used for initialization (API calls, controllers)

3. **didChangeDependencies()**
    - Called after `initState()`
    - Called again when dependencies (like InheritedWidget) change

4. **build()**
    - Builds the UI
    - Called multiple times (whenever state changes)

5. **didUpdateWidget()**
    - Called when parent widget updates this widget
    - Used to respond to new configuration

6. **setState()**
    - Updates state and triggers `build()`
    - Used for UI updates

7. **deactivate()**
    - Called when widget is removed from tree temporarily
    - Can be reinserted later

8. **dispose()**
    - Called when widget is removed from tree
    - Used to clean up resources (controllers, streams)

---

#### In short

Stateful widget lifecycle starts with creation, initializes data, builds UI, updates on changes, and
finally cleans up resources when removed.

## `pubspec.yaml` vs `pubspec.lock` in Flutter.

- `pubspec.yaml`
    - This is the project configuration file where you declare:
        - Project metadata (name, description, version).
        - Dependencies (packages your app needs).
        - Dev dependencies (tools for testing, linting, etc.).
        - Assets (images, fonts, etc.).

- `pubspec.lock` (auto-generated)
    - This is the lock file generated automatically when you run `flutter pub get`.
    - Not manually edited: It records the exact versions of all dependencies (including transitive
      ones).
    - Ensures consistency: Guarantees that everyone working on the project uses the same versions,
      avoiding “works on my machine” issues.

## What is `setState()` in Flutter?

- `setState()` is used to update the state of a StatefulWidget and trigger a UI rebuild.
- Why use: To notify Flutter that the UI needs to be rebuilt after state changes.
- Without setState?: UI won’t update even if the state changes.

## Difference Between Hot Reload, Hot Restart, and Full Restart in Flutter

### Hot Reload

- **What it does**: Injects updated source code into the Dart VM and rebuilds the widget tree.
- **State**: Preserves current app state (variables, navigation, scroll position).
- **Does not rerun**: `main()` or `initState()`.
- **Use case**: Quick UI changes, small logic tweaks.
- **Example**: Changing a `Text` widget’s content updates instantly without resetting the app.

---

### Hot Restart

- **What it does**: Loads code changes into the VM and restarts the Flutter app.
- **State**: Loses app state (everything resets), but **keeps the same Dart VM instance**.
- **Does rerun**: `main()` and all initializers.
- **Use case**: When you change global variables, initialization logic, or need a clean slate.
- **Example**: Modifying `main()` or app‑level configuration requires hot restart.

---

### Full Restart

- **What it does**: Completely recompiles and restarts the app, including native code.
- **State**: Entire app and VM are reset.
- **How**: You stop and start the run configuration (like pressing the stop ▶️ run button).
- **Use case**: Needed when changes affect platform channels, native code, or dependencies.

## What makes Flutter unique?

- **Single Codebase:** Write once, run anywhere. Flutter allows you to write a single codebase that
  works for Android, iOS, web, and desktop apps, saving time and effort in development.
- **Fast Development with Hot Reload:** Flutter's hot reload feature allows developers to instantly
  see the changes made to the code reflected in the app, speeding up the development process.
- **Expressive and Customizable UIs:** Flutter offers a rich set of customizable widgets and tools
  to create visually appealing and interactive user interfaces.
- **Close-to-Native Performance:** Flutter's architecture and rendering engine enable
  high-performance apps with smooth animations and transitions, providing a native-like experience
  across platforms.
- **No Dependency on Web Browsers:** Unlike some cross-platform frameworks, Flutter doesn't rely on
  web browser technology nor the set of widgets that ship with each device, ensuring consistent
  behavior and appearance across platforms.

## Explain reactive programming in Flutter

Answer: UI reacts to state changes automatically. Streams, ValueNotifier, or RxDart can notify
listeners when data changes, triggering UI rebuilds.

## `main()` vs `runApp()` in Flutter

- `main()`
    - the entry point of every dart program, including flutter apps.

- `runApp()`
    - The runApp() function takes the provided widget and makes it the root of the widget tree.


## What is deep linking?
- Deep linking means opening a **specific screen directly from URL**

## What is FFI (Foreign Function Interface)?
- FFI is a way for Dart (Flutter) to talk to native code like C / C++ / Rust.
- FFI allows Dart code to call functions written in other languages (mainly C/C++).