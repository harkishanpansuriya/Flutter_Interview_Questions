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

