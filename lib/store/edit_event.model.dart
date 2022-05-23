import 'package:socialife/services/event/api/update_event.request.dart';
import 'package:socialife/services/event/dto/update_event.dto.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/store/organization_event.model.dart';

class UpdateEventArgs {
  final UpdateEventDto dto;
  final int id;
  UpdateEventArgs(this.id, this.dto);
}

class EditEventModelSingleton
    extends BaseApiMutationModel<UpdateEventArgs, Event> {
  EditEventModelSingleton()
      : super(
          mutateFn: (args) => updateEvent(args.id, args.dto),
        );

  @override
  void mutate(
    UpdateEventArgs payload, {
    Function(Event result)? onSuccess,
    Function(Object error)? onError,
  }) {
    return super.mutate(
      payload,
      onSuccess: (result) {
        OrganizationEventModel.invalidateList();
        OrganizationEventModel.invalidateItem(payload.id);
        onSuccess?.call(result);
      },
      onError: onError,
    );
  }
}
