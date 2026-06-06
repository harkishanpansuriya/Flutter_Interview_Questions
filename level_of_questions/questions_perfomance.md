Checkout Flutter faq about perfomance:
https://docs.flutter.dev/perf/faq

## What is the most common performance issue?
- Unnecessary rebuilds are one of the most common Flutter performance issues. I usually detect them using DevTools’ rebuild tracker, and fix them by splitting widgets, using const constructors, and applying proper state management so only the required part of the UI updates.

## What is jank?
- When frames take longer than 16ms to render, causing laggy UI.

## What is RepaintBoundary?

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

In short, identify performance issues using Flutter DevTools (rebuilds, memory, CPU, frames) and fix them by reducing unnecessary rebuilds, optimizing UI, and handling data efficiently.

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

In short, improve app performance by reducing unnecessary rebuilds, optimizing UI and data handling, managing memory properly, and using Flutter DevTools to identify and fix bottlenecks.

## App is Slow on One Screen – How Will You Debug?

- **Approach:**
  - First, I will **reproduce the issue** and identify exactly where the lag happens (scrolling, API load, animation, etc.)
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

In short, I reproduce the issue, identify whether it is UI, network, or CPU related, use Flutter DevTools to analyze it, and fix it by reducing rebuilds, optimizing data handling, and improving resource usage.