import 'package:flutter/material.dart';
import 'package:location/src/app/app_dependencies.dart';
import 'package:location/src/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencies.configure();
  runApp(const AppWidget());
}
