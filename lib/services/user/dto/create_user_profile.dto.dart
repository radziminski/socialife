import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/types.dart';

class CreateUserProfileDto extends BaseDto {
  String firstName;
  String lastName;
  String region;

  CreateUserProfileDto({
    required this.firstName,
    required this.lastName,
    required this.region,
  });

  @override
  Json toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'region': region,
    };
  }
}
