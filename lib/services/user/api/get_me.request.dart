import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/user/entity/user.entity.dart';

Future<User> getMe() async {
  final json = await request(
    route: getUserRoute(),
  );

  return User(json);
}
