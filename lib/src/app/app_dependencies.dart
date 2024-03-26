import 'package:get_it/get_it.dart';
import 'package:location/src/data/repositories/geolocation/geolocation_repository.dart';
import 'package:location/src/data/repositories/geolocation/interface/geolocation_repository_interface.dart';
import 'package:location/src/data/services/http/http_service.dart';
import 'package:location/src/data/services/http/interface/http_interface.dart';
import 'package:location/src/ui/stores/home/home_store.dart';
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
  }

  static void _configureRepositories() {
    getIt.registerSingleton<IGeolocationRepository>(GeolocationRepository());
  }

  static void _configureStores() {
    getIt.registerSingleton<HomeStore>(HomeStore());
    getIt.registerSingleton<InitStore>(InitStore());
  }
}
