import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/types.dart';

class LoginDto extends BaseDto {
  String email;
  String password;

  LoginDto({required this.email, required this.password});

  @override
  Json toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
