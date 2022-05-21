import 'package:socialife/services/auth/dto/login.dto.dart';
import 'package:socialife/types.dart';

class ChangePasswordDto extends LoginDto {
  String newPassword;
  ChangePasswordDto(
      {required String email,
      required String password,
      required this.newPassword})
      : super(email: email, password: password);

  @override
  Json toJson() {
    return {
      ...super.toJson(),
      'newPassword': newPassword,
    };
  }
}
