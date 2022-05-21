import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/auth/dto/register.dto.dart';
import 'package:socialife/services/auth/response/register.response.dart';

Future<RegisterResponse> registerUser(RegisterDto dto) async {
  final json = await request(
    route: getRegisterRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
    skipAuth: true,
  );

  return RegisterResponse(json);
}