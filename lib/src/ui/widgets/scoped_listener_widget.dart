import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:location/src/ui/error/app_error.dart';
import 'package:location/src/ui/widgets/alert_widget.dart';
import 'package:oktoast/oktoast.dart';

class ScopedListenerWidget<TStore extends Store<TState>, TState extends Object> extends StatelessWidget {
  final TStore store;
  final Widget child;

  const ScopedListenerWidget({super.key, required this.store, required this.child});

  void _onError(BuildContext context, dynamic error) {
    if (error is AppError) showToastWidget(dismissOtherToast: true, context: context, AlertWidget(alert: error));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedListener<TStore, TState>(store: store, onError: _onError, child: child);
  }
}
