import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:location/src/ui/stores/init/init_store.dart';
import 'package:location/src/ui/widgets/scaffold_widget.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final InitStore _store = GetIt.I.get<InitStore>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget<InitStore, bool>(
        store: _store,
        body: Center(
            child: TripleBuilder<InitStore, bool>(
                store: _store,
                builder: (_, triple) => AnimatedAlign(
                    onEnd: () => _store.openNextPage(context),
                    alignment: triple.state ? Alignment.topCenter : Alignment.bottomCenter,
                    duration: Durations.medium3,
                    child: const Icon(Icons.gps_not_fixed)))));
  }
}
