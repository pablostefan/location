import 'package:flutter/material.dart';
import 'package:location/src/ui/error/app_error.dart';
import 'package:location/src/ui/ui_helpers/app_colors.dart';
import 'package:location/src/ui/ui_helpers/app_dimens.dart';
import 'package:location/src/ui/ui_helpers/app_opacity.dart';
import 'package:location/src/ui/ui_helpers/app_typography.dart';
import 'package:oktoast/oktoast.dart';

class AlertWidget extends StatelessWidget {
  final AppError alert;

  const AlertWidget({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => dismissAllToast(showAnim: true),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimens.xxxs),
            width: double.infinity,
            height: AppDimens.sm,
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.xxxs),
            decoration: BoxDecoration(
                color: alert.type.backgroundColor,
                borderRadius: BorderRadius.circular(AppDimens.nano),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.monoBlack.withOpacity(AppOpacity.oneThird),
                      offset: const Offset(AppDimens.atto, AppDimens.atto),
                      blurRadius: AppDimens.femto)
                ]),
            child: Row(children: [
              Container(
                  width: AppDimens.xxxs,
                  height: AppDimens.xxxs,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(AppDimens.femto),
                  decoration: BoxDecoration(
                      color: alert.type.iconColor,
                      borderRadius: BorderRadius.circular(AppDimens.nano),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.monoBlack.withOpacity(AppOpacity.dotOne),
                            offset: const Offset(AppDimens.none, AppDimens.atto),
                            blurRadius: AppDimens.atto)
                      ]),
                  child: Icon(alert.type.icon, color: alert.type.iconColor, size: AppDimens.micro)),
              Padding(
                  padding: const EdgeInsets.only(left: AppDimens.nano),
                  child: Text(alert.message).bodySmallMedium().color(alert.type.textColor))
            ])));
  }
}
