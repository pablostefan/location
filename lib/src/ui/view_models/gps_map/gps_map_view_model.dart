import 'package:location/src/ui/models/position_model.dart';

class GPSMapViewModel {
  PositionModel position = PositionModel.cloudWalk();

  GPSMapViewModel copyWith({PositionModel? position}) {
    return GPSMapViewModel()..position = position ?? this.position;
  }
}
