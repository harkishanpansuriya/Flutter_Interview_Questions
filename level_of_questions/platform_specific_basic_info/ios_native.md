## iOS folders in Flutter Project

- **iOS Folder:** Contains the entire iOS project necessary for building a Flutter application for
  the iOS platform. It includes configurations, resources, and native code components specific to
  iOS.

## What is the `Info.plist` file?

- The `Info.plist` file is the main configuration file of an iOS app.
- It contains important information that iOS needs before running the app.
- We use it to define app permissions, app name, bundle identifier, URL schemes, supported
  orientations, and other app settings.
- We also add permission usage descriptions, such as Camera, Location, and Microphone, in this file.

## What is CocoaPods and the `Podfile`?

- **CocoaPods** is the dependency manager for iOS projects (similar to `pub` for Dart).
- The **`Podfile`** is where iOS-specific dependencies (pods) are defined.
- When you add a Flutter plugin that has native iOS code, Flutter automatically adds it to the `Podfile`.
- Running `pod install` creates the `Podfile.lock` to ensure version consistency.

## `Runner.xcworkspace` vs `Runner.xcodeproj`

- **`.xcodeproj`:** The core project file containing settings, targets, and file references.
- **`.xcworkspace`:** A wrapper that can contain multiple projects and libraries.
- In Flutter, **always open `.xcworkspace`** because it includes the CocoaPods dependencies. Opening the `.xcodeproj` will lead to build errors regarding missing libraries.

## App Signing and Provisioning Profiles

- **Bundle Identifier:** A unique string (e.g., `com.example.app`) that identifies the app in the App Store.
- **Certificate:** A digital signature from Apple that verifies your identity as a developer.
- **Provisioning Profile:** A file that links your developer certificate, devices, and Bundle ID together to allow the app to run on a physical device.

## Open Xcode from Android Studio

- open ios/Runner.xcworkspace

## iOS App Lifecycle

- The iOS App Lifecycle defines the different states of an app from launch to termination.

### Lifecycle Methods

- `application(_:didFinishLaunchingWithOptions:)` – Called when the app launches. We perform initial
  setup here.
- `applicationWillResignActive(_:)` – Called when the app is about to become inactive.
- `applicationDidBecomeActive(_:)` – Called when the app becomes active and ready for user
  interaction.
- `applicationDidEnterBackground(_:)` – Called when the app moves to the background.
- `applicationWillEnterForeground(_:)` – Called when the app is about to return to the foreground.
- `applicationWillTerminate(_:)` – Called before the app is terminated.

> **Note:** In modern iOS apps, lifecycle events are mainly handled by `SceneDelegate` (
`sceneDidBecomeActive`, `sceneDidEnterBackground`, etc.), while `AppDelegate` is still used for
> app-level events such as launch, notifications, and deep links.