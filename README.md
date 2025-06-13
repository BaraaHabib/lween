# Lween

A feature-rich Flutter application that demonstrates modern development patterns for a transportation booking platform.

## Features

- **Onboarding** with splash screen
- **User authentication** (register, login, verify code, password reset)
- **Home dashboard** with bottom navigation
- **Browse transportation companies** and profiles
- **Order wizard** to book seats and pay
- **Notifications** with Firebase Messaging
- **Localization** for English and Arabic
- **Theming** with persisted preferences
- **State management** using `flutter_bloc` and hooks
- **Dependency injection** via `GetIt`
- **Local storage** using Hive

## Getting Started

1. Install [Flutter](https://flutter.dev/docs/get-started/install) (SDK >= 3.0)
2. Fetch packages:
   ```bash
   flutter pub get
   ```
3. Set API keys and URLs in `lib/core/configurations/env_config.dart`
4. Generate code and localization files:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Run the app:
   ```bash
   flutter run
   ```

### Running Tests

```bash
flutter test
```

## Project Structure

- `lib/features/` – modularized feature directories
- `lib/core/` – shared utilities, routing and services
- `assets/` – images, icons and fonts
- `test/` – basic widget tests

---
