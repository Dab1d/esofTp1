import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:david_name_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('verify the name David is displayed',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the app displays the correct text
      expect(find.text('Hi! my name is David'), findsOneWidget);
    });
  });
}
