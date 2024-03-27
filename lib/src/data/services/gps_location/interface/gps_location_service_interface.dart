import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/src/ui/error/app_error.dart';

abstract class IGPSLocationService {
  Future<Either<AppError, bool>> checkLocationPermissionAndService();

  Future<Either<AppError, Position>> getCurrentPosition();
}
