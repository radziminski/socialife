import 'package:socialife/types.dart';

class CreateUserProfileDto {
  String firstName;
  String lastName;
  String region;

  CreateUserProfileDto({
    required this.firstName,
    required this.lastName,
    required this.region,
  });

  Json toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'region': region,
    };
  }
}
