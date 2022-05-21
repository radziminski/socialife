import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/auth/dto/create_organization_profile.dto.dart';
import 'package:socialife/services/auth/entity/user.entity.dart';

Future<User> createOrganizationProfile(CreateOrganizationProfileDto dto) async {
  final json = await request(
    route: getUserProfileRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
  );

  return User(json);
}
