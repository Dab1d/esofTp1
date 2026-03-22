import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:david_name_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('verify the name David is displayed',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter login credentials
      await tester.enterText(find.byType(TextField).at(0), 'user@4u.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      final button = find.text('Continuar');
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();

      // Verify the app displays the correct text
      expect(find.text('Hi! my name is David'), findsOneWidget);
    });
  });
}
