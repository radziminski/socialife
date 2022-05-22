import 'package:socialife/services/user/entity/user.entity.dart';
import 'package:socialife/services/user/response/tokens.response.dart';
import 'package:socialife/types.dart';

class RegisterResponse {
  late User user;
  late TokensResponse tokens;

  RegisterResponse(Json json) {
    tokens = TokensResponse(json['tokens']);
    user = User(json['user']);
  }
}
