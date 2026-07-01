Checkout Flutter faq about perfomance:
https://docs.flutter.dev/perf/faq

## Ever had a widget rebuild too often? How did you catch that?

- Yes, I have faced this issue in large screens where unnecessary rebuilds were affecting
  performance.

I caught it using Flutter DevTools (Rebuild Stats + Performance Overlay) and by adding debug logs
inside build methods.

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

## What is the most common performance issue?

- Unnecessary rebuilds are one of the most common Flutter performance issues. I usually detect them
  using DevTools’ rebuild tracker, and fix them by splitting widgets, using const constructors, and
  applying proper state management so only the required part of the UI updates.

## What is jank?

- When frames take longer than 16ms to render, causing laggy UI.

## What is RepaintBoundary?

- RepaintBoundary is a Flutter widget that prevents unnecessary repaints by treating its child as a
  separate layer.
- Prevents unnecessary repainting of widgets
- Improves performance when only part of UI changes
- Example:
- Scrolling list with static header → wrap header in RepaintBoundary

## How exactly does const improve performance?

- const widgets are compiled at build time
- They are reused instead of rebuilt
- Reduces widget rebuild cost

## Top 10 Real Flutter Performance Problems & Fixes

### 1. Too Many Widget Rebuilds

- **Problem:** Entire UI rebuilds frequently → causes lag
- **Fix:** Use `const`, split widgets, use proper state management
- **Use DevTools:**
    - Enable **Rebuild Rainbow** to see frequent rebuilds
    - Use **Flutter Inspector → Track Widget Rebuilds**

---

### 2. Using `ListView` Instead of `ListView.builder`

- **Problem:** Loads all items at once → memory + slow scroll
- **Fix:** Use `ListView.builder` for lazy loading
- **Use DevTools:**
    - Check **Memory tab** for high usage
    - Monitor list rendering performance

---

### 3. Heavy Work on Main Thread

- **Problem:** UI freezes during heavy computation
- **Fix:** Use `compute()` or isolates
- **Use DevTools:**
    - Use **CPU Profiler** to find blocking operations

---

### 4. Large Images / No Caching

- **Problem:** Slow loading and high memory usage
- **Fix:** Compress images, use caching
- **Use DevTools:**
    - Check **Memory tab** for image spikes

---

### 5. Unnecessary `setState()`

- **Problem:** Rebuilds large widget subtree
- **Fix:** Update only required widgets
- **Use DevTools:**
    - Track rebuilds in **Flutter Inspector**

---

### 6. Not Using `const` Widgets

- **Problem:** Widgets rebuild unnecessarily
- **Fix:** Mark static widgets as `const`
- **Use DevTools:**
    - Identify rebuild-heavy widgets

---

### 7. Deep Widget Tree

- **Problem:** Complex UI slows rendering
- **Fix:** Break into smaller widgets
- **Use DevTools:**
    - Inspect widget tree using **Flutter Inspector**

---

### 8. Memory Leaks (Controllers Not Disposed)

- **Problem:** App slows over time
- **Fix:** Dispose controllers in `dispose()`
- **Use DevTools:**
    - Use **Memory tab → Allocation traces**

---

### 9. No Pagination in API Calls

- **Problem:** Loads huge data at once
- **Fix:** Use pagination / infinite scroll
- **Use DevTools:**
    - Monitor **Network & Memory usage**

---

### 10. Overuse of Animations

- **Problem:** Janky UI (frame drops)
- **Fix:** Use optimized animations
- **Use DevTools:**
    - Enable **Performance Overlay**
    - Check frame time (should be under 16ms)

---

### 🔧 Key DevTools Features

- **Flutter Inspector** → UI structure & rebuilds
- **Performance Tab** → Frame rendering (jank detection)
- **CPU Profiler** → Heavy computations
- **Memory Tab** → Memory leaks & usage
- **Rebuild Tracking** → Identify unnecessary rebuilds

---

In short, identify performance issues using Flutter DevTools (rebuilds, memory, CPU, frames) and fix
them by reducing unnecessary rebuilds, optimizing UI, and handling data efficiently.

## How to Improve App Performance in Flutter

- **Approach:**
    - Identify slow areas (UI, network, memory, CPU)
    - Optimize step by step using proper tools and techniques

---

### 📌 UI Optimization

- Use `const` widgets wherever possible
- Avoid unnecessary widget rebuilds
- Split large widgets into smaller ones
- Use `ListView.builder` for large lists

---

### 📌 State Management

- Avoid excessive `setState()`
- Use proper state management (Provider, Riverpod, Bloc)
- Update only required parts of UI

---

### 📌 Network Optimization

- Use pagination for large data
- Cache API responses
- Avoid repeated API calls
- Use debounce/throttle for user inputs

---

### 📌 Image Optimization

- Compress images
- Use proper formats (WebP)
- Use caching (e.g., cached images)

---

### 📌 Heavy Computation

- Avoid heavy work on main thread
- Use `compute()` or isolates

---

### 📌 Memory Management

- Dispose controllers (`TextEditingController`, `AnimationController`)
- Avoid memory leaks
- Use lightweight objects

---

### 📌 Animations

- Avoid heavy or unnecessary animations
- Use optimized widgets like `AnimatedContainer`

---

### 📌 Use Flutter DevTools

- **Flutter Inspector** → Check widget rebuilds
- **Performance Tab** → Detect frame drops (jank)
- **CPU Profiler** → Find heavy operations
- **Memory Tab** → Detect leaks and high usage

---

### 📌 Best Practices

- Keep widget tree simple
- Avoid deep nesting
- Use lazy loading
- Write clean and modular code

---

In short, improve app performance by reducing unnecessary rebuilds, optimizing UI and data handling,
managing memory properly, and using Flutter DevTools to identify and fix bottlenecks.

## App is Slow on One Screen – How Will You Debug?

- **Approach:**
    - First, I will **reproduce the issue** and identify exactly where the lag happens (scrolling,
      API load, animation, etc.)
    - Then I will analyze step by step using Flutter DevTools

---

### 📌 Step 1: Identify the Problem Area

- Check if the issue is:
    - UI rendering (jank, lag)
    - Network delay (API slow)
    - Heavy computation
    - Memory issue

---

### 📌 Step 2: Use Flutter DevTools

- **Performance Tab**
    - Check frame rendering time (should be < 16ms)
    - Identify jank (dropped frames)

- **Flutter Inspector**
    - Enable **Track Widget Rebuilds**
    - Find unnecessary rebuilds

- **CPU Profiler**
    - Detect heavy synchronous operations

- **Memory Tab**
    - Check memory usage and leaks

---

### 📌 Step 3: Common Fixes Based on Issue

- **Too many rebuilds**
    - Use `const` widgets
    - Split widgets
    - Use proper state management

- **Slow list rendering**
    - Use `ListView.builder`
    - Add pagination

- **Heavy computation**
    - Move to `compute()` or isolates

- **Slow API**
    - Add caching
    - Optimize network calls

- **Large images**
    - Compress and cache images

---

### 📌 Step 4: Verify Fix

- Re-run app with DevTools
- Confirm:
    - Smooth UI (no jank)
    - Stable memory usage
    - Faster response

---

### 📌 Bonus

- Enable **Performance Overlay**
- Check if UI and GPU graphs stay under limit

---

In short, I reproduce the issue, identify whether it is UI, network, or CPU related, use Flutter
DevTools to analyze it, and fix it by reducing rebuilds, optimizing data handling, and improving
resource usage.
