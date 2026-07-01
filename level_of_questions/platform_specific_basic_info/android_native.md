## Android folders in Flutter Project

- **Android Folder:** Contains the entire Android project necessary for building a Flutter
  application for the Android platform. It includes configurations, resources, and native code
  components specific to Android.

## What is the Android Manifest file?

- The `AndroidManifest.xml` file is the main configuration file of an Android app.
- It contains important information that Android needs before running the app.
- We use it to declare app permissions, activities, services, receivers, and app metadata.
- We also define the app name, icon, package name, and launch activity in this file.

## What is `build.gradle`?

Flutter Android projects have two `build.gradle` files:
1. **Project-level (`android/build.gradle`):** Used for configuration that applies to all modules in the project (e.g., Gradle version, repository locations).
2. **App-level (`android/app/build.gradle`):** Used to configure app-specific settings like `applicationId`, `minSdkVersion`, `targetSdkVersion`, `versionCode`, and dependencies.

## What is ProGuard/R8 in Flutter?

- **R8** (which replaced ProGuard) is a tool that shrinks, optimizes, and obfuscates your code.
- **Shrinking:** Removes unused code and resources, reducing the APK size.
- **Obfuscation:** Renames classes and members to short, cryptic names (e.g., `MainActivity` -> `a`), making it harder to reverse-engineer.
- In Flutter, it is enabled by default for release builds.

## What is a KeyStore?

- A **KeyStore** is a binary file that contains one or more private keys used for signing the Android app.
- Android requires all APKs to be digitally signed with a certificate before they can be installed or updated on a device.
- In Flutter, you configure this in `key.properties` and reference it in the app-level `build.gradle`.

## Android Activity Lifecycle

- The Android Activity Lifecycle defines the different states of an activity from creation to
  destruction.

### Lifecycle Methods

- `onCreate()` – Called when the activity is created. We initialize the UI and data here.
- `onStart()` – Called when the activity becomes visible to the user.
- `onResume()` – Called when the activity comes to the foreground and is ready for user interaction.
- `onPause()` – Called when the activity is partially hidden. We pause ongoing tasks here.
- `onStop()` – Called when the activity is no longer visible.
- `onRestart()` – Called when the activity returns from the stopped state.
- `onDestroy()` – Called before the activity is destroyed. We release resources here.