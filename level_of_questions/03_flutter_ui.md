## Material vs Cupertino Widget

- **Material widgets:** Follow Android’s design guidelines.
- **Cupertino widgets:** Provide iOS-style UI components.
- Use **Material** for Android look and **Cupertino** for iOS look.

## What is the use of const in Flutter widgets?

Using `const` makes widgets **immutable**, reduces unnecessary rebuilds, and improves performance by
reusing the same widget instance.

## What is the purpose of mainAxisAlignment and crossAxisAlignment?

Used to **align children** inside `Row` and `Column` widgets along the main and cross axes.

## What is the `WillPopScope` widget used for?

- We use the `WillPopScope` widget to control what happens when the user presses the back button or
  uses the back gesture.
- We can decide whether the screen should close or stay open.
- It is commonly used to show an exit confirmation dialog or warn about unsaved changes.

## What are custom widgets in Flutter, and why are they important?

- Custom widgets are widgets that you create yourself by combining existing Flutter widgets.
- They help you reuse code, keep your app organized, and make it easier to maintain and update.

## What is a widget in Flutter?

- A widget is the basic building block of a Flutter app.
- Everything you see on the screen is a widget, such as text, buttons, images, and layouts.
- Widgets are used to create and design the user interface (UI) of an app.

## What are reusable widgets?

* Reusable widgets are widgets that you create once and use in multiple places in your app.
* They help you avoid writing the same code again and again.
* For example, if the same button is used on many screens, you can create one custom button widget
  and reuse it everywhere.
* Reusable widgets are usually created using `StatelessWidget` or `StatefulWidget`, depending on
  whether the widget needs to update its UI.
* They make your code cleaner, easier to maintain, and more consistent.

## What is the difference between `ListView.builder` and `SliverList.builder`?

* ListView.builder is used when your screen only needs a scrollable list.
* We use `SliverList.builder` inside a `CustomScrollView`, where it acts as piece of a scrollable
  area.
* With `SliverList.builder`, we can combine multiple scrollable widgets, such as a `SliverAppBar`,
  `SliverGrid`, and `SliverList`, into a single scrolling screen.
* `ListView.builder` is simpler and is the best choice for most lists.
* `SliverList.builder` is more flexible and is useful for building complex scrolling layouts.
* Both widgets build list items only when they are needed, making them efficient for large lists.

## Talk about listviews in flutter, what is the difference between widgets and slivers.

- ListViews in Flutter are used to display scrollable lists. Regular ListView widgets are
  high-level, standalone scrollable lists that handle their own scrolling. Slivers, like SliverList,
  are low-level building blocks that represent a piece of a scrollable area inside a
  CustomScrollView, allowing advanced scroll effects and combining multiple scrollable components.

## Which widget allows us to refresh the screen?

* We use the `RefreshIndicator` widget to add pull-to-refresh functionality to a screen.
* When the user pulls down on a scrollable widget, it triggers the `onRefresh` callback.
* We can use this callback to fetch new data and update the UI.

## What is an AspectRatio widget used for?

* The **AspectRatio widget** in Flutter is a powerful tool that allows us to control the **aspect
  ratio** of a child widget.
* It's particularly useful for maintaining a **width-to-height ratio**, ensuring consistent
  proportions across different screen sizes and orientations.
* Example: For a square widget:

```dart
AspectRatio
(
aspectRatio: 1.0,
child: Container(color: Colors.
blue
)
,
)
```

## difference between MediaQuery and LayoutBuilder

- `MediaQuery`:
    - MediaQuery is used to get information about the device screen, like size, orientation, and
      padding, to build responsive UI.
- `LayoutBuilder`:
    - LayoutBuilder provides the available width and height from the parent, allowing us to build
      responsive UI based on constraints instead of fixed sizes.

MediaQuery provides full screen size, while LayoutBuilder provides the available space from the
parent widget. MediaQuery is used for overall layout, and LayoutBuilder is used for local
widget-level layout.

