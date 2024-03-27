import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:location/i18n/translate.dart';
import 'package:location/src/ui/stores/api_map/api_map_store.dart';
import 'package:location/src/ui/ui_helpers/app_colors.dart';
import 'package:location/src/ui/ui_helpers/app_typography.dart';
import 'package:location/src/ui/view_models/api_map/api_map_view_model.dart';
import 'package:location/src/ui/widgets/google_map_widget.dart';
import 'package:location/src/ui/widgets/scoped_listener_widget.dart';

class APIMapPage extends StatefulWidget {
  const APIMapPage({super.key});

  @override
  State<APIMapPage> createState() => _APIMapPageState();
}

class _APIMapPageState extends State<APIMapPage> {
  final APIMapStore _store = GetIt.I.get<APIMapStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedListenerWidget<APIMapStore, APIMapViewModel>(
        store: _store,
        child: Scaffold(
            backgroundColor: AppColors.monoWhite,
            appBar: AppBar(title: Text(Translate.strings.apiMap).bodySmallMedium()),
            body: ScopedBuilder<APIMapStore, APIMapViewModel>(
                store: _store,
                onLoading: (_) => const Center(child: CircularProgressIndicator()),
                onState: (_, state) => GoogleMapWidget(onMapCreated: _store.onMapCreated, position: state.position))));
  }
}
