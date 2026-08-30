# Test App

Flutter mobile app displaying scheduled tests with detailed analysis (score gauge, ranks, subject-wise bar chart).

## Features

- Past / Upcoming / Live test tabs
- Test cards with date, mode, subjects
- Detailed analysis screen with score, AIR, State/Batch/Branch ranks, and bar chart
- Custom gauge painter & bar chart (no third-party chart libs)
- Custom blue launcher icon

## How to build & install (Android APK)

### 1. Install Flutter

Download Flutter SDK: https://docs.flutter.dev/get-started/install

### 2. Get dependencies

```bash
cd test_app
flutter pub get
```

### 3. Build APK

```bash
flutter build apk --release
```

The APK will be at:
`build/app/outputs/flutter-apk/app-release.apk`

### 4. Install on your phone

- Copy `app-release.apk` to your phone
- Tap it → enable "Install from unknown sources" if asked
- Done

Or via USB:

```bash
flutter install
```

## Stack

- Flutter 3.x
- Pure Dart CustomPaint for gauge + bar chart
- No backend / fully offline