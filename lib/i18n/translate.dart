import 'package:location/i18n/strings/pt_br.dart';

sealed class Translate {
  static Strings strings = _getType();

  static T _getType<T extends Strings>() => PtBR() as T;
}

abstract class Strings {
  String get genericError;

  String get genericErrorClient;

  String get genericErrorServer;

  String get authError;

  String get locationError;

  String get checkLocationError;

  String get gpsMap;

  String get apiMap;
}
