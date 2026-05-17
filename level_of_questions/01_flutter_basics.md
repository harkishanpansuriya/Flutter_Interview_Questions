## When was Flutter first announced and by whom?​
- ​Flutter was first announced by ​​Google​​at the ​​Google ​​I/O conference in May 2017​​.​
- The first​ ​stable release (Flutter 1.0) ​​came in​​ December​ ​2018​​.​
- Google created Flutter to solve the problem of writing separate apps for Android and​
​iOS.​

## What is Flutter and why is it popular?
- ​Flutter​​ is an​ ​open-source UI toolkit ​​from Google.​ I​t allows developers to create ​​cross-platform apps​​(Android, iOS, Web, Desktop) with a​
​single codebase​​.​

**​Why is it popular?​**
- 1. ​Fast development ​​with hot reload.​
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

## What is Dart?

Dart is a **general-purpose, object-oriented** programming language developed by **Google** in 2011.
It’s designed for building web and mobile apps and is the **core language** of Flutter.

🔹 **C-style syntax** – Easy for JavaScript & Java developers.  
🔹 **Fast execution** – Uses **JIT (Just-in-Time)** for development and **AOT (Ahead-of-Time)** for
production.  
🔹 **Strong typing** – Helps catch errors early.

## What is Flutter SDK?

- The Flutter SDK (Software Development Kit) is a framework developed by Google for building cross-platform mobile applications. It provides a complete set of tools, libraries, and resources to create native-like user interfaces (UI) for both Android and iOS platforms using a single codebase.

## Explain Flutter’s Architecture

Flutter architecture mainly consists of three layers:

### 1. Framework Layer (Dart)

- Written in Dart
- Used to build Flutter applications
- Contains Material widgets, Cupertino widgets, animation, rendering, and gesture libraries

👉 Handles UI and app logic.

### 2. Engine Layer (C++)

- Written in C++
- Uses Skia Graphics Engine for rendering
- Handles rendering, animations, text layout, accessibility, and file/network operations

👉 Flutter renders UI itself instead of using native UI components.

### 3. Embedder Layer

- Platform-specific layer for Android, iOS, Web, Windows, macOS, and Linux
- Connects Flutter engine with the operating system
- Handles app lifecycle, input events, plugins, and surface rendering

👉 Allows Flutter apps to run on multiple platforms.

### One-line Summary

Flutter uses a layered architecture where the Framework handles UI logic, the Engine renders graphics, and the Embedder connects Flutter to the native platform.


## “Why is Flutter fast?”

“Because Flutter renders UI directly using the Skia engine instead of relying on native OEM widgets, which reduces bridge communication overhead.”

## How does the Flutter app lifecycle work?

Flutter apps follow lifecycle states similar to Android and iOS. These states can be observed using `WidgetsBindingObserver`.

### resumed
- App is visible and user can interact with it
- Normal active app state
- Example: scrolling, typing, clicking buttons

### inactive
- App is visible but temporarily not receiving user input
- Example: incoming phone call, notification overlay, control center opened

### paused
- App goes into background and is no longer visible
- App is still kept in memory
- Example: user presses home button or switches to another app

### detached
- Flutter engine is running but not attached to any UI view
- Usually happens before app termination
- Example: system removes app to free resources

### Why it matters
- Save/restore data → Save form data when app goes background
- Pause heavy tasks → Stop video/audio when paused
- Manage resources → Release camera/microphone when inactive
- Analytics → Track app open/close events

### Flutter vs Native Lifecycle
- Android → Activity lifecycle (`onCreate`, `onPause`, `onResume`)
- iOS → UIApplication lifecycle (`applicationDidEnterBackground`)
- Flutter → Unified lifecycle states (`resumed`, `inactive`, `paused`, `detached`)

### One-line Summary
Flutter lifecycle manages app states like foreground, background, inactive, and termination states.

## What are Widgets in Flutter?
- In Flutter, everything is a widget – UI, layout, even app structure.
- A widget describes what the UI should look like.
- Flutter rebuilds widgets when state/data changes.

## What are the main layers in Flutter?

- Widget Layer – UI components.
- Rendering Layer – Handles layout, painting.
- Foundation Layer – Basic classes, async, collections, and services.
- Engine Layer – Skia rendering and platform interface.
- Embedder Layer – Runs the engine on different platforms.


## What is Flutter Inspector?

Flutter Inspector is a built-in tool that helps **debug and analyze** your app's UI. It shows the *
*widget tree**, layout details, and helps you fix design issues.

Think of it like a **magnifying glass** for your app's UI—helping you see how everything is structured and rendered.

#### Features of Flutter Inspector:

- Select widget mode
- Toggle platform
- Show paint baselines
- Show debug paint
- Refresh widget
- Enable slow animations
- Show/hide performance overlay

## Stateful vs Stateless Widget in Flutter & Lifecycle

#### Stateless Widget:
- A widget that does not change its UI once built.
- Rebuild: Only rebuilt when parent widget updates.
- State: Immutable (cannot change after creation)
- Use Cases: Static UI elements like Text, Icon, ElevatedButton

in short, “A Stateless Widget is a widget whose UI depends only on the input data and does not change during its lifecycle.”

#### Stateful Widget:
- A widget that can change its UI during runtime.
- Rebuild: Can rebuild itself using setState().
- State: Mutable (changes when `setState()` is called).  
- Use Cases: Dynamic UI like counters, forms, API data, animations.

### Stateful Widget Lifecycle in Flutter

- **Definition:** The lifecycle defines the **sequence of methods** called when a StatefulWidget is created, updated, and removed.

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
Stateful widget lifecycle starts with creation, initializes data, builds UI, updates on changes, and finally cleans up resources when removed.

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