// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:david_name_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Login first
    await tester.enterText(find.byType(TextField).at(0), 'user@4u.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    final button = find.text('Continuar');
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pumpAndSettle();

    // Verify that the text 'Hi! my name is David' is displayed.
    expect(find.text('Hi! my name is David'), findsOneWidget);
  });
}
