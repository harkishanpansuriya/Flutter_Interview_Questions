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