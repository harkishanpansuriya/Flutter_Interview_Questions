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

## What are notification channels, and why are they needed in Android?

- Notification channels are used in Android 8.0 (API 26+) to categorize notifications. Every
  notification must be assigned to a channel, which defines its behavior, such as importance, sound,
  and vibration. They help users control notification settings per category and ensure consistent
  notification management across the app.
- for example: news_alerts (news alerts), reminders, promotions.

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

## What is BLE (Bluetooth Low Energy)

- BLE (Bluetooth Low Energy) is a wireless communication protocol designed for low-power
  applications, such as IoT devices, smartwatches, fitness trackers, and medical sensors. It
  consumes significantly less power than Classic Bluetooth, making it ideal for applications
  requiring prolonged battery life.

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

