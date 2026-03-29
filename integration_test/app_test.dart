import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:david_name_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Acceptance Tests', () {
    // ------------------------------------------------------------------
    // Scenario 1: NORMAL - Successful login navigates to Home screen
    // ------------------------------------------------------------------
    testWidgets('Scenario 1: valid credentials navigate to Home screen',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(find.byType(TextField).at(0), 'user@4u.com');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      final button = find.text('Continuar');
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('Hi! my name is David'), findsOneWidget);
    });

    // ------------------------------------------------------------------
    // Scenario 2: ALTERNATIVE - Invalid credentials show error message
    // ------------------------------------------------------------------
    testWidgets('Scenario 2: invalid credentials show login error',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Enter wrong email and password
      await tester.enterText(find.byType(TextField).at(0), 'wrong@email.com');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(find.byType(TextField).at(1), 'wrongpass');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      final button = find.text('Continuar');
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      // The error button should appear and the home screen should NOT
      expect(find.text('Login Inválido,\nClique Para Tentar\nde Novo'), findsOneWidget);
      expect(find.text('Hi! my name is David'), findsNothing);
    });

    // ------------------------------------------------------------------
    // Scenario 3: ALTERNATIVE - Tapping error message resets login form
    // ------------------------------------------------------------------
    testWidgets('Scenario 3: tapping error message restores login form',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Trigger a failed login
      await tester.enterText(find.byType(TextField).at(0), 'wrong@email.com');
      await tester.enterText(find.byType(TextField).at(1), 'wrongpass');
      await tester.pumpAndSettle();

      final button = find.text('Continuar');
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Tap the error button to reset
      final errorButton = find.text('Login Inválido,\nClique Para Tentar\nde Novo');
      expect(errorButton, findsOneWidget);
      await tester.tap(errorButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Login form (TextFields and Continuar button) should be back
      expect(find.byType(TextField), findsWidgets);
      expect(find.text('Continuar'), findsOneWidget);
    });

    // ------------------------------------------------------------------
    // Scenario 4: HOME - Bottom navigation bar changes selected tab
    // ------------------------------------------------------------------
    testWidgets('Scenario 4: bottom nav bar tabs are tappable after login',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Login with valid credentials
      await tester.enterText(find.byType(TextField).at(0), 'user@4u.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      final button = find.text('Continuar');
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      expect(find.text('Hi! my name is David'), findsOneWidget);

      // Tap the first nav icon (Profile)
      await tester.tap(find.byIcon(Icons.person_outline));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Tap the settings icon
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Tap home back
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // App should still be on home screen throughout
      expect(find.text('Hi! my name is David'), findsOneWidget);
    });
  });
}

