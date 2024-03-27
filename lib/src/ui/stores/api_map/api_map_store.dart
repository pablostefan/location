import 'dart:async';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/src/data/models/position_response_model.dart';
import 'package:location/src/data/repositories/api_geolocation/interface/api_geolocation_repository_interface.dart';
import 'package:location/src/ui/models/position_model.dart';
import 'package:location/src/ui/view_models/api_map/api_map_view_model.dart';

class APIMapStore extends Store<APIMapViewModel> {
  final IAPIGeolocationRepository _geolocationRepository;

  APIMapStore(this._geolocationRepository) : super(APIMapViewModel());

  @override
  void initStore() {
    super.initStore();
    _getPosition();
  }

  void _getPosition() async {
    setLoading(true);
    await _geolocationRepository
        .getCurrentPosition()
        .then((response) => response.fold(setError, _setPosition))
        .whenComplete(() => setLoading(false));
  }

  void _setPosition(PositionResponseModel responseModel) {
    update(state.copyWith(position: PositionModel.fromAPIResponse(responseModel)));
  }

  void onMapCreated(GoogleMapController mapController) {
    Timer.periodic(const Duration(seconds: 5), (_) => _setNewPositionController(mapController));
  }

  void _setNewPositionController(GoogleMapController mapController) async {
    await _geolocationRepository
        .getCurrentPosition()
        .then((response) => response.fold(setError, _setPosition))
        .whenComplete(() => _updateCameraPosition(mapController));
  }

  void _updateCameraPosition(GoogleMapController mapController) {
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: state.position.toLatLng, zoom: 18)));
  }
}
