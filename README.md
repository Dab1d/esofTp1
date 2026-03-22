# 4U - David Name App

A mobile Flutter application originally built as a minimalistic profile viewer (TPC#1) that has been progressively evolved to feature rigorous test-driven authentication.

## ✨ Features Added

### 1. Secure User Authentication (User Story 1)
- **Login Screen:** A modern, visually robust login interface supporting traditional Email/Password credentials and mockups for Apple, Google, and Facebook social log-ins.
- **State Management & Validation:** Simulates a login flow with real-time feedback. Inputting `user@4u.com` / `password123` securely authenticates the user and transitions to the Home page.
- **Fail-States:** Entering invalid credentials conditionally transforms the UI to show an inline error overlay, allowing users to quickly retry.

### 2. Global Navigation & Styling
- Includes a standard `BottomNavigationBar` setup, routing naturally into the authenticated core of the application.
- Employs `font_awesome_flutter` to provide crisp, vector-perfect iconography across the platform.

### 3. Automated Acceptance Tests (TPC#3)
- Implemented **BDD (Behavior-Driven Development)** end-to-end integration tests using Flutter's official `integration_test` framework.
- Capable of spawning a headless environment to autonomously type keystrokes, press buttons, and validate routing logic purely from the user's perspective, proving mathematically that User Story 1 meets business requirements. 
- *See [ACCEPTANCE_TEST_LOG.md](ACCEPTANCE_TEST_LOG.md) for detailed task breakdowns and critical analysis.*

### 4. Continuous Integration (CI/CD)
- Engineered a **GitHub Actions** CI pipeline (`.github/workflows/flutter_ci.yml`) that triggers on every push/PR to `main`.
- Automates dependency fetching, strict static analysis (`flutter analyze`), and structural regression tests guaranteeing master branch stability.

---

## 🚀 Running Locally

Ensure you have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.

```bash
# Get dependencies
flutter pub get

# Run the app normally
flutter run

# Run Widget Tests
flutter test

# Run End-To-End Acceptance Tests
flutter test integration_test/app_test.dart
```
