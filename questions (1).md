https://www.ambitionbox.com/profiles/flutter-developer/interview-questions

https://medium.com/@kalidoss.shanmugam/flutter-interview-questions-and-answers-for-experienced-developers-171a7cbbfef5

See some of questions and copy it: https://medium.com/@anandgaur2207/top-flutter-interview-questions-and-answers-e7fbe9db7390


flutter architecture interview questions

https://www.scribd.com/document/991599607/Flutter-Interview-Question-Bank - based on this we can seperate files

https://github.com/thisissandipp/flutter-interview-questions (Great questinons included).

https://www.interviewbit.com/flutter-interview-questions/

https://www.wecreateproblems.com/interview-questions/flutter-interview-questions#heading-2 (Great
questinons included).

https://www.turing.com/interview-questions/flutter

https://devharshmittal.medium.com/flutter-interview-questions-2025-from-zero-to-hero-part-1-the-foundations-c934a46785d0

https://devharshmittal.medium.com/flutter-interview-questions-2025-from-zero-to-hero-part-2-the-core-skills-8e8ee6d8787a

https://devharshmittal.medium.com/building-a-scalable-design-system-in-flutter-part-3-265d2f97909a

https://devharshmittal.medium.com/flutter-interview-questions-2025-part-3-the-pro-level-364f5fc54ee7

https://www.linkedin.com/posts/gauhun_flutter-interview-question-activity-7334813458800005120-JQOn

https://webandcrafts.com/interview-questions/flutter

https://github.com/justsandip/flutter-interview-questions

https://github.com/Devinterview-io/flutter-interview-questions

https://shirsh94.medium.com/top-100-flutter-interview-questions-and-answers-2026-775b5fb5e4dc

Flutter Interview Guide 2026
https://github.com/debasmitasarkar/flutter_interview_guide_2026

https://github.com/Nada-gaber/flutter_interview_questions

https://www.linkedin.com/pulse/top-flutter-interview-questions-andanswers-anand-gaur-air5c

# Flutter FAQ : https://docs.flutter.dev/resources/faq (check questions and answers)

Here is the list of questions from the document, formatted as requested.

## Please give a brief introduction about your technical experience & projects.

## What are the different launch modes in Android?

Android provides different launch modes to control how activities are created and managed in the
back stack:

- **standard** – Default mode. A new instance of the activity is created every time it is launched.
- **singleTop** – If an instance of the activity is already at the top of the stack, no new instance
  is created; otherwise, a new one is created.
- **singleTask** – Only one instance of the activity exists in the system. If it exists, it is
  brought to the front, and all activities above it are cleared.
- **singleInstance** – The activity is launched in its own separate task. No other activities can be
  part of this task.
- **singleInstancePerTask** – Similar to `singleInstance`, but allows multiple instances across
  different tasks while ensuring only one per task.

## What is ProGuard, and why is it used?

ProGuard is an Android tool that **shrinks, optimizes, and obfuscates code** to reduce APK size,
improve performance, and make reverse engineering harder.

## How would you design a booking service system and manage slot selection in Flutter?

I would design the booking system with a backend that manages slot availability and validates
bookings using transactions to prevent double-booking. In Flutter, I would:

- Fetch available slots from the backend.
- Display slots in a selectable UI (chips/grid).
- Manage selection using state management (Provider, Bloc, or Riverpod).
- Confirm booking by calling an API, letting the backend re-verify the slot to ensure accuracy and
  prevent conflicts.

## How do you securely store and retrieve a user's private key in a Flutter wallet app?

Store the private key using **platform-secure storage** (`flutter_secure_storage`), which relies on
Android Keystore and iOS Keychain. Encrypt the key at rest, decrypt it only in memory when needed,
protect access with biometrics, avoid logging, and clear it from memory immediately after use. *
*Never store private keys in SharedPreferences or local storage.**

## How to keep a wallet app secure against attacks?

To secure a wallet app:

- Store private keys in device secure hardware (Keystore/Keychain).
- Protect the app with PIN or biometrics.
- Encrypt all sensitive data and use HTTPS/TLS for network calls.
- Block rooted/jailbroken devices and prevent screenshots.
- Implement 2FA and rate limits, and monitor suspicious transactions.
- Never store private keys in SharedPreferences; use secure storage.

## What are the advantages of using Firebase Realtime Database?

