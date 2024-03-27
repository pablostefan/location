import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/i18n/translate.dart';
import 'package:location/src/ui/stores/gps_map/gps_map_store.dart';
import 'package:location/src/ui/view_models/gps_map/gps_map_view_model.dart';
import 'package:location/src/ui/widgets/scaffold_widget.dart';

class GPSMapPage extends StatefulWidget {
  const GPSMapPage({super.key});

  @override
  State<GPSMapPage> createState() => _GPSMapPageState();
}

class _GPSMapPageState extends State<GPSMapPage> {
  final GPSMapStore _store = GetIt.I.get<GPSMapStore>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget<GPSMapStore, GPSMapViewModel>(
        store: _store,
        appBar: AppBar(title: Text(Translate.strings.gpsMap)),
        body: SafeArea(
            child: TripleBuilder<GPSMapStore, GPSMapViewModel>(
                store: _store,
                builder: (_, triple) => Visibility(
                    visible: triple.state.position != null,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: GoogleMap(
                        myLocationEnabled: true,
                        zoomControlsEnabled: true,
                        mapType: MapType.normal,
                        onMapCreated: _store.onMapCreated,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(triple.state.position?.latitude ?? 0, triple.state.position?.longitude ?? 0),
                            zoom: 18))))));
  }
}
