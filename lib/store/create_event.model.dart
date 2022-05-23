import 'package:socialife/services/event/api/create_event.request.dart';
import 'package:socialife/services/event/dto/create_event.dto.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/store/organization_event.model.dart';

class CreateEventModelSingleton
    extends BaseApiMutationModel<CreateEventDto, Event> {
  CreateEventModelSingleton()
      : super(
          mutateFn: createEvent,
        );

  @override
  void mutate(
    CreateEventDto payload, {
    Function(Event result)? onSuccess,
    Function(Object error)? onError,
  }) {
    return super.mutate(
      payload,
      onSuccess: (result) {
        OrganizationEventModel.invalidateList();
        onSuccess?.call(result);
      },
      onError: onError,
    );
  }
}
