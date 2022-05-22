import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/types.dart';

class CreateOrganizationProfileDto extends BaseDto {
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

  @override
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
