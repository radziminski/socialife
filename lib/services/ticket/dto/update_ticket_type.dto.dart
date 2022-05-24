import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/types.dart';

class UpdateTicketTypeDto extends BaseDto {
  String? title;
  String? description;
  int? price;
  DateTime? availableTillDate;
  bool? isAvailable;

  UpdateTicketTypeDto({
    this.title,
    this.description,
    this.price,
    this.availableTillDate,
    this.isAvailable,
  });

  @override
  Json toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'availableTillDate': availableTillDate?.toIso8601String(),
      'isAvailable': isAvailable,
    };
  }
}
