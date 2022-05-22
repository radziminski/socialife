import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';
import 'package:socialife/services/user/entity/profile.entity.dart';
import 'package:socialife/types.dart';

class Ticket extends BaseEntity {
  late String? secret;
  late Profile? owner;
  late TicketType type;

  Ticket(Json json) : super(json) {
    secret = json['secret'];
    owner = json['owner'] != null ? Profile(json['owner']) : null;
    type = TicketType(json['type']);
  }
}
