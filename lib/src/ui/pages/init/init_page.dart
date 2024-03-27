import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:location/src/ui/assets/app_images.dart';
import 'package:location/src/ui/stores/init/init_store.dart';
import 'package:location/src/ui/ui_helpers/app_colors.dart';
import 'package:location/src/ui/widgets/scoped_listener_widget.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final InitStore _store = GetIt.I.get<InitStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store.checkLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedListenerWidget(
        store: _store,
        child: Scaffold(
            backgroundColor: AppColors.monoWhite,
            body: Center(child: SvgPicture.asset(key: const Key('cloudWalkSvg'), Vector.cloudWalk.svg))));
  }
}
