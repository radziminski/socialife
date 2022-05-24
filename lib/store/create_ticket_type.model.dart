import 'package:socialife/services/ticket/api/create_ticket_type.request.dart';
import 'package:socialife/services/ticket/dto/create_ticket_type.dto.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/store/organization_event.model.dart';

class CreateTicketTypeArgs {
  final int eventId;
  final CreateTicketTypeDto dto;

  CreateTicketTypeArgs({
    required this.eventId,
    required this.dto,
  });
}

class CreateTicketTypeModelSingleton
    extends BaseApiMutationModel<CreateTicketTypeArgs, TicketType> {
  CreateTicketTypeModelSingleton()
      : super(
          mutateFn: (args) => createTicketType(args.eventId, args.dto),
        );

  @override
  void mutate(
    CreateTicketTypeArgs payload, {
    Function(TicketType result)? onSuccess,
    Function(Object error)? onError,
  }) {
    return super.mutate(
      payload,
      onSuccess: (result) {
        OrganizationEventModel.invalidateItem(payload.eventId);
        onSuccess?.call(result);
      },
      onError: onError,
    );
  }
}