- **Real-time sync:** Data updates are synchronized across all connected devices instantly.
- **Offline capabilities:** Data is cached locally for offline access.
- **Automatic scaling:** Handles large datasets without manual server management.
- **NoSQL database:** Uses JSON-based key-value storage for fast and flexible access.

## How do you handle real-time data updates in Flutter?

- **Streams & StreamBuilder:** Listen to real-time changes asynchronously.
- **WebSockets:** Establish persistent connections for real-time communication.
- **Firebase Firestore:** Provides real-time updates via snapshots.
- **State management (Provider, Riverpod, Bloc):** Efficiently manage and update UI with real-time
  data.

## What are the limitations of Firebase Realtime Database?

- **Limited queries:** Supports only simple key-value lookups.
- **Scalability issues:** Can become slow with a large number of concurrent users.
- **Data structure sensitivity:** Poor structuring can impact performance.
- **No built-in analytics:** Lacks detailed analytics tools compared to Firestore.

## What is the difference between Firebase Realtime Database and Firestore for real-time data in Flutter?

![alt text](<Screenshot From 2025-11-22 19-24-59.png>)

## If your Flutter app is crashing only in release mode, how do you debug it?

- Run `flutter run --release` and check device logs via `adb logcat`.
- Android: Use the Android Studio Logcat or the command line adb logcat to catch native-level
  crashes.
- iOS: Use the Xcode Device Console to view system logs for your connected iPhone.
- Ensure no `assert` statements or debug-only code is being used.
- Use crash reporting tools like **Sentry** or **Firebase Crashlytics** to capture release crashes.







## How would you architect a Flutter app with multiple modules or teams working on it?

- Use a **feature-based folder structure** (e.g., `features/user`, `features/dashboard`).
- Apply **clean architecture** with proper separation of data, domain, and presentation layers.
- Use **internal packages** or a **monorepo** (`packages/feature_x`) for modularization.
- Keep shared components in a **core module** or shared library.

## How do you handle background tasks and notifications on Android?

- Use **WorkManager**, **Foreground Services**, or **AlarmManager** for scheduled/background tasks.
- Example: Schedule recurring tasks like pill reminders with WorkManager, respecting exact time and
  battery optimization constraints.

## How do you reduce APK or IPA size?

- Remove unused assets and fonts.
- If you must distribute APKs directly, use the split flag to create separate files for each CPU
  architecture (e.g., ARM, ARM64). Use `flutter build apk --split-per-abi`.
- Enable ProGuard/R8: In android/app/build.gradle, set minifyEnabled and shrinkResources to true to
  remove unused native code and resources.
- Compress images (e.g., TinyPNG).
- Tree Shaking: Use the --tree-shake-icons flag during release builds to strip out unused icons from
  icon fonts like Material Icons.
- Use deferred components or code-splitting where supported.
- Avoid large third-party libraries unless necessary.

## Describe your process when upgrading a Flutter project to a new version.

- Backup and Branching: Always commit your current code and create a new Git branch before starting
  to allow for easy reversal if the upgrade fails.
- Execute `flutter upgrade` in your terminal to fetch the latest stable release of the Flutter and
  Dart SDKs.
- Check `pubspec.yaml` for outdated packages.
- Identify Outdated Packages: Run `flutter pub outdated` to see which dependencies have newer
  versions and identify potential breaking changes.
- Run the app and resolve breaking changes.
- Follow Flutter migration guides for major updates.

## Web renderers
- https://docs.flutter.dev/platform-integration/web/renderers

## Crashalytics vs Analytics
- Firebase Crashlytics and Google Analytics for Firebase serve distinct, complementary purposes. Crashlytics is a real-time crash reporter used to debug app stability, while Analytics tracks user behavior, engagement, and conversion metrics.

## Caching mechanism in Flutter.
- Caching in Flutter means storing data locally (memory or device) so we don’t need to fetch it again from network every time.
- In simple terms, instead of calling API or loading data again and again, we keep a copy and reuse it → faster app and better performance.



## What is the difference between GetBuilder, Obx, and GetX in GetX?

- **GetBuilder:** use GetBuilder when you want to update the state of a widget manually from your
  controller, with update(),
- **Obx:** Obx stands for Observer Widget. It automatically updates the UI when an Rx (observable)
  variable changes.no need to call update() manually.
- **GetX:** GetX is similar to Obx but provides more structure and additional features, like
  initializing and managing the controller within the widget.Use GetX when you need reactive state
  management along with dependency handling in a more organized way.

## How do you pass arguments between screens in GetX?

