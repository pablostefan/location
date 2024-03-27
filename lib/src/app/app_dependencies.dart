import 'package:get_it/get_it.dart';
import 'package:location/src/data/repositories/geolocation/geolocation_repository.dart';
import 'package:location/src/data/repositories/geolocation/interface/geolocation_repository_interface.dart';
import 'package:location/src/data/services/http/http_service.dart';
import 'package:location/src/data/services/http/interface/http_interface.dart';
import 'package:location/src/data/services/location/interface/location_service_interface.dart';
import 'package:location/src/data/services/location/location_service.dart';
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
    getIt.registerSingleton<ILocationService>(LocationService());
  }

  static void _configureRepositories() {
    getIt.registerSingleton<IGeolocationRepository>(GeolocationRepository(getIt.get<IHttpService>()));
  }

  static void _configureStores() {
    getIt.registerSingleton<GPSMapStore>(GPSMapStore(getIt.get<ILocationService>()));
    getIt.registerSingleton<InitStore>(InitStore(getIt.get<ILocationService>()));
  }
}
