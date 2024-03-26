import 'package:location/i18n/translate.dart';

class EnUs implements Strings {
  @override
  String get genericError => "Oops... An error occurred.";

  @override
  String get genericErrorClient => "An error occurred in your request.";

  @override
  String get genericErrorServer => "Please try again later.";

  @override
  String get authError => "Session expired. Log in to continue.";
}