- Get.to(NextScreen(), arguments: "Hello GetX"); var data = Get.arguments

## What are Bindings in GetX?

- Bindings help manage dependencies automatically when a screen is opened. They allow you to
  initialize and inject controllers or services at the right time, without manually creating them
  inside your UI.

## What are the core components of the Bloc architecture?

- **Bloc / Cubit:**  
  Handles the **business logic** and manages state.
    - `Bloc` uses **events** to trigger state changes.
    - `Cubit` is a simpler version that updates state directly without events.

- **Events (Bloc only):**  
  Represent **user actions or triggers** (e.g., button clicks) that cause state changes.

- **States:**  
  Represent the **different UI states** emitted by the Bloc or Cubit (e.g., loading, success,
  error).

- **BlocProvider:**  
  Provides the Bloc or Cubit instance to the widget tree, making it accessible to child widgets.

- **BlocBuilder:**  
  Rebuilds the UI in response to **new states**.

- **BlocListener:**  
  Listens to state changes and is used for **side effects** (e.g., navigation, showing dialogs)
  without rebuilding the UI.

## How do you integrate Stripe in a Flutter app?

You can integrate Stripe in a Flutter app in two main ways:

- **Using Stripe Flutter SDK (Native Integration):**  
  Use the official Stripe Flutter SDK to build **native payment flows**.
    - Provides better UI/UX
    - Gives more control over the payment process
    - Supports features like Apple Pay / Google Pay

- **Using Web (Stripe Checkout / WebView):**  
  Redirect users to a **Stripe-hosted payment page** or open it in a WebView.
    - Easier to implement
    - Fully **PCI-compliant** (Stripe handles sensitive data)
    - Less customization compared to SDK

---

## What is a PaymentIntent in Stripe?

- A **PaymentIntent** represents a payment that a customer intends to make.
- It manages the **entire payment lifecycle**, including authentication, processing, and
  confirmation.

#### Key Points:

- Created on the **server-side** for security
- The client receives a **`client_secret`** to complete the payment
- Supports **SCA (Strong Customer Authentication)**
- Tracks payment status (e.g., requires_payment_method, succeeded, failed)

## Have you used social login? If yes, how to apply social logins?

- **Yes**, social login can be implemented using platform-specific SDKs such as:
    - Google Sign-In
    - Apple Sign-In
    - Facebook Login

- The general flow:
    - Use platform SDKs to authenticate the user
    - Obtain an **authentication token**
    - Send the token to **Firebase or your backend** for verification

- In Flutter:
    - Packages like `google_sign_in` and `sign_in_with_apple` handle the login flow
    - They return user credentials after successful authentication

---

## Important steps for Firebase Authentication

- Enable required **login providers** in the Firebase Console
- Add **Firebase configuration** to your Flutter app
- Install the `firebase_auth` package
- Initialize Firebase in your app
- Implement **login and signup methods**
- Handle **authentication errors** properly
- Listen to **auth state changes** (e.g., user logged in/out)
- Secure backend access using **Firebase Security Rules**

---

## Common issues faced while implementing social login in Flutter

- Invalid **SHA-1** or **SHA-256** keys (especially for Google Sign-In)
- Incorrect **Facebook app configuration**
- Platform-specific setup issues:
    - Missing entries in `Info.plist` (iOS)
    - Missing configuration in `AndroidManifest.xml` (Android)
- Expired or invalid **OAuth tokens**
- Not handling cases where users **deny permissions**

---

## What permissions are required for location services in Flutter?

**Android permissions:**

```xml

<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" /><uses-permission
android:name="android.permission.ACCESS_COARSE_LOCATION" /><uses-permission
android:name="android.permission.FOREGROUND_SERVICE" /><uses-permission
android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
```

**iOS permissions (Info.plist):**

```xml

<key>NSLocationWhenInUseUsageDescription</key><string>We need your location to show nearby places.
</string><key>NSLocationAlwaysUsageDescription</key><string>We need your location to provide
accurate results.
</string>
```

## How do you track the user's live location in Flutter?

Use the **Geolocator** package to get a stream of location updates:

```dart
StreamSubscription<Position>? positionStream;

void startLocationTracking() {
  positionStream = Geolocator.getPositionStream(
    locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
  ).listen((Position position) {
    print("Live Location: ${position.latitude}, ${position.longitude}");
  });
}

void stopLocationTracking() {
  positionStream?.cancel();
}
```

