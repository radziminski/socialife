import 'package:socialife/services/event/api/delete_event.request.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/store/organization_event.model.dart';

class DeleteEventModelSingleton extends BaseApiMutationModel<int, void> {
  DeleteEventModelSingleton()
      : super(
          mutateFn: deleteEvent,
        );

  @override
  void mutate(
    int payload, {
    Function(void)? onSuccess,
    Function(Object error)? onError,
  }) {
    return super.mutate(
      payload,
      onSuccess: (result) {
        OrganizationEventModel.invalidateList();
        OrganizationEventModel.invalidateItem(payload);
        onSuccess?.call(null);
      },
      onError: onError,
    );
  }
}
