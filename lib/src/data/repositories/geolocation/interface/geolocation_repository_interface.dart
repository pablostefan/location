import 'package:either_dart/either.dart';
import 'package:location/src/data/models/position_response_model.dart';
import 'package:location/src/ui/error/app_error.dart';

abstract class IGeolocationRepository {
  Future<Either<AppError, PositionResponseModel>> getCurrentPosition();
}
