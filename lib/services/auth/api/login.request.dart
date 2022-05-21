import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/auth/dto/login.dto.dart';
import 'package:socialife/services/auth/response/tokens.response.dart';

Future<TokensResponse> login(LoginDto dto) async {
  final json = await request(
    route: getLoginRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
    skipAuth: true,
  );

  return TokensResponse(json);
}
