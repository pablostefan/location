import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/src/ui/error/alert_type.dart';
import 'package:location/src/ui/error/app_error.dart';
import 'package:location/src/ui/widgets/alert_widget.dart';

void main() {
  testWidgets('AlertWidget displays correctly', (WidgetTester tester) async {
    // Arrange
    const AppError testError = AppError(type: AlertType.error, message: 'Test error message');
    await tester.pumpWidget(const MaterialApp(home: AlertWidget(alert: testError)));

    // Act
    await tester.pump();

    // Assert
    expect(find.text('Test error message'), findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(2));
  });
}
