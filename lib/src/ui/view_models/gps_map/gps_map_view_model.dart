import 'package:geolocator/geolocator.dart';

class GPSMapViewModel {
  Position? position;

  GPSMapViewModel copyWith({Position? position}) {
    return GPSMapViewModel()..position = position ?? this.position;
  }
}
