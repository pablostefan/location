import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:location/i18n/translate.dart';
import 'package:location/src/ui/stores/gps_map/gps_map_store.dart';
import 'package:location/src/ui/ui_helpers/app_colors.dart';
import 'package:location/src/ui/ui_helpers/app_typography.dart';
import 'package:location/src/ui/view_models/gps_map/gps_map_view_model.dart';
import 'package:location/src/ui/widgets/google_map_widget.dart';
import 'package:location/src/ui/widgets/scoped_listener_widget.dart';

class GPSMapPage extends StatefulWidget {
  const GPSMapPage({super.key});

  @override
  State<GPSMapPage> createState() => _GPSMapPageState();
}

class _GPSMapPageState extends State<GPSMapPage> {
  final GPSMapStore _store = GetIt.I.get<GPSMapStore>();

  @override
  Widget build(BuildContext context) {
    return ScopedListenerWidget<GPSMapStore, GPSMapViewModel>(
        store: _store,
        child: Scaffold(
            backgroundColor: AppColors.monoWhite,
            appBar: AppBar(title: Text(Translate.strings.gpsMap).bodySmallMedium()),
            body: ScopedBuilder<GPSMapStore, GPSMapViewModel>(
                store: _store,
                onLoading: (_) => const Center(child: CircularProgressIndicator()),
                onState: (_, state) => GoogleMapWidget(onMapCreated: _store.onMapCreated, position: state.position))));
  }
}
