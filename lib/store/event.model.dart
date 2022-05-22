import 'package:socialife/locator.dart';
import 'package:socialife/services/event/api/get_all_events.request.dart';
import 'package:socialife/services/event/api/get_event.request.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/store/base_api.model.dart';

class EventModelSingleton extends BaseApiModel<Event> {
  EventModelSingleton() : super(fetchItem: getEvent, fetchList: getAllEvents);
}

// ignore: non_constant_identifier_names
final EventModel = locator<EventModelSingleton>();
