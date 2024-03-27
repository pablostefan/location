import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/src/data/services/gps_location/interface/gps_location_service_interface.dart';
import 'package:location/src/ui/pages/init/init_page.dart';
import 'package:location/src/ui/stores/init/init_store.dart';
import 'package:mockito/mockito.dart';

class MockLocationService extends Mock implements IGPSLocationService {}

void main() {
  group('InitPage Widget Test', () {
    late InitStore initStore;

    setUp(() {
      initStore = InitStore(MockLocationService()); // Substitua pelo seu serviço real ou mock
    });

    testWidgets('InitPage should show CloudWalk SVG', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: InitPage()));

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byKey(const Key('cloudWalkSvg')), findsOneWidget);
    });
  });
}
