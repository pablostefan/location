import 'package:either_dart/either.dart';
import 'package:location/src/data/models/position_response_model.dart';
import 'package:location/src/data/repositories/geolocation/interface/geolocation_repository_interface.dart';
import 'package:location/src/data/services/http/interface/http_interface.dart';
import 'package:location/src/data/utils/execute_with_catch.dart';
import 'package:location/src/ui/error/app_error.dart';

class GeolocationRepository extends IGeolocationRepository {
  final IHttpService _http;

  GeolocationRepository(this._http);

  @override
  Future<Either<AppError, PositionResponseModel>> getCurrentPosition() async {
    return executeWithCatch(() async {
      var response = await _http.get("http://ip-api.com/json");
      return PositionResponseModel.fromJson(response.data);
    });
  }
}
