import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/src/data/models/position_response_model.dart';
import 'package:location/src/ui/models/position_model.dart';

void main() {
  group('PositionModel', () {
    test('fromAPIResponse should create PositionModel instance from PositionResponseModel', () {
      // Arrange
      final positionResponseModel = PositionResponseModel(
        query: '192.0.2.1',
        status: 'success',
        country: 'United States',
        countryCode: 'US',
        region: 'CA',
        regionName: 'California',
        city: 'Los Angeles',
        zip: '90001',
        latitude: 34.0522,
        longitude: -118.2437,
        timezone: 'America/Los_Angeles',
        isp: 'Google LLC',
        org: 'Google LLC',
        as: 'AS15169 Google LLC',
      );

      // Act
      final positionModel = PositionModel.fromAPIResponse(positionResponseModel);

      // Assert
      expect(positionModel.latitude, 34.0522);
      expect(positionModel.longitude, -118.2437);
    });

    test('fromGPSResponse should create PositionModel instance from Position', () {
      // Arrange
      final position = Position(
        latitude: 34.0522,
        longitude: -118.2437,
        timestamp: DateTime.now(),
        accuracy: 10,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      );

      // Act
      final positionModel = PositionModel.fromGPSResponse(position);

      // Assert
      expect(positionModel.latitude, 34.0522);
      expect(positionModel.longitude, -118.2437);
    });

    test('toLatLng should return LatLng instance with correct coordinates', () {
      // Arrange
      final positionModel = PositionModel(latitude: 34.0522, longitude: -118.2437);

      // Act
      final latLng = positionModel.toLatLng;

      // Assert
      expect(latLng.latitude, 34.0522);
      expect(latLng.longitude, -118.2437);
    });

    test('PositionModel.cloudWalk should return a specific position for CloudWalk', () {
      // Arrange
      final positionModel = PositionModel.cloudWalk();

      // Assert
      expect(positionModel.latitude, -23.569012531413);
      expect(positionModel.longitude, -46.70074583900324);
    });
  });
}
