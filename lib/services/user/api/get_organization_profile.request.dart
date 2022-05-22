import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/user/entity/organization_profile.entity.dart';

Future<OrganizationProfile> getOrganizationProfile() async {
  final json = await request(
    route: getUserProfileRoute(),
  );

  return OrganizationProfile(json);
}