## What is the difference between InkWell and GestureDetector ?

- **InkWell**: InkWell is used to detect gestures and provides a visual touch feedback (ripple
  effect).
    - Shows ripple (material) effect on tap.
    - Must be used inside a Material widget.
    - Commonly used for buttons, cards, list items
- **GestureDetector**: GestureDetector is used to detect gestures without any visual feedback
    - Detects various gestures (tap, swipe, drag, long press, etc.).
    - No ripple or animation
    - Best for custom gesture handling.

InkWell provides gesture detection with a ripple effect and is used for material UI interactions,
while GestureDetector detects gestures without any visual feedback and supports more complex
gestures.

## Tween Animation in Flutter

- **Tween Animation:**
    - Defines the start and end values of an animation.
    - Interpolates between these values over a specified duration.
    - Utilizes the `Tween` class to animate properties such as opacity, position, and size smoothly.

## SizedBox vs Container

- **SizedBox** is used for adding fixed space or giving a fixed size to a widget.
- **Container** is a more powerful widget used for layout, styling, padding, and decoration.

### Use Cases

- **SizedBox:**
    - When you need **fixed spacing** (e.g., 20px gap between widgets)
    - When you want to **set fixed width/height**
    - Lightweight and efficient

- **Container:**
    - When you need **styling** (color, border, decoration)
    - When you need **padding or margin**
    - When combining layout + styling in one widget

## Padding vs Margin in Flutter

- **Padding:**
    - **Definition:** Adds space **inside** the widget, between the widget’s content and its border.
    - Affects the **internal layout** of the widget.

- **Margin:**
    - **Definition:** Adds space **outside** the widget, creating distance from other widgets.
    - In Flutter, margin is applied using the **`Container` widget**.

## Creating Responsive UI in Flutter

To build responsive UI, I used LayoutBuilder and MediaQuery to adapt UI based on screen size. I
implemented breakpoints to switch layouts (single column for mobile, grid for tablet).

I avoid fixed sizes and use Expanded/Flexible for dynamic layouts, ensuring the UI scales well
across different devices.

- **Responsive UI Techniques:**
    - **MediaQuery:** Retrieve device size and orientation.
    - **LayoutBuilder:** Construct UI based on parent constraints.
    - **OrientationBuilder:** Adapt UI based on device orientation.
    - **Expanded/Flexible Widgets:** Manage widget sizes dynamically.
    - **Aspect Ratio Widget:** Maintain aspect ratio of child widgets.
    - **Fractionally Sized Box Widgets:** Size widgets as fractions of the available space.
    - **Custom MultiChild Layouts:** Create custom layouts for different screen sizes.

## `BuildContext` in Flutter

- BuildContext is a reference to the location of a widget in the widget tree and is used to access
  theme, navigation, and inherited widgets.

## `WidgetsApp` vs `MaterialApp` in Flutter

- **`WidgetsApp`:** Provides basic navigation and widget management capabilities without specific
  material design components.
- **`MaterialApp`:** Builds upon `WidgetsApp` by implementing Material Design, offering additional
  widgets and styling for consistent UI across platforms.

in short, WidgetsApp is a basic app configuration widget, while MaterialApp extends it by adding
Material Design UI and ready-to-use components.

## `SafeArea` Widget in Flutter

- SafeArea is a widget that keeps your UI inside the visible and safe part of the screen, avoiding
  areas like: Notch, status bar, Bottom navigation gestures (like iPhone swipe area).
- SafeArea automatically adds padding so your content is not hidden behind system UI.
- Without SafeArea Your UI can go under the notch or status bar

in short, SafeArea is a Flutter widget that prevents UI from overlapping with system areas like the
notch, status bar, and gesture areas by automatically adding padding.

## `NetworkImage` vs `Image.network` in Flutter

- Image.network:
    - It is a widget.
    - Used directly to display an image from the internet
    - Simple and quick to use: `Image.network("https://example.com/image.png");`

