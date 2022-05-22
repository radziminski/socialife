import 'package:socialife/services/user/dto/login.dto.dart';

class RegisterDto extends LoginDto {
  RegisterDto({
    required String email,
    required String password,
  }) : super(email: email, password: password);
}
