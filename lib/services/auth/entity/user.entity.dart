import 'package:socialife/services/api/base_entity.dart';
import 'package:socialife/services/auth/entity/organization_profile.entity.dart';
import 'package:socialife/services/auth/entity/profile.entity.dart';
import 'package:socialife/types.dart';

enum UserRole {
  user,
  organization,
  admin,
}

class User extends BaseEntity {
  late String email;
  late UserRole role = UserRole.user;
  late Profile profile;
  late OrganizationProfile organizationProfile;

  User(Json json) : super(json) {
    email = json['email'];
    String roleString = json['role'];
    if (roleString == 'organization') {
      role = UserRole.organization;
      organizationProfile = OrganizationProfile(json['organizationProfile']);
    } else {
      role = UserRole.user;
      profile = Profile(json['profile']);
    }
  }
}
