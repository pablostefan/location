import 'package:either_dart/either.dart';
import 'package:location/src/data/models/position_response_model.dart';
import 'package:location/src/ui/error/app_error.dart';

abstract class IAPIGeolocationRepository {
  Future<Either<AppError, PositionResponseModel>> getCurrentPosition();
}
