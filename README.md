# Lween

Lween is a full-featured Flutter application built for managing transportation bookings. It showcases production-ready code with modern patterns for state management, networking and routing.

## Features

- Splash screen and onboarding flow
- User authentication with login, registration and password reset
- Home dashboard with bottom navigation
- Browse transportation companies and company profiles
- Order wizard to reserve seats and submit payments
- Ticket management and history
- Push notifications using Firebase Messaging
- Localization for English and Arabic
- Light and dark themes persisted with user preferences
- State management using `flutter_bloc` and Flutter hooks
- Dependency injection via `GetIt`
- Offline data caching with Hive

## Architecture

The project follows a modular structure separating **features** from reusable **core** utilities. Business logic is organized with BLoC and repository patterns. A remote data source handles all API requests through Dio with global error handling. Services such as navigation, file management and notifications are injected using GetIt.

## Project Structure

- `lib/features/` – individual feature modules (account, orders, companies, etc.)
- `lib/core/` – shared utilities, routing and services
- `lib/generated/` – generated localization and routing code
- `assets/` – images, icons and fonts
- `test/` – basic widget tests

## Getting Started

1. Install [Flutter](https://flutter.dev/docs/get-started/install) (SDK >= 3.0).
2. Fetch packages:
   ```bash
   flutter pub get
   ```
3. Configure API keys and endpoints in `lib/core/configurations/env_config.dart`.
4. Generate Firebase configuration with the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli):
   ```bash
   flutterfire configure
   ```
   This populates `lib/firebase_options.dart`, `android/app/google-services.json`
   and `ios/Runner/GoogleService-Info.plist`. You can also copy the provided
   `*.example` files and fill in your project values manually.
5. Generate code and localization files:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
6. Run the app:
   ```bash
   flutter run
   ```

## Downloads

You can try the latest build or browse screenshots using the links below:

- [APK Download](https://drive.google.com/file/d/13YTsDDfQHxvoTc7sac3W5xnm7u7cYw8G/view?usp=drive_link)
- [App Images](https://drive.google.com/drive/folders/1xDNaGVstvZOsLmLmY_vHDNSfVGXQa95o?usp=drive_link)

---
