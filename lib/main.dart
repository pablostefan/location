import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:location/src/app/app_dependencies.dart';
import 'package:location/src/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  AppDependencies.configure();
  runApp(const AppWidget());
}
