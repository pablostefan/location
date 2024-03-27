import 'package:flutter_triple/flutter_triple.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/src/data/services/location/interface/location_service_interface.dart';
import 'package:location/src/ui/error/app_error.dart';
import 'package:location/src/ui/view_models/gps_map/gps_map_view_model.dart';

class GPSMapStore extends Store<GPSMapViewModel> {
  final ILocationService _locationService;

  GPSMapStore(this._locationService) : super(GPSMapViewModel());

  @override
  void initStore() {
    super.initStore();
    _getCurrentPosition();
  }

  void _getCurrentPosition() async {
    setLoading(true);
    await _locationService.getCurrentPosition().then((position) {
      position.fold(setError, (position) => update(state.copyWith(position: position)));
      setLoading(false);
    });
  }

  void onMapCreated(GoogleMapController mapController) {
    try {
      Geolocator.getPositionStream().listen((position) {
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 18)));
      });
    } catch (error) {
      setError(AppError.locationError());
    }
  }
}
