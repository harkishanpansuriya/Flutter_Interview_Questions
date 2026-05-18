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

## Deploying a Flutter App on Play Store

- For detailed steps on deploying a Flutter app on Google Play Store, you can refer to
this [Medium article](https://medium.com/@bernes.dev/deploying-flutter-apps-to-the-playstore-1bd0cce0d15c).

## Deploying a Flutter App on App Store

- For a comprehensive guide on releasing your Flutter app for iOS and Android, you can refer to
this [Instabug blog post](https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android).