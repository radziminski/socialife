import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/types.dart';

class ValidateTicketDto extends BaseDto {
  late int ticketTypeId;
  late int ticketId;
  late String ticketSecret;

  ValidateTicketDto({
    required this.ticketTypeId,
    required this.ticketId,
    required this.ticketSecret,
  });

  @override
  Json toJson() {
    return {
      'ticketTypeId': ticketTypeId,
      'ticketId': ticketId,
      'ticketSecret': ticketSecret,
    };
  }
}
