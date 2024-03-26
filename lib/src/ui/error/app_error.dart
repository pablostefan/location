import 'package:dio/dio.dart';
import 'package:location/i18n/translate.dart';
import 'package:location/src/ui/error/alert_type.dart';

class AppError {
  final String message;
  final AlertType type;

  AppError({required this.message, this.type = AlertType.error});

  AppError.fromDioException(DioException error)
      : type = AlertType.error,
        message = _message(error.response?.statusCode ?? 0);

  static String _message(int code) {
    if (code == 401) return Translate.strings.authError;
    if (code >= 400) return Translate.strings.genericErrorClient;
    if (code >= 500) return Translate.strings.genericErrorClient;

    return Translate.strings.genericError;
  }
}