## How do you calculate the distance between two locations in Flutter?

Use the **Geolocator.distanceBetween()** method:

```dart

double distanceInMeters = Geolocator.distanceBetween(
    startLatitude, startLongitude,
    endLatitude, endLongitude
);
```

## Have you worked on an iOS app? Permissions, certificates & profiles?

- Permissions are added in **Info.plist** (camera, location, etc.)

- For app signing:
    - Create **certificate** and **provisioning profile** in Apple Developer Portal

- **Certificate:** Signs the app
- **Provisioning profile:** Links app ID, certificate, and allowed devices

---



## What is the difference between setState(), Provider, and Bloc for state management in Flutter?

* **setState():** Manages local widget state; triggers rebuilds but doesn’t persist state across
  widget recreation.
* **Provider:** Simple, scalable solution for app-wide state using dependency injection.
* **Bloc (Business Logic Component):** Uses streams to handle state changes reactively; ideal for
  complex applications with structured state management.

## What are Flutter's best practices for writing clean and maintainable code?

* Follow **MVVM** or **Clean Architecture** for separation of concerns.
* Use **Dart linting** for consistent code standards.
* Write **reusable widgets** to avoid duplication.
* Implement **dependency injection** with `get_it` or `riverpod`.
* Use **async/await** properly for asynchronous operations.
* Keep widgets **small and modular** for better readability.

## Which are the most popular apps that use Flutter?

* NotebookLM · Google Pay · Google Earth · Google Ads · Google Classroom · YouTube Create · Google
  Cloud · Google One


## How do you handle platform-specific code in Flutter?

* Use **Platform Channels** to communicate between Flutter and native Android (Kotlin/Java) or iOS (
  Swift/Obj-C) code for accessing device-specific features.
* **MethodChannel:** For one-time method calls, e.g., fetching current battery level or device name.
* **EventChannel:** For continuous data streams, e.g., sensor data, location updates.

## Explain the difference between BlocBuilder and BlocConsumer.

- BlocBuilder handles building widgets based on state changes and is used for UI rendering.
  BlocConsumer is a combination of a BlocBuilder and a BlocListener, allowing it to both build
  widgets and execute side effects (like showing a Snackbar or navigation) based on state changes.



## How do you upload a **1GB+ video** without blocking the UI?

-
    - Use `Isolate` for background processing.
- Implement **chunked uploading** with `dio` or `http`.
- Store the temporary file in the cache (`path_provider`).
- Use Firebase Storage, AWS S3, or Cloudflare R2 for resumable uploads.

## How do you handle **multiple large image uploads** in Flutter?

- Use `flutter_image_compress` to reduce size.
- Batch process images in `compute()` to avoid UI freeze.
- Optimize network calls with `dio` using parallel requests (`Future.wait`).





## Building Instagram Reels-like feature with PageView & video_player

- Use **PageController** with `onPageChanged` to detect the active page
- **Preload videos** for current, previous, and next pages to reduce loading delays
- **Dispose** off-screen `VideoPlayerController`s to free resources
- **Initialize and play** the video only when scrolling stops on the current page
- Optionally, show a **loading indicator** until the video is ready

## What is Flutter In-App Purchase?

- Flutter In-App Purchase allows apps to sell digital content, subscriptions, or features directly
  inside the app on iOS and Android. You use platform-specific stores (Google Play Store, Apple App
  Store) via packages like in_app_purchase to handle purchase flow, verify transactions, and deliver
  content securely.

## What types of in-app purchases are supported in Flutter? What is the difference between *

*consumable, non-consumable, and subscription** purchases?

- Flutter supports two main types of in-app purchases via the in_app_purchase package: Consumable –
  Items that can be bought, used, and bought again (e.g., coins, tokens). Non-Consumable – One-time
  purchases that unlock permanent features (e.g., premium upgrade, ad remova). Subscriptions –
  Recurring purchases for time-based access to content or features (e.g., monthly or yearly plans)."

## How do you get directions between two locations in Flutter?

- Use the Google Directions API.

## How would you execute multiple asynchronous tasks in parallel and wait for all of them to complete?

- Use Future.wait():
  Future<void> fetchAllData() async {
  List responses = await Future.wait([
  fetchData1(),
  fetchData2(),
  fetchData3(),
  ]);
  }

## How do you enable background location tracking in Flutter for Android and iOS?

