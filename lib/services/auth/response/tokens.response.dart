import 'package:socialife/types.dart';

class TokensResponse {
  late String accessToken;

  TokensResponse(Json json) {
    accessToken = json['accessToken'];
  }
}
