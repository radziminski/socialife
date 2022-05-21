import 'package:socialife/services/api/base_entity.dart';
import 'package:socialife/types.dart';

class OrganizationProfile extends BaseEntity {
  late String name;
  late String? description;
  late String? coverUrl;
  late String? website;
  late String region;
  late String? city;

  OrganizationProfile(Json json) : super(json) {
    name = json['name'];
    description = json['description'];
    coverUrl = json['coverUrl'];
    website = json['website'];
    region = json['region'];
    city = json['city'];
  }
}
