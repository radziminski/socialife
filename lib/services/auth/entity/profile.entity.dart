import 'package:socialife/services/api/base_entity.dart';
import 'package:socialife/types.dart';

class Profile extends BaseEntity {
  late String firstName;
  late String? lastName;
  late String region;

  Profile(Json json) : super(json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    region = json['region'];
  }
}