- NetworkImage:
    - It is an ImageProvider.
    - It only provides the image data, does NOT display it.
    - Used inside other widgets like:
        - Image
        - DecorationImage (for BoxDecoration)
        - CircleAvatar (backgroundImage)

Image.network is a widget used to display an image directly from a URL, while NetworkImage is an
ImageProvider used to supply image data to other widgets.

## `double.INFINITY`

- In Flutter, double.infinity represents an infinite value and is used to make a widget expand to
  the maximum size allowed by its parent constraints.

## RefreshIndicator Widget

- RefreshIndicator is a Flutter widget that provides pull-to-refresh functionality, allowing users
  to refresh content by swiping down on the screen.

## **📌 19. Types of Keys in Flutter**

### **📌 Why Use Keys?**

Keys **help Flutter identify and differentiate widgets** during tree rebuilds.  
They prevent **unnecessary rebuilds** and **maintain state correctly**.

---

### **📌 1️⃣ ValueKey**

✅ **Definition:** Uses a **specific value** (`String`, `int`, etc.) to identify a widget.  
✅ **Usage:** Helps when widgets **depend on dynamic values** (like list items).

#### **Example: ValueKey in a ListView**

```
ListView(
children: items.map((item) => Text(item, key: ValueKey(item))).toList(),
);
```

📌 **Best for:** Lists with unique values.

---

### **📌 2️⃣ ObjectKey**

✅ **Definition:** Uses an **object's memory location** to identify widgets.  
✅ **Usage:** Differentiates **different instances** of the same object type.

#### **Example: ObjectKey in a List**

```
ListView(
children: items.map((item) => Text(item.name, key: ObjectKey(item))).toList(),
);
```

📌 **Best for:** When **objects contain the same data** but are **different instances**.

---

### **📌 3️⃣ UniqueKey**

✅ **Definition:** Generates a **unique identifier** for each widget.  
✅ **Usage:** Used for **new dynamically created widgets** (prevents duplication).

#### **Example: UniqueKey in Dynamic Widgets**

```
ElevatedButton(
onPressed: () {
setState(() {
widgets.add(Container(key: UniqueKey(), color: Colors.blue));
});
},
child: Text('Add Widget'),
);
```

📌 **Best for:** When you want **each widget to be unique**, even with the same content.

---

### **📌 4️⃣ GlobalKey**

✅ **Definition:** A special key that allows **access to a widget's state globally**.  
✅ **Usage:** Used for **forms, scaffold drawers, and accessing StatefulWidget state**.

#### **Example: GlobalKey for a Form**

```
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Form(
key: _formKey,
child: TextFormField(
validator: (value) => value!.isEmpty ? 'Enter something' : null,
),
);

ElevatedButton(
onPressed: () {
if (_formKey.currentState!.validate()) {
print('Form is valid!');
}
},
child: Text('Submit'),
);
```

📌 **Best for:** **Forms, scaffold state, or accessing widget state from anywhere**.

---

### **📌 Key Usage Scenarios**

| **Scenario**            | **Best Key** |
|-------------------------|--------------|
| Unique list items       | `ValueKey`   |
| Object instances        | `ObjectKey`  |
| Dynamic widget creation | `UniqueKey`  |
| Accessing widget state  | `GlobalKey`  |

🚀 **Conclusion:**

- Use **`ValueKey` for list items**.
- Use **`ObjectKey` when instances contain similar data**.
- Use **`UniqueKey` for dynamic widgets**.
- Use **`GlobalKey` when you need widget state access**.

## Spacer in Flutter

- The Spacer widget is used to insert a flexible empty space between the children of the Column and
  Row widget.
- The Spacer widget takes up all available space in its parent widget.
- Use Cases: The Spacer widget is great for creating flexible and customizable layouts.

nd). It synchronizes UI updates with the device’s refresh rate to ensure smooth
animations.

## when should we use a resizeToAvoidBottomInset?

