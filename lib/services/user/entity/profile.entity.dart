import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/types.dart';

class Profile extends BaseEntity {
  late String email;
  late String firstName;
  late String? lastName;
  late String region;

  Profile(Json json) : super(json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    region = json['region'];
  }
}
