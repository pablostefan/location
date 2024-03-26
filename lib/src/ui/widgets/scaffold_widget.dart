import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:location/src/ui/error/app_error.dart';
import 'package:location/src/ui/ui_helpers/app_colors.dart';
import 'package:location/src/ui/widgets/alert_widget.dart';
import 'package:location/src/ui/widgets/loading_widget.dart';
import 'package:oktoast/oktoast.dart';

class ScaffoldWidget<TStore extends BaseStore<TState>, TError extends Object, TState extends Object> extends StatelessWidget {
  final TStore store;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final Color backgroundColor;
  final double? progressIndicatorValue;
  final Widget? floatingActionButton;

  const ScaffoldWidget({
    super.key,
    required this.body,
    required this.store,
    this.progressIndicatorValue,
    this.backgroundColor = AppColors.monoWhite,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.floatingActionButton,
  });

  void _onError(BuildContext context, Triple<TState> triple) {
    if (triple.event == TripleEvent.error && triple.error is AppError) {
      showToastWidget(dismissOtherToast: true, context: context, AlertWidget(alert: triple.error as AppError));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TripleConsumer<TStore, TError, TState>(
        listener: _onError,
        store: store,
        builder: (_, triple) => LoadingWidget(
            isLoading: triple.isLoading,
            child: Scaffold(
                floatingActionButton: floatingActionButton,
                backgroundColor: backgroundColor,
                extendBody: extendBody,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                appBar: appBar,
                body: body,
                bottomNavigationBar: bottomNavigationBar,
                bottomSheet: bottomSheet)));
  }
}