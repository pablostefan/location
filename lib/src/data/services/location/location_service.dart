import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/src/data/services/location/interface/location_service_interface.dart';
import 'package:location/src/ui/error/app_error.dart';

class LocationService extends ILocationService {
  @override
  Future<Either<AppError, bool>> requestPermission() async {
    try {
      await Geolocator.requestPermission();
      return Right(_checkPermission(await Geolocator.checkPermission()));
    } catch (error) {
      return Left(AppError.permissionError());
    }
  }

  bool _checkPermission(LocationPermission permission) {
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return true;

      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
        return false;
    }
  }

  @override
  Future<Either<AppError, bool>> locationEnabled() async {
    try {
      return Right(await Geolocator.isLocationServiceEnabled());
    } catch (error) {
      return Left(AppError.locationEnabledError());
    }
  }

  @override
  Future<Either<AppError, bool>> openLocationSettings() async {
    try {
      return Right(await Geolocator.openLocationSettings());
    } catch (error) {
      return Left(AppError.openLocationSettingsError());
    }
  }

  @override
  Future<Either<AppError, Stream<Position>>> getLocation() async {
    try {
      return Right(Geolocator.getPositionStream());
    } catch (error) {
      return Left(AppError.openLocationSettingsError());
    }
  }
}
