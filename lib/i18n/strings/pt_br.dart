import 'package:location/i18n/translate.dart';

class PtBR implements Strings {
  @override
  String get genericError => "Ops... Ocorreu um erro.";

  @override
  String get genericErrorClient => "Ocorreu um erro na sua solicitação.";

  @override
  String get genericErrorServer => "Por favor, tente novamente mais tarde.";

  @override
  String get authError => "Sessão expirada. Faça login para continuar.";

  @override
  String get locationError => "Error ao obter a localização.";

  @override
  String get checkLocationError => "Error ao verificar a localização.";

  @override
  String get gpsMap => "GPS Mapa";
}
