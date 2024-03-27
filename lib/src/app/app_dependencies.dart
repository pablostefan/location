import 'package:get_it/get_it.dart';
import 'package:location/src/data/repositories/api_geolocation/api_geolocation_repository.dart';
import 'package:location/src/data/repositories/api_geolocation/interface/api_geolocation_repository_interface.dart';
import 'package:location/src/data/services/gps_location/gps_location_service.dart';
import 'package:location/src/data/services/gps_location/interface/gps_location_service_interface.dart';
import 'package:location/src/data/services/http/http_service.dart';
import 'package:location/src/data/services/http/interface/http_interface.dart';
import 'package:location/src/ui/stores/api_map/api_map_store.dart';
import 'package:location/src/ui/stores/gps_map/gps_map_store.dart';
import 'package:location/src/ui/stores/init/init_store.dart';

sealed class AppDependencies {
  static final GetIt getIt = GetIt.instance;

  static void configure() {
    _configureServices();
    _configureRepositories();
    _configureStores();
  }

  static void _configureServices() {
    getIt.registerSingleton<IHttpService>(HttpService());
    getIt.registerSingleton<IGPSLocationService>(GPSLocationService());
  }

  static void _configureRepositories() {
    getIt.registerSingleton<IAPIGeolocationRepository>(APIGeolocationRepository(getIt.get<IHttpService>()));
  }

  static void _configureStores() {
    getIt.registerSingleton<GPSMapStore>(GPSMapStore(getIt.get<IGPSLocationService>()));
    getIt.registerSingleton<APIMapStore>(APIMapStore(getIt.get<IAPIGeolocationRepository>()));
    getIt.registerSingleton<InitStore>(InitStore(getIt.get<IGPSLocationService>()));
  }
}
