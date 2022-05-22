import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/types.dart';

class CreateTicketTypeDto extends BaseDto {
  String title;
  String? description;
  int price;
  DateTime? availableTillDate;

  CreateTicketTypeDto({
    required this.title,
    required this.description,
    required this.price,
    required this.availableTillDate,
  });

  @override
  Json toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'availableTillDate': availableTillDate?.toIso8601String(),
    };
  }
}
