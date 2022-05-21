import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/auth/dto/change_password.dto.dart';

Future<void> changePassword(ChangePasswordDto dto) async {
  await request(
    route: getChangePasswordRoute(),
    method: RequestMethod.patch,
    payload: dto.toJson(),
  );
}
