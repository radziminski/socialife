import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/services/user/entity/organization_profile.entity.dart';
import 'package:socialife/services/user/entity/profile.entity.dart';
import 'package:socialife/types.dart';

enum UserRole {
  user,
  organization,
  admin,
}

class User extends BaseEntity {
  late String email;
  late UserRole role = UserRole.user;
  Profile? profile;
  OrganizationProfile? organizationProfile;

  User(Json json) : super(json) {
    email = json['email'];
    String roleString = json['role'];
    if (roleString == 'organization') {
      role = UserRole.organization;
      organizationProfile = json['organizationProfile'] != null
          ? OrganizationProfile(json['organizationProfile'])
          : null;
    } else {
      role = UserRole.user;
      profile = json['profile'] != null ? Profile(json['profile']) : null;
    }
  }
}
