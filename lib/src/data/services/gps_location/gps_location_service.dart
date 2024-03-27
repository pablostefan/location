import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/src/data/services/gps_location/interface/gps_location_service_interface.dart';
import 'package:location/src/ui/error/app_error.dart';

class GPSLocationService implements IGPSLocationService {
  @override
  Future<Either<AppError, bool>> checkLocationPermissionAndService() async {
    try {
      // Request gps_location permission from the user
      await Geolocator.requestPermission();

      // Check if gps_location permission is granted
      bool locationPermission = _checkPermission(await Geolocator.checkPermission());

      // Check if gps_location services are enabled on the device
      bool locationEnabled = await Geolocator.isLocationServiceEnabled();

      // Return whether gps_location services are enabled and permission is granted
      return Right(locationPermission && locationEnabled);
    } catch (error) {
      // In case of error, return an AppError object
      return Left(AppError.checkLocationError());
    }
  }

  // Private method to check if gps_location permission is granted
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
  Future<Either<AppError, Position>> getCurrentPosition() async {
    try {
      // Get the current position of the device
      Position position = await Geolocator.getCurrentPosition();

      // Return the position
      return Right(position);
    } catch (error) {
      // In case of error, return an AppError object
      return Left(AppError.getPositionError());
    }
  }
}
