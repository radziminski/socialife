import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/auth/entity/user.entity.dart';

Future<User> getMe() async {
  final json = await request(
    route: getUserProfileRoute(),
  );

  return User(json);
}
