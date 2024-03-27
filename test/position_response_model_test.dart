import 'package:flutter_test/flutter_test.dart';
import 'package:location/src/data/models/position_response_model.dart';

void main() {
  group('PositionResponseModel', () {
    test('fromJson should create PositionResponseModel instance from JSON', () {
      // Arrange
      final jsonData = {
        'query': '192.0.2.1',
        'status': 'success',
        'country': 'United States',
        'countryCode': 'US',
        'region': 'CA',
        'regionName': 'California',
        'city': 'Los Angeles',
        'zip': '90001',
        'lat': 34.0522,
        'lon': -118.2437,
        'timezone': 'America/Los_Angeles',
        'isp': 'Google LLC',
        'org': 'Google LLC',
        'as': 'AS15169 Google LLC'
      };

      // Act
      final positionResponse = PositionResponseModel.fromJson(jsonData);

      // Assert
      expect(positionResponse.query, '192.0.2.1');
      expect(positionResponse.status, 'success');
      expect(positionResponse.country, 'United States');
      expect(positionResponse.countryCode, 'US');
      expect(positionResponse.region, 'CA');
      expect(positionResponse.regionName, 'California');
      expect(positionResponse.city, 'Los Angeles');
      expect(positionResponse.zip, '90001');
      expect(positionResponse.latitude, 34.0522);
      expect(positionResponse.longitude, -118.2437);
      expect(positionResponse.timezone, 'America/Los_Angeles');
      expect(positionResponse.isp, 'Google LLC');
      expect(positionResponse.org, 'Google LLC');
      expect(positionResponse.as, 'AS15169 Google LLC');
    });
  });
}
