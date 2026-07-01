## What are Platform Channels?

Platform channels allow Flutter to communicate with native platforms (Android and iOS) to access platform-specific APIs (like battery level, sensors, or native UI).

### Types of Channels:
1. **MethodChannel:** Used for sending one-time messages (invoking methods) and receiving a result. (e.g., `getBatteryLevel`).
2. **EventChannel:** Used for communication via data streams (continuous data). (e.g., listening to accelerometer data).
3. **BasicMessageChannel:** Used for sending basic messages (strings or semi-structured data) in both directions.

## What is a MethodChannel?

- It is a named channel that facilitates asynchronous method calls between Dart and native code.
- **Dart side:** Calls `invokeMethod('methodName')`.
- **Native side:** Sets a `MethodCallHandler` to listen for the method name and respond with a result or error.

## Common Platform Specific Files

| Feature | Android | iOS |
| :--- | :--- | :--- |
| **Main Config** | `AndroidManifest.xml` | `Info.plist` |
| **Dependencies** | `build.gradle` (Gradle) | `Podfile` (CocoaPods) |
| **App Icon** | `res/mipmap` | `Assets.xcassets` |
| **Entry Point** | `MainActivity.kt/java` | `AppDelegate.swift/objc` |
| **Permissions** | `uses-permission` in Manifest | Usage Descriptions in Plist |
