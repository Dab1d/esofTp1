# Acceptance Test Log: TPC#3

## Goal
The goal of this assignment is to experiment with the use of automated acceptance tests to verify and validate one single scenario for the mobile app built for TPC#1. The app is a minimal Flutter application that displays the name "David". The tested scenario is to ensure that the app successfully launches and the text "Hi! my name is David" is visible to the user.

## Process and Tasks

### Task 1: Add Dependency for Testing
**Command / Input:**
Added the `integration_test` dependency to the `pubspec.yaml` file under `dev_dependencies`. 
```yaml
dev_dependencies:
  integration_test:
    sdk: flutter
```

### Task 2: Create the Integration Test
**Command / Input:**
Created the file `integration_test/app_test.dart` with the test logic to pump the widget and assert that the required text is found:
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:david_name_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('verify the name David is displayed', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('Hi! my name is David'), findsOneWidget);
    });
  });
}
```

### Task 3: Execute the Test
**Command / Input:**
Ran the following command in the terminal to execute the end-to-end acceptance test:
```bash
flutter test integration_test/app_test.dart
```

**Output:**
```
Building Linux application...                                          
...
✓ Built build/linux/x64/debug/bundle/david_name_app
00:07 +1: All tests passed!
```

## Tools and Materials Used
- **Flutter Framework:** The primary SDK used for the app UI.
- **[integration_test package](https://docs.flutter.dev/testing/integration-tests):** Flutter's official tool for running integration and acceptance tests. It uses the `flutter_test` APIs to interact with the application like a real user.

## Critical Analysis
The process of adding an automated acceptance test in Flutter using the `integration_test` package is straightforward and well-integrated into the ecosystem. 
- **Setup:** It simply requires adding an SDK dependency and creating a test file in an `integration_test` folder. 
- **Writing Tests:** Writing the test uses the exact same `WidgetTester` syntax (like `tester.pumpAndSettle()` and `find.text()`) that developers are already familiar with from unit and widget testing, lowering the learning curve significantly.
- **Execution:** Running the test builds a real executable (Linux in this case, or APK/iOS on mobile devices) and verifies behavior mimicking an actual user precisely. 
- **Conclusion:** Automated acceptance tests provide immense value by running objective, reliable checks that confirm the feature meets the expectations, saving significant manual testing effort down the line. The chosen scenario was simplistic (verifying static text), but it establishes the structural foundation necessary for navigating and asserting complex user journeys.
