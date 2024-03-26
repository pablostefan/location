import 'package:flutter/cupertino.dart';
import 'package:location/src/ui/ui_helpers/app_colors.dart';
import 'package:location/src/ui/ui_helpers/app_dimens.dart';
import 'package:location/src/ui/ui_helpers/app_opacity.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Widget progressIndicator;

  const LoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
    this.progressIndicator = const CupertinoActivityIndicator(color: AppColors.monoBlack, radius: AppDimens.xxxs),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      Visibility(visible: isLoading, child: Container(color: AppColors.monoBlack.withOpacity(AppOpacity.dotOne))),
      Visibility(visible: isLoading, child: Center(child: progressIndicator)),
    ]);
  }
}
