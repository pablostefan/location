import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:location/src/app/app_router.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
        position: ToastPosition.top,
        textPadding: EdgeInsets.zero,
        dismissOtherOnShow: true,
        child: MaterialApp.router(
            title: 'gps_location',
            locale: const Locale('pt', 'BR'),
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: const [Locale('pt', 'BR')],
            routerConfig: AppRouter.instance,
            debugShowCheckedModeBanner: false));
  }
}
