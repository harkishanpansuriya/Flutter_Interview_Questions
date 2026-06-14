## How do you manage responsive UI across 20+ device sizes?

- TODO

## How do you structure a Flutter project for scale (10+ devs)?

- TODO

## How do you keep code clean when 5 developers are working on the same screen?

- TODO

## What’s your approach to feature flags or environment configs in Flutter?

- TODO

## What’s your real-world approach to offline-first design? (check duplicate within this file)

- TODO

## How do you handle Firebase Auth state across app restarts?

- TODO

## How do you ensure app security (code obfuscation, API keys, etc.)?

- TODO

## What’s your strategy when a plugin breaks after a Flutter upgrade?

- TODO

## How do you structure a Flutter project for scale (like 10+ devs)?
- TODO

## what is repository pattern in flutter?
The repository pattern in Flutter separates data access from business logic. Instead of widgets calling APIs directly, they use a repository that provides clean methods. This makes the app easier to test, maintain, and scale.

## How would you design a booking service system and manage slot selection in Flutter?

I would design the booking system with a backend that manages slot availability and validates
bookings using transactions to prevent double-booking. In Flutter, I would:

- Fetch available slots from the backend.
- Display slots in a selectable UI (chips/grid).
- Manage selection using state management (Provider, Bloc, or Riverpod).
- Confirm booking by calling an API, letting the backend re-verify the slot to ensure accuracy and
  prevent conflicts.

## If your Flutter app is crashing only in release mode, how do you debug it?

- Run `flutter run --release` and check device logs via `adb logcat`.
- Android: Use the Android Studio Logcat or the command line adb logcat to catch native-level
  crashes.
- iOS: Use the Xcode Device Console to view system logs for your connected iPhone.
- Ensure no `assert` statements or debug-only code is being used.
- Use crash reporting tools like **Sentry** or **Firebase Crashlytics** to capture release crashes.

## Caching mechanism in Flutter.

- Caching in Flutter means storing data locally (memory or device) so we don’t need to fetch it
  again from network every time.
- In simple terms, instead of calling API or loading data again and again, we keep a copy and reuse
  it → faster app and better performance.

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

## How do you handle real-time data updates in Flutter?

- **Streams & StreamBuilder:** Listen to real-time changes asynchronously.
- **WebSockets:** Establish persistent connections for real-time communication.
- **Firebase Firestore:** Provides real-time updates via snapshots.
- **State management (Provider, Riverpod, Bloc):** Efficiently manage and update UI with real-time
  data.

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

## How do you handle platform-specific code in Flutter?

* Use **Platform Channels** to communicate between Flutter and native Android (Kotlin/Java) or iOS (
  Swift/Obj-C) code for accessing device-specific features.
* **MethodChannel:** For one-time method calls, e.g., fetching current battery level or device name.
* **EventChannel:** For continuous data streams, e.g., sensor data, location updates.

## How do you upload a **1GB+ video** without blocking the UI?

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

## What permissions are required for BLE in Flutter (Android & iOS)?

- <uses-permission android:name="android.permission.BLUETOOTH" />

<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
For iOS:
<key>NSBluetoothAlwaysUsageDescription</key>
<string>App needs Bluetooth access</string>

## How do you structure a large Flutter project?

Answer: Common approaches:

Feature-based: Separate folders per feature (screens, models, providers/blocs).

Layered: Separate UI, business logic, and data layers.

Clean Architecture: Layers like presentation, domain, data; separation of concerns and testable
code.

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

## How would you design an offline-first app?

- Use hive or sqflite for local storage.
- Cache API responses using dio_cache_interceptor.
- Sync data with the server when online

## How would you ensure security in a Flutter app?

- Use HTTPS for API calls. ○ Store sensitive data in Flutter Secure Storage instead of
  SharedPreferences. ○ Obfuscate Dart code using dart compile options

## What Does `context.mounted = false` Mean?

- **Meaning:** It means the widget is **no longer in the widget tree** (removed or disposed).
- **Why Important?** Before calling `setState()`, check `if (context.mounted)` to avoid errors.

## What is feature first architecture in flutter?

- Feature-first architecture in Flutter means we organize the project based on features instead of
  technical layers.
- In simple words, all the code related to one feature is kept in one place.
- For example, if we have a login feature, then everything related to login like UI, logic, API
  calls, and models will be inside one folder called ‘auth’ or ‘login’. So Each feature folder
  contains its own screens, widgets, logic, and data.

