import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/types.dart';

class UpdateEventDto extends BaseDto {
  String? title;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  String? locationName;
  String? locationRef;
  String? longitude;
  String? latitude;
  EventCategory? category;
  bool isCanceled;

  UpdateEventDto({
    required this.title,
    required this.description,
    required this.startDate,
    this.endDate,
    this.locationName,
    this.locationRef,
    this.longitude,
    this.latitude,
    this.category,
    this.isCanceled = false,
  });

  @override
  Json toJson() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'locationName': locationName,
      'locationRef': locationRef,
      'longitude': longitude,
      'latitude': latitude,
      'category': category != null ? getEventCategoryString(category!) : null,
      'isCanceled': isCanceled ? isCanceled : null,
    };
  }
}
