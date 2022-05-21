import 'package:socialife/types.dart';

class LoginDto {
  String email;
  String password;

  LoginDto({required this.email, required this.password});

  Json toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
