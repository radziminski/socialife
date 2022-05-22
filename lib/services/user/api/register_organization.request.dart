import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/user/dto/register.dto.dart';
import 'package:socialife/services/user/response/register.response.dart';

Future<RegisterResponse> registerOrganization(RegisterDto dto) async {
  final json = await request(
    route: getRegisterOrganizationRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
    skipAuth: true,
  );

  return RegisterResponse(json);
}
