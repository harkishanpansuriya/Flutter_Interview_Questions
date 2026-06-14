## Ever had a widget rebuild too often? How did you catch that?

- Yes, I have faced this issue in large screens where unnecessary rebuilds were affecting performance.

I caught it using Flutter DevTools (Rebuild Stats + Performance Overlay) and by adding debug logs inside build methods.

To fix it, I used techniques like:

- Splitting widgets into smaller widgets
- Using const constructors
- Avoiding unnecessary setState()
- Using ValueNotifier, Bloc, or Consumer selectively

## How do you debug janky animations or dropped frames in Flutter?

- I use Flutter DevTools Performance tab to check frame rendering time and identify skipped frames.

Then I analyze:

- Heavy build methods
- Excessive widget rebuilds
- Expensive operations in UI thread

To fix it, I optimize:

- Move heavy work to isolates
- Reduce widget rebuilds
- Use RepaintBoundary
- Optimize animations and images

## What do you do when your app size exceeds 100MB?

- I analyze the APK/AAB using tools like Flutter build report and Android Studio APK Analyzer.

Then I reduce size by:

- Removing unused assets and dependencies
- Using ProGuard/R8 for code shrinking
- Compressing images and using WebP
- Splitting APK using App Bundles
- Avoiding heavy native libraries

## Dart DevTools

- Dart DevTools is a suite of tools for debugging and profiling Flutter apps, offering
  insights into your app's performance, memory usage, and state management. It helps you visualize
  what's happening inside your app, making it easier to identify issues and optimize performance.
  ![img_3.png](img_3.png)

- **Debugger:** Allows you to pause the app, inspect variables, step through the code, and find bugs
  more easily.
- **Logging View:** Displays logs and error messages from your app to help track down issues and
  understand app behavior.
- **App Size Tool:** Helps you analyze the size of your app, identifying large assets or
  dependencies that may increase the app size.
- **CPU Profiler:** Visualizes CPU usage and performance, helping you identify parts of your code
  that are using excessive CPU time.
- **Memory View:** Monitors memory usage to detect memory leaks and optimize memory management in
  your app.
- **Network View:** Tracks network requests and responses, allowing you to monitor API calls and
  data flow in your app.
- **Performance View:** Shows real-time frame rendering performance, helping you detect rendering
  issues or performance bottlenecks.
- **Flutter Inspector:** Displays the widget tree and allows you to inspect widget properties and
  layout issues directly within the app.

## How would you optimise a list of 10,000+ items in a Flutter app?

- Use `ListView.builder` with `itemCount` for lazy loading.
- Use `const` widgets to avoid unnecessary rebuilds.
- Implement `AutomaticKeepAliveClientMixin` if list items maintain state.
- Consider pagination: Do not fetch all 10,000 items from your backend at once. Use a package like
  infinite_scroll_pagination to load data in smaller chunks (e.g., 20–50 items) as the user reaches
  the bottom of the list. to reduce memory usage.

## Explain how isolate works in Flutter and when you would use it.

- **Isolates** provide multithreading in Flutter; they do not share memory.
- **Use cases:** Heavy computations like parsing large files, encryption, or image processing.
- Use `compute()` for simple one-off tasks and `Isolate.spawn` for complex or long-lived tasks.

## What are some performance optimization techniques you've applied in production apps?

- Use `const` widgets to reduce rebuilds.
- Avoid rebuilding large widget trees (use `shouldRebuild`, `Selector`, etc.).
- Lazy Loading Lists: For large datasets, use ListView.builder or GridView.builder to ensure only
  visible items are built. or use pagination
- Cache images using `cached_network_image`.
- Compress images and limit FPS in animations.
- Use `RepaintBoundary` to isolate heavy rendering areas.

## Memory leaks in Flutter.

- Memory leak in Flutter means some objects stay in memory even when they are no longer needed.
- In simple terms, the app keeps holding resources like controllers, streams, or listeners, so
  memory keeps increasing and performance becomes slow.

In Flutter, memory is managed automatically (garbage collection), but if we don’t clean up things
like controllers or streams, they won’t be removed. So we must manually dispose them when the widget
is removed.

## What is tree shaking in Flutter?

Tree shaking in Flutter is the process of removing unused code during build time to reduce app size
and improve performance.

- A process of removing unused code during build time.
- Reduces APK/IPA size by keeping only required code.
- Happens mainly in release builds (AOT compilation).


- Tree Shaking is the optimization technique for removing the unutilized module in the bundle in the
  build process. It is also the code elimination technique used for optimizing our application.
- Command to run the tree shaking in Flutter:
  `flutter build apk --split-debug-info=app --tree-shake-icons`

## Time Complexity vs Space Complexity in Flutter

* **Time Complexity**:

    * Measures how much **time an algorithm takes** to execute.
    * Depends on the number of operations (e.g., O(1), O(n), O(n²)).
    * Important for **performance optimization**.

* **Space Complexity**:

    * Measures how much **memory an algorithm uses**.
    * Includes variables, data structures, and memory allocation.
    * Important for **memory efficiency**.

in short, “Time complexity measures execution time, while space complexity measures memory usage.”

“Time = speed, Space = memory”

## What happens if you call setState() inside build()?

- Causes an **infinite loop** (build → setState → build...)
- Avoid it by updating state in:
    - Callbacks (e.g., button click)
    - Async widgets like **FutureBuilder**

## What is the difference between **obfuscation and encryption** in Flutter?

- **Obfuscation** scrambles method/class names to prevent reverse engineering.
- **Encryption** protects data at runtime using AES/RSA algorithms

## how to improve app perfomance to make it fast

- To make a Flutter app fast, use const widgets, efficient state management to rebuild only
  necessary widgets, lazy-load lists, cache images and data, and offload heavy computations to
  isolates. Profiling with DevTools helps find and fix performance bottlenecks.

## How do you optimize list rendering in Flutter?

- Using ListView.builder, const widgets, and AutomaticKeepAliveClientMixin

## How does Flutter handle memory management?

- Using Dart's garbage collector and efficient widget rebuilding.

## How to prevent widget rebuilding in Flutter?

- Use const widgets, ValueKey, AutomaticKeepAliveClientMixin, and select() in state management.

