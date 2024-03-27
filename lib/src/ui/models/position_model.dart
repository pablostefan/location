import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/src/data/models/position_response_model.dart';

class PositionModel {
  final double latitude;
  final double longitude;

  PositionModel({required this.latitude, required this.longitude});

  PositionModel.cloudWalk()
      : latitude = -23.569012531413,
        longitude = -46.70074583900324;

  factory PositionModel.fromAPIResponse(PositionResponseModel model) {
    return PositionModel(latitude: model.latitude, longitude: model.longitude);
  }

  factory PositionModel.fromGPSResponse(Position position) {
    return PositionModel(latitude: position.latitude, longitude: position.longitude);
  }

  LatLng get toLatLng => LatLng(latitude, longitude);
}
