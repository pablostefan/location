import 'package:location/src/ui/models/position_model.dart';

class APIMapViewModel {
  PositionModel position = PositionModel.cloudWalk();

  APIMapViewModel copyWith({PositionModel? position}) {
    return APIMapViewModel()..position = position ?? this.position;
  }
}
