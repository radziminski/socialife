import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/services/ticket/dto/update_ticket_type.dto.dart';
import 'package:socialife/types.dart';

class CreateTicketTypeDto extends BaseDto {
  String title;
  String? description;
  int price;
  DateTime? availableTillDate;

  CreateTicketTypeDto({
    required this.title,
    this.description,
    required this.price,
    this.availableTillDate,
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

  UpdateTicketTypeDto toUpdateTicketTypeDto() {
    return UpdateTicketTypeDto(
      title: title,
      description: description,
      price: price,
      availableTillDate: availableTillDate,
    );
  }
}
