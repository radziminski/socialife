import 'package:socialife/services/event/api/unlike_event.request.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/store/event.model.dart';

class UnlikeEventModelSingleton extends BaseApiMutationModel<int, Event> {
  UnlikeEventModelSingleton()
      : super(
          mutateFn: unlikeEvent,
        );

  @override
  void mutate(
    int payload, {
    Function(Event result)? onSuccess,
    Function(Object error)? onError,
  }) {
    return super.mutate(
      payload,
      onSuccess: (result) {
        EventModel.invalidateList();
        EventModel.invalidateItem(payload);
        onSuccess?.call(result);
      },
      onError: onError,
    );
  }
}
