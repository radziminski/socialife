import 'package:socialife/services/ticket/api/update_ticket_type.request.dart';
import 'package:socialife/services/ticket/dto/update_ticket_type.dto.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/store/organization_event.model.dart';

class UpdateTicketTypeArgs {
  final int eventId;
  final int ticketTypeId;
  final UpdateTicketTypeDto dto;

  UpdateTicketTypeArgs({
    required this.eventId,
    required this.ticketTypeId,
    required this.dto,
  });
}

class UpdateTicketTypeModelSingleton
    extends BaseApiMutationModel<UpdateTicketTypeArgs, TicketType> {
  UpdateTicketTypeModelSingleton()
      : super(
          mutateFn: (args) =>
              editTicketType(args.eventId, args.ticketTypeId, args.dto),
        );

  @override
  void mutate(
    UpdateTicketTypeArgs payload, {
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
