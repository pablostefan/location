import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/src/ui/models/position_model.dart';
import 'package:location/src/ui/widgets/google_map_widget.dart';

void main() {
  testWidgets('GoogleMapWidget displays correctly', (WidgetTester tester) async {
    // Arrange
    final PositionModel testPosition = PositionModel(latitude: 34.0522, longitude: -118.2437);
    GoogleMapController? mapController;

    await tester.pumpWidget(MaterialApp(
        home: GoogleMapWidget(
            onMapCreated: (controller) {
              mapController = controller;
            },
            position: testPosition)));

    // Act
    await tester.pump();

    // Assert
    expect(find.byType(GoogleMap), findsOneWidget);
  });
}
