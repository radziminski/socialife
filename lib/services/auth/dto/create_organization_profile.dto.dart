import 'package:socialife/types.dart';

class CreateOrganizationProfileDto {
  String name;
  String? description;
  String region;
  String? city;
  String? website;
  String? coverUrl;

  CreateOrganizationProfileDto({
    required this.name,
    this.description,
    required this.region,
    this.city,
    this.website,
    this.coverUrl,
  });

  Json toJson() {
    return {
      'name': name,
      'description': description,
      'region': region,
      'city': city,
      'website': website,
      'coverUrl': coverUrl,
    };
  }
}
