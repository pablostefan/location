import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/src/ui/error/app_error.dart';

abstract class ILocationService {
  Future<Either<AppError, bool>> requestPermission();

  Future<Either<AppError, bool>> locationEnabled();

  Future<Either<AppError, bool>> openLocationSettings();

  Future<Either<AppError, Stream<Position>>> getLocation();
}
