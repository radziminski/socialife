import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/types.dart';

class TicketType extends BaseEntity {
  late String title;
  late String? description;
  late int price;
  late bool isAvailable;
  late DateTime? availableTillDate;
  late Event? event;

  TicketType(Json json) : super(json) {
    title = json['title'];
    description = json['description'];
    isAvailable = json['isAvailable'];
    price = json['price'];
    availableTillDate = parseNullableDate(json['availableTillDate']);
    event = json['event'] != null ? Event(json['event']) : null;
  }
}
