import 'package:flutter/material.dart';
import 'package:location/src/ui/ui_helpers/app_colors.dart';

enum AlertType {
  error._(
      icon: Icons.error,
      backgroundColor: AppColors.redTwo,
      iconColor: AppColors.redOne,
      textColor: AppColors.monoWhite),
  success._(
      icon: Icons.check_circle,
      backgroundColor: AppColors.greenTwo,
      iconColor: AppColors.greenOne,
      textColor: AppColors.monoWhite),
  warning._(
      icon: Icons.warning,
      backgroundColor: AppColors.yellowOne,
      iconColor: AppColors.yellowTwo,
      textColor: AppColors.monoBlack);

  const AlertType._({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
}
