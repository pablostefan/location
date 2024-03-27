import 'package:either_dart/either.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:location/src/data/models/position_response_model.dart';
import 'package:location/src/data/repositories/api_geolocation/interface/api_geolocation_repository_interface.dart';
import 'package:location/src/data/services/http/interface/http_interface.dart';
import 'package:location/src/data/utils/execute_with_catch.dart';
import 'package:location/src/ui/error/app_error.dart';

class APIGeolocationRepository extends IAPIGeolocationRepository {
  final IHttpService _http;

  APIGeolocationRepository(this._http);

  @override
  Future<Either<AppError, PositionResponseModel>> getCurrentPosition() async {
    return executeWithCatch(() async {
      var response = await _http.get(FlutterConfig.get("API_URL"));
      return PositionResponseModel.fromJson(response.data);
    });
  }
}
