import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';
import 'package:location/src/data/services/gps_location/interface/gps_location_service_interface.dart';
import 'package:location/src/ui/ui_helpers/app_routes.dart';

class InitStore extends Store<bool> {
  final IGPSLocationService _locationService;

  InitStore(this._locationService) : super(false);

  void checkLocation(BuildContext context) async {
    await _locationService
        .checkLocationPermissionAndService()
        .then((value) => value.fold(setError, update))
        .whenComplete(() => openNextPage(context));
  }

  void openNextPage(BuildContext context) => state ? _openGPSMapPage(context) : _openAPIMapPage(context);

  void _openGPSMapPage(BuildContext context) => GoRouter.of(context).go(AppRoutes.gpsMap);

  void _openAPIMapPage(BuildContext context) => GoRouter.of(context).go(AppRoutes.apiMap);
}
