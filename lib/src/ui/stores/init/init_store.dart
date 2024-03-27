import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';
import 'package:location/src/data/services/location/interface/location_service_interface.dart';
import 'package:location/src/ui/ui_helpers/app_routes.dart';

class InitStore extends Store<bool> {
  final ILocationService _locationService;

  InitStore(this._locationService) : super(false);

  @override
  void initStore() {
    super.initStore();
    _checkLocation();
  }

  void _checkLocation() async {
    setLoading(true);
    await _locationService.checkLocationPermissionAndService().then((value) {
      value.fold(setError, update);
      setLoading(false);
    });
  }

  void openNextPage(BuildContext context) => _openGPSMapPage(context);

  void _openGPSMapPage(BuildContext context) => GoRouter.of(context).go(AppRoutes.gpsMap);

  void _openAPIMapPage(BuildContext context) => GoRouter.of(context).go(AppRoutes.apiMap);
}
