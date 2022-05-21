import 'package:socialife/services/auth/entity/user.entity.dart';
import 'package:socialife/services/auth/response/tokens.response.dart';
import 'package:socialife/types.dart';

class RegisterResponse {
  late User user;
  late TokensResponse tokens;

  RegisterResponse(Json json) {
    tokens = TokensResponse(json['accessToken']);
    user = User(json['user']);
  }
}
