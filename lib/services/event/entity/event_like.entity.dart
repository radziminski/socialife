import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/services/user/entity/profile.entity.dart';
import 'package:socialife/types.dart';

class EventLike extends BaseEntity {
  late Profile user;

  EventLike(Json json) : super(json) {
    user = Profile(json['user']);
  }
}