- Add permissions in AndroidManifest.xml: (ACCESS_COARSE_LOCATION,
  ACCESS_FINE_LOCATION, ACCESS_BACKGROUND_LOCATION)
  Add the foregroundServiceType="location" inside <service>:
  Add the following keys in Info.plist:
  <key>NSLocationWhenInUseUsageDescription</key>
  <string>We use your location to provide better services</string>
  <key>NSLocationAlwaysUsageDescription</key>
  <string>We need background location access to track your movement</string>
  <key>UIBackgroundModes</key>
  <array>
  <string>location</string>
  </array>

## What is the difference between foreground and background location tracking?

- ![alt text](<Screenshot From 2025-11-22 22-45-19.png>)

## How would you solve the "setState() called after dispose()" error?

- if (mounted) {
  setState(() {
  data = newData;
  });}
  Or use a Completer to ensure async operations are complete before the widget is disposed.

## I will share the number list in chat Please tell me how to get an odd number list from this list

- List<int> numbers = [1, 2, 3, 4, 5];
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.removeWhere((num) => num.isEven);
  print(numbers)

## I will share the code in chat Please tell me what output is for the below code

- String text = "Flutter";
  text.replaceAll("F", "D");
  print(text)

## What happens if you use setState() inside initState()?

- Using setState() inside initState() is generally unnecessary and can cause errors because the
  widget is still being initialized. If needed, you should schedule it using
  WidgetsBinding.instance.addPostFrameCallback to update state after the first build.

## Can I use the global key on multiple widgets?

- Runtime error: Multiple widgets cannot have the same GlobalKey.
  A GlobalKey must be unique per widget.

## How would you troubleshoot a deep linking issue in iOS?

- To troubleshoot deep linking issues in iOS, I first check that the URL scheme or Universal Link is
  correctly configured in the Xcode project and Info.plist. Then I verify that the associated domain
  is set up properly and the apple-app-site-association file is accessible. I also test the link in
  Safari, ensure the app delegate handles the URL correctly, and use logs to confirm the deep link
  is received and parsed as expected.

## What is BLE (Bluetooth Low Energy)

- BLE (Bluetooth Low Energy) is a wireless communication protocol designed for low-power
  applications, such as IoT devices, smartwatches, fitness trackers, and medical sensors. It
  consumes significantly less power than Classic Bluetooth, making it ideal for applications
  requiring prolonged battery life.

## What permissions are required for BLE in Flutter (Android & iOS)?

- <uses-permission android:name="android.permission.BLUETOOTH" />

<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
For iOS:
<key>NSBluetoothAlwaysUsageDescription</key>
<string>App needs Bluetooth access</string>

## What is the difference between Write Without Response and Write With Response in BLE?

- Write With Response: The device acknowledges the data sent. Reliable but slower.
  Write Without Response: The device does not send an acknowledgment. Faster but may cause
  data loss

## What are GATT services and characteristics in BLE?

