import 'package:socialife/locator.dart';
import 'package:socialife/services/event/api/get_event.request.dart';
import 'package:socialife/services/event/api/get_my_events.request.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/store/base_api.model.dart';

class OrganizationEventModelSingleton extends BaseApiModel<Event> {
  OrganizationEventModelSingleton()
      : super(
          fetchItem: getEvent,
          fetchList: getMyEvents,
        );
}

// ignore: non_constant_identifier_names
final OrganizationEventModel = locator<OrganizationEventModelSingleton>();
