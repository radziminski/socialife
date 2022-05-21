import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/auth/dto/create_user_profile.dto.dart';
import 'package:socialife/services/auth/entity/user.entity.dart';

Future<User> createUserProfile(CreateUserProfileDto dto) async {
  final json = await request(
    route: getUserProfileRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
  );

  return User(json);
}
