# Acceptance Test Log: TPC#3

## Goal
The goal of this assignment is to experiment with the use of automated acceptance tests to verify and validate one single scenario for the mobile app (David App). 
The validated scenario corresponds to **User Story 1 - Secure User Authentication (Login), Scenario 1: NORMAL - Successful Login**.

**BDD Scenario:**
- **Given** the user is on the login screen
- **When** the user enters a valid email (`user@4u.com`) and matching password (`password123`)
- **And** the user taps the "Continuar" button
- **Then** the system should authenticate the user
- **And** the system should navigate the user to the primary Home screen, where the text "Hi! my name is David" is displayed.

## Process and Tasks

### Task 1: Add Dependency for Testing
**Command / Input:**
Added the `integration_test` dependency to the `pubspec.yaml` file under `dev_dependencies`. 
```yaml
dev_dependencies:
  integration_test:
    sdk: flutter
```

### Task 2: Create the Integration Test for User Story 1
**Command / Input:**
Created the file `integration_test/app_test.dart` with the test logic to pump the widget, input the credentials, tap the continuous button, and assert the navigation to the Home screen resulted in the correct text being found.
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:david_name_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('verify successful login scenario', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter login credentials
      await tester.enterText(find.byType(TextField).at(0), 'user@4u.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      final button = find.text('Continuar');
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();

      // Verify the app navigated to home and displays the correct text
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
00:08 +1: All tests passed!
```

## Tools and Materials Used
- **Flutter Framework:** The primary SDK used for the app UI.
- **[integration_test package](https://docs.flutter.dev/testing/integration-tests):** Flutter's official tool for running integration and acceptance tests. It operates just like a human interacting with the screen.

## Critical Analysis
The process of automating this specific acceptance test using the BDD format proved highly effective in bridging requirements and technical implementation.
- **Specification to Code:** The User Story's BDD scenario mapped perfectly to the `integration_test` functions (`enterText`, `tap`, `pumpAndSettle`). This 1:1 mapping guarantees that the test is verifying exactly the business value described by the Product Owner.
- **Interaction Complexity:** Testing the login flow revealed nuances like needing to ensure the "Continuar" button was scroll-visible (`tester.ensureVisible`) before tapping it. This mimics real device constraints (keyboard covering fields or small screens).
- **Execution:** Running the test builds a real executable and verifies the behavior identically to how a user experiences it.
- **Conclusion:** Automated acceptance testing is critical for features like User Authentication, ensuring that new additions to the codebase never break the app's most fundamental entry point without triggering an immediate CI failure.
