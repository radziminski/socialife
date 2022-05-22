import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/user/entity/profile.entity.dart';

Future<Profile> getUserProfile() async {
  final json = await request(
    route: getUserProfileRoute(),
  );

  return Profile(json);
}