- resizeToAvoidBottomInset is used to control whether the Scaffold should resize its body when the
  keyboard appears. By default, it is true, which helps keep input fields visible. I usually use it
  for forms and login screens. If I have a custom layout or want to manage keyboard behavior
  manually, I set it to false.

## What is TextEditingController?

- TextEditingController is used to manage and control the text inside a TextField. It allows us to
  read, update, clear, and listen to text changes programmatically.

## What is the default axis for Column and Row widgets?

- Column: Vertical (MainAxisAlignment.vertical).
- Row: Horizontal (MainAxisAlignment.horizontal).

## What is `Expanded` and `Flexible` in Flutter?

🔹 **Expanded** → Forces the child to take **all available space** in a `Row`, `Column`, or `Flex`.  
🔹 **Flexible** → Allows the child to **take space if needed**, but doesn’t force it to fill
everything.

**Example:**

```
 Row(
      children: [
        Expanded(child: Container(color: Colors.red)), // Takes full space
        Flexible(child: Container(color: Colors.blue)), // Takes only needed space
      ],
    );
```

**Key Difference:** `Expanded` fills **all** space, while `Flexible` only takes **as much as needed
**.

## `Flex` Widget in Flutter

🔹 **Definition:** `Flex` arranges its children **horizontally** (`Axis.horizontal`) or **vertically
** (`Axis.vertical`), similar to `Row` and `Column`.

🔹 **Key Difference:** Unlike `Row` and `Column`, `Flex` **requires** an explicit `direction`.

**Example:**

```
Flex(
  direction: Axis.horizontal, // Change to Axis.vertical for vertical layout
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    Container(width: 200, height: 100, color: Colors.green),
    Container(width: 50, height: 100, color: Colors.blue),
  ],
)
```  

**When to Use?**  
✅ When dynamically deciding between **horizontal or vertical** layout.

## `didChangeDependencies()` vs `didUpdateWidget()`

- Both are lifecycle methods of a `StatefulWidget`.
- We use them for different purposes.

### `didChangeDependencies()`

- We use `didChangeDependencies()` when an inherited dependency changes.
- It is called after `initState()`.
- It is called again if an `InheritedWidget` (such as `Theme`, `MediaQuery`, or `Localizations`)
  changes.
- It is useful for updating data that depends on inherited widgets.

### `didUpdateWidget()`

- We use `didUpdateWidget()` when the parent rebuilds and passes new values to the widget.
- It is called when the widget configuration changes but the same `State` object is reused.
- It is useful for comparing old and new values and updating the state if needed.

## Difference between Rebuild and Repaint?

- **Rebuild** means Flutter calls the `build()` method again to create the widget tree.
- **Repaint** means Flutter redraws the UI on the screen without rebuilding the widget tree.

- We rebuild when the widget's data or state changes.
- We repaint when only the visual appearance changes, such as color, animation, or custom painting.

## What is CachedNetworkImage and why use it?

- `CachedNetworkImage` is a package used to load and cache images from the internet.
- It stores downloaded images in local storage.
- The next time the same image is needed, it loads the image from the cache instead of downloading
  it again.
- This improves app performance and reduces internet usage.
- It also provides placeholder and error widgets while loading images.

### Why do we use it?

- To improve image loading speed.
- To reduce network requests.
- To save internet data.
- To provide a better user experience with loading and error states.

## What is Scroll Physics in Flutter and its types?

- Scroll Physics controls how a scrollable widget behaves while scrolling.
- We use it to enable, disable, or customize scrolling behavior.

### Types of Scroll Physics

- `AlwaysScrollableScrollPhysics` – Allows scrolling even if the content does not fill the screen.
- `NeverScrollableScrollPhysics` – Disables scrolling completely.
- `BouncingScrollPhysics` – Adds a bounce effect at the edges (default on iOS).
- `ClampingScrollPhysics` – Stops scrolling at the edges without a bounce effect (default on
  Android).
