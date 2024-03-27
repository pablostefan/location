import 'package:flutter_test/flutter_test.dart';
import 'package:location/src/data/models/position_response_model.dart';
import 'package:location/src/data/repositories/api_geolocation/api_geolocation_repository.dart';
import 'package:location/src/data/repositories/api_geolocation/interface/api_geolocation_repository_interface.dart';
import 'package:location/src/ui/error/app_error.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixtures_position_json.dart';
import '../mocks/http_service.dart';
import '../utils/type_method.dart';
import '../utils/utils_tests.dart';

void main() {
  group("API Geolocation Repository", () {
    AppError exception = AppError.empty();
    MockIHttpService httpMock = MockIHttpService();
    IAPIGeolocationRepository repository = APIGeolocationRepository(httpMock);
    test("Get Current Position.", () async {
      PositionResponseModel positionResponseModel = PositionResponseModel.empty();

      when(httpMock.get("http://ip-api.com/json")).thenAnswer((_) {
        return Future.value(UtilsTests.response(json: FixturePositionJson.position, methodType: TypeMethod.get));
      });

      var response = await repository.getCurrentPosition();
      response.fold((error) => exception = error, (success) => positionResponseModel = success);

      expect(exception.message, isEmpty, reason: "It should not generate errors.");
      expect(positionResponseModel, isA<PositionResponseModel>(), reason: "Should be a list of AddressModel type.");
      expect(positionResponseModel.city, "Montreal", reason: "Should be Montreal.");
      expect(positionResponseModel.query, "24.48.0.1", reason: "Should be 24.48.0.1.");
      expect(positionResponseModel.regionName, "Quebec", reason: "Should be Quebec.");
    });
  });
}
