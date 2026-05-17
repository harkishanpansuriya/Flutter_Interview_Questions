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
- In simple terms, the app keeps holding resources like controllers, streams, or listeners, so memory keeps increasing and performance becomes slow.

In Flutter, memory is managed automatically (garbage collection), but if we don’t clean up things like controllers or streams, they won’t be removed. So we must manually dispose them when the widget is removed.

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