- GATT (Generic Attribute Profile) defines how BLE devices communicate.
  Service: A collection of characteristics (e.g., Heart Rate Service).
  Characteristic: A specific data point (e.g., Heart Rate Measuremen

## Why do some BLE operations require a delay between them?

- BLE communication is asynchronous, and some operations (like reading characteristics or
  writing values) require time to process. Without delays, multiple requests may overlap and fail.

## Why is ACCESS_FINE_LOCATION required for BLE scanning on Android?

- Android considers BLE scanning as a location-based activity, so it requires location permissions
  for scanning nearby BLE devices.
  Android 6+ (API 23+): Requires ACCESS_FINE_LOCATION
  Android 10+ (API 29+): ACCESS_BACKGROUND_LOCATION (for background scanning)
  Android 12+ (API 31+): BLUETOOTH_SCAN and BLUETOOTH_CONNECT

## How do you differentiate between multiple BLE devices of the same type?

- You can distinguish devices using:
  Device ID (MAC address on Android, UUID on iOS)
  Service UUIDs (e.g., Heart Rate Service, Battery Service)
  RSSI (Signal Strength) - To estimate proximity.

## What is an MTU in BLE, and how do you set it in Flutter?

- MTU (Maximum Transmission Unit) defines the maximum size of a single BLE packet.
  ● The default MTU is 23 bytes, but can be increased for faster data transfer.
  flutterReactiveBle.requestMtu(deviceId: deviceId, mtu: 512).then((mtu) {
  print('MTU set to: $mtu');
  });
  Higher MTU = Faster data transfer, but depends on device support

## What are notification channels, and why are they needed in Android?

- Notification channels are used in Android 8.0 (API 26+) to categorize notifications. Every
  notification must be assigned to a channel, which defines its behavior, such as importance, sound,
  and vibration. They help users control notification settings per category and ensure consistent
  notification management across the app.
- for example: news_alerts (news alerts), reminders, promotions.








## Explain Flutter state management approaches

Answer: Flutter separates UI and state. Common approaches:

setState – Simple local state.

Provider / ChangeNotifier – Lightweight reactive state.

Bloc / Cubit – Event-driven state with separation of UI and logic.

Riverpod – Improved dependency injection and reactive state.

## What is the difference between InheritedWidget and Provider?

InheritedWidget – Built-in Flutter widget for sharing data down the widget tree.

Provider – A wrapper over InheritedWidget offering simpler syntax, dependency injection, and rebuild
management.


## How do you structure a large Flutter project?

Answer: Common approaches:

Feature-based: Separate folders per feature (screens, models, providers/blocs).

Layered: Separate UI, business logic, and data layers.

Clean Architecture: Layers like presentation, domain, data; separation of concerns and testable
code.



## What is feature first architecture in flutter?
- Feature-first architecture in Flutter means we organize the project based on features instead of technical layers.
- In simple words, all the code related to one feature is kept in one place.
- For example, if we have a login feature, then everything related to login like UI, logic, API calls, and models will be inside one folder called ‘auth’ or ‘login’. So Each feature folder contains its own screens, widgets, logic, and data.



## How do you ensure data synchronization between a local SQLite database and a remote server?

- Timestamp-based Sync:
  Store a last_updated timestamp in the local database.
  Fetch new/updated records from the server based on last_updated.
  Two-way Sync Strategy:
  Send local changes to the server.
  Pull new data from the server.
  Merge conflicts if the same record is modified on both sides.
  Use Background Services:
  Use workmanager or flutter_background_fetch to sync periodically.
  REST API-based Sync:
  Use the http or dio package to fetch data and update the local database

## How do you handle offline mode with SQLite and synchronize when back online?

- Detect Network Status:
  Use connectivity_plus to check internet availability.
  final connectivityResult = await Connectivity().checkConnectivity();
  Queue Offline Requests:
  Store unsynced requests in SQLite with a sync_status column (0 for pending, 1 for
  synced).
  Sync When Online:
  When online, send pending requests to the server and update sync_status.
  Use a Background Sync Service:
  Implement workmanager to sync data periodically in the background

## Which method is used to upload a file or image in Flutter?

- In Flutter, you typically use the http package’s MultipartRequest or Dio package to upload files
  or images to a server.

## Have you used social login in Flutter? How do you implement it?

- Yes, using firebase_auth, google_sign_in, flutter_facebook_auth, etc

## How do you handle API calls efficiently in Flutter?

- Using Dio or http, caching responses, and handling errors with try-catch.

## What is BLOC, and how does it differ from Provider?

- BLoC uses streams and events, while Provider is a simpler state management solution.

## How to manage dependencies in a Flutter project?

- Using pubspec.yaml and dependency_overrides if needed.

## What is deep linking in Flutter?

- It allows opening a specific screen in an app from an external URL.

## Have you worked on an iOS app? Where do you add permissions?

- Yes, in ios/Runner/Info.plist

## How do you generate iOS profiles and certificates?

- Using Apple Developer Account → Certificates, Identifiers & Profiles

## What is isolate in Dart, and how does it help in performance?

- Isolate is used for parallel execution to avoid blocking the main UI thread.

## Explain how to handle background tasks in Flutter.

- Using workmanager or flutter_background_service packages.

## How do you handle socket connections in Flutter?

- Using web_socket_channel or socket.io-client-dart.

## How do you implement push notifications in Flutter?

- Using firebase_messaging or onesignal_flutter

## How would you debug performance issues in Flutter?

- Using Flutter DevTools, Performance Overlay, and profiling tools.

## what is debounce in dart.

- In Dart, debounce is a technique to delay executing a function until a certain period has passed
  since the last call, preventing it from being called too frequently—commonly used with search
  inputs or scroll events.

## Convert a JSON string to a Dart model.

- To convert a JSON string to a Dart model, you first create a model class with a fromJson factory
  constructor, then use jsonDecode from dart:convert.

## Optimize a large list to avoid excessive memory usage.

- Use lazy loading (pagination) with ListView.builder().

## How would you design an offline-first app?

- Use hive or sqflite for local storage.
- Cache API responses using dio_cache_interceptor.
- Sync data with the server when online

## How would you ensure security in a Flutter app?

- Use HTTPS for API calls. ○ Store sensitive data in Flutter Secure Storage instead of
  SharedPreferences. ○ Obfuscate Dart code using dart compile options

## What is the Android Manifest file?

- A configuration file (AndroidManifest.xml) that declares permissions, activities, services, and
  app metadata.

# 🚀 Flutter Interview Questions and Answers 💡

## Full Form of API

🔹 **API** – Application Programming Interface

## Difference Between Package and Plugin in Flutter

- **Package:**
  - A package contains only **Dart code**.
  - It is used for reusable logic like APIs, utilities, and state management.
  - It does not include any platform-specific (native) code.

---

- **Plugin:**
  - A plugin is a special type of package that includes **native platform code**.
  - It uses Kotlin/Java for Android and Swift/Objective-C for iOS.
  - It is used to access **device features** like camera, GPS, sensors, etc.

---

### 📌 Examples

#### Package:
- `http` → Used for making HTTP requests
- `shared_preferences` → Store simple key-value data
- `intl` → Localization and internationalization

---

#### Plugin:
- `camera` → Access device camera
- `firebase_messaging` → Handle push notifications
- `google_maps_flutter` → Display maps using native APIs

---

### 🎯 In short
A package is written in pure Dart for reusable functionality, while a plugin includes native code to interact with platform-specific features.

# Dart and Flutter Key Concepts

## What Does `context.mounted = false` Mean?

- **Meaning:** It means the widget is **no longer in the widget tree** (removed or disposed).
- **Why Important?** Before calling `setState()`, check `if (context.mounted)` to avoid errors.

# Dart and Flutter Key Concepts

## What is State & Why Use State Management Instead of `setState`?

- **State:**
  - **Definition:** State is the **data or information** that controls how a widget looks and behaves.
  - When state changes, the UI updates automatically.

---

#### **Using `setState()`**

- ✅ Directly updates state and rebuilds the widget
- ⚠️ Rebuilds the **entire widget subtree** (not whole app)
- Suitable for **small and simple UI updates**

---

#### **Why Use State Management?**

- **Efficient** → Updates only the **required widgets**
- **Scalable** → Better for **large and complex apps**
- **Maintainable** → Keeps business logic separate from UI
- **Popular Solutions** → `Provider`, `Riverpod`, `Bloc`

---

In short, state controls the UI, `setState` is useful for simple local updates, and state management is used for efficient, scalable, and maintainable apps.

### What is `setState()` in Flutter?

- `setState()` is used to update the state of a StatefulWidget and trigger a UI rebuild.
- Why use: To notify Flutter that the UI needs to be rebuilt after state changes.
- Without setState?: UI won’t update even if the state changes.

### `pubspec.yaml` vs `pubspec.lock` in Flutter.

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

## Can we send data from a GET request to the server?

- Yes, you can send data in a GET request, but it is sent through the URL as query parameters, not in the request body.

```
GET /api/resource?param1=value1&param2=value2
```

## Types of API Methods

- **GET** → Read (Fetch data from server)
- **POST** → Create (Send new data to server)
- **PUT** → Update (Replace entire resource)
- **PATCH** → Update (Modify partial data)
- **DELETE** → Remove (Delete data from server)

## **Build Modes in Flutter**

**“Flutter has different build modes that define how the app is compiled and run depending on
development or production needs.”**

---

### 🔹 **1. Debug Mode**

* Used during **development**
* Supports **hot reload & hot restart**
* Not optimized (slower performance)
* Includes **debugging tools and checks**

`flutter run`

👉 Example use: while writing and testing code

---

### 🔹 **2. Profile Mode**

* Used for **performance testing**
* Almost like release mode but with **some profiling tools enabled**
* No hot reload
* Used to analyze **app performance and frame rendering**

`flutter run --profile`

👉 Example use: checking UI smoothness, memory usage

---

### 🔹 **3. Release Mode**

* Used for **final production build**
* Fully optimized for **performance and size**
* Debugging features removed
* Fastest and most efficient mode

`flutter run --release`

👉 Example use: publishing app to Play Store / App Store


## Android and iOS folders in Flutter Project

- **Android Folder:** Contains the entire Android project necessary for building a Flutter
  application for the Android platform. It includes configurations, resources, and native code
  components specific to Android.

- **iOS Folder:** Contains the entire iOS project necessary for building a Flutter application for
  the iOS platform. It includes configurations, resources, and native code components specific to
  iOS.

## Deploying a Flutter App on Play Store

- For detailed steps on deploying a Flutter app on Google Play Store, you can refer to
  this [Medium article](https://medium.com/@bernes.dev/deploying-flutter-apps-to-the-playstore-1bd0cce0d15c).

## Deploying a Flutter App on App Store

- For a comprehensive guide on releasing your Flutter app for iOS and Android, you can refer to
  this [Instabug blog post](https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android).

## How does Flutter run the code on Android?

- The engine's C and C++ code are compiled with Android's NDK. The Dart code (both the SDK's and
  yours) are ahead-of-time (AOT) compiled into native, ARM, and x86-64 libraries. Those libraries
  are included in a "runner" Android project, and the whole thing is built into an .apk. When
  launched, the app loads the Flutter library. Any rendering, input, or event handling, and so on,
  is delegated to the compiled Flutter and app code. This is similar to the way many game engines
  work.

During debug mode, Flutter uses a virtual machine (VM) to run its code in order to enable stateful
hot reload, a feature that lets you make changes to your running code without recompilation. You'll
see a "debug" banner in the top right-hand corner of your app when running in this mode, to remind
you that performance is not characteristic of the finished release app.

## How does Flutter run the code on iOS?

- The engine's C and C++ code are compiled with LLVM. The Dart code (both the SDK's and yours) are
  ahead-of-time (AOT) compiled into a native, ARM library. That library is included in a "runner"
  iOS project, and the whole thing is built into an .ipa. When launched, the app loads the Flutter
  library. Any rendering, input or event handling, and so on, are delegated to the compiled Flutter
  and app code. This is similar to the way many game engines work.

During debug mode, Flutter uses a virtual machine (VM) to run its code in order to enable stateful
hot reload, a feature that lets you make changes to your running code without recompilation. You'll
see a "debug" banner in the top right-hand corner of your app when running in this mode, to remind
you that performance is not characteristic of the finished release app.

## Differance between InheritedWidget & InheritedModel

- InheritedWidget and InheritedModel are both used to share data down the widget tree, but InheritedModel is more optimized for selective rebuilds.
- In simple terms, InheritedWidget rebuilds all dependent widgets when data changes, while InheritedModel rebuilds only the widgets that depend on a specific part of the data.

With InheritedWidget, if any value changes, all widgets using it will rebuild. But with InheritedModel, we can divide data into parts (called aspects), and only widgets that use that specific aspect will rebuild.

Provider is built on top of InheritedWidget to simplify its usage.

## Dependency Injection vs Service Locator

Dependency Injection provides dependencies from outside, while Service Locator retrieves them
internally from a central registry.

### Dependency Injection (DI)

- Dependencies are **given externally** (via constructor/setter).
- Promotes loose coupling & testability.
- Example: `UserController(AuthService())`

### Service Locator (SL)

- Dependencies are **looked up internally** from a central registry.
- Quick access but hides dependencies (less transparent).
- Example: `ServiceLocator.get<AuthService>()`

## Key Difference

- **DI = give** → Dependencies injected from outside.
- **SL = find** → Dependencies fetched from a registry.

---

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



---


---

---------
PENDING QUESTIONS
---------

- flutter inside - how it's works like tress, render, etc...

Some Flutter questions that should be asked in interviews—but rarely are!!
- How do you manage responsive UI across 20+ device sizes?
- What’s your strategy when a plugin breaks after a Flutter upgrade?
- How do you keep code clean when 5 developers are working on the same screen?
- Ever had a widget rebuild too often? How did you catch that?
- What’s your real-world approach to offline-first design?
- How do you debug janky animations or dropped frames in Flutter?
- How do you handle Firebase Auth state across app restarts?
- What’s your approach to feature flags or environment configs in Flutter?
- How do you deal with deep linking in a large app?
- What do you do when your app size exceeds 100MB?
- How do you structure a Flutter project for scale (like 10+ devs)?
- How do you ensure app security (code obfuscation, API keys, etc.)?
- What do you test—and what do you not bother testing in your Flutter code?
- How do you handle back navigation when using nested navigators (e.g., BottomNav + routes)?

Questions about state management: https://medium.com/@thedevwriter/how-well-do-you-know-flutter-state-management-20-questions-to-test-you-87f8e65b87e8
