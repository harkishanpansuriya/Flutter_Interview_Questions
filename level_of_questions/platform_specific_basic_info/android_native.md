## Android folders in Flutter Project

- **Android Folder:** Contains the entire Android project necessary for building a Flutter
  application for the Android platform. It includes configurations, resources, and native code
  components specific to Android.

## What is the Android Manifest file?

- The `AndroidManifest.xml` file is the main configuration file of an Android app.
- It contains important information that Android needs before running the app.
- We use it to declare app permissions, activities, services, receivers, and app metadata.
- We also define the app name, icon, package name, and launch activity in this file.

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