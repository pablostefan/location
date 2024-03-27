import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:location/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Integration Test", (widgetTester) async {
    // Initialize app
    app.main();

    await widgetTester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byKey(const ValueKey('google_map')), findsOneWidget);
  });
}
