# 🔗 ShortUrlMobile

A Flutter-based mobile application that generates and manages **short URLs** easily. Built for fast sharing and analytics.

---

## ✅ Prerequisites

- **Flutter SDK** (>= 3.29.3)
- **Android Studio** or **VS Code** (with Flutter & Dart plugins)
- Android device/emulator or iOS device/simulator

---

## 🚀 Installation

```bash
git clone https://github.com/bigtvsignitives/ShortUrlMobile.git
cd ShortUrlMobile
flutter pub get
flutter run
```

---

## 📱 Build Instructions

### 🩹 Clean & Get Dependencies

```bash
flutter clean
flutter pub get
```

---

### 📦 Android Build

#### 🔧 Build APK (Release)

```bash
flutter build apk --release
```

📁 Output:
```
build/app/outputs/flutter-apk/app-release.apk
```

#### 📦 Build AAB (for Play Store)

```bash
flutter build appbundle --release
```

📁 Output:
```
build/app/outputs/bundle/release/app-release.aab
```

---

### 🍏 iOS Build

#### 🔧 Clean, Install Pods, and Open in Xcode

```bash
flutter clean
flutter pub get
cd ios
pod install
open Runner.xcworkspace
```

#### 🚀 Build for Release

```bash
flutter build ios --release
```

📁 Output:
```
build/ios/iphoneos/Runner.app
```

#### 📤 Upload to TestFlight / App Store

1. Open the project in **Xcode**.
2. Go to `Product > Clean Build Folder`.
3. Then go to `Product > Archive`.
4. Follow the Xcode flow to upload to **App Store Connect**.

---

## 📸 Screenshots

<!-- Add your screenshots here -->
<!--
<p float="left">
  <img src="screenshots/create_url.png" width="200"/>
  <img src="screenshots/history.png" width="200"/>
</p>
-->

---

## 🙌 Contributors

- [@bigtvsignitives](https://github.com/bigtvsignitives) – Creator & Maintainer

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).


---

## 🌐 Web Deployment (Flutter Web)

### 📦 Build Web Version

```bash
flutter build web
```

📁 Output:
```
build/web/
```

### 🚀 Host Using Any Static Web Server

You can deploy the `build/web` folder using services like:

- **Firebase Hosting**
- **GitHub Pages**
- **Vercel**
- **Netlify**

### Example: Firebase Hosting

1. Install Firebase CLI:

```bash
npm install -g firebase-tools
```

2. Login & Initialize:

```bash
firebase login
firebase init
```

3. Deploy:

```bash
firebase deploy
```

Make sure to set `build/web` as the public directory during setup.

