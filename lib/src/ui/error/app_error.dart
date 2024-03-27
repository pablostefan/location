import 'package:dio/dio.dart';
import 'package:location/i18n/translate.dart';
import 'package:location/src/ui/error/alert_type.dart';

class AppError {
  final String message;
  final AlertType type;

  const AppError({required this.message, this.type = AlertType.error});

  AppError.fromDioException(DioException error)
      : type = AlertType.error,
        message = _message(error.response?.statusCode ?? 0);

  AppError.locationError()
      : type = AlertType.error,
        message = Translate.strings.locationError;

  AppError.checkLocationError()
      : type = AlertType.error,
        message = Translate.strings.checkLocationError;

  AppError.getPositionError()
      : type = AlertType.error,
        message = Translate.strings.locationError;

  AppError.empty()
      : type = AlertType.error,
        message = "";

  static String _message(int code) {
    if (code == 401) return Translate.strings.authError;
    if (code >= 400) return Translate.strings.genericErrorClient;
    if (code >= 500) return Translate.strings.genericErrorClient;

    return Translate.strings.genericError;
  }
}
