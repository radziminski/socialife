import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/event/event_horizontal_card.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';

Future<Event?> showEventPicker(BuildContext context) {
  return showDialog<Event?>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 120,
        ),
        backgroundColor: kBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Choose event:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Transform.translate(
                    offset: const Offset(12, 0),
                    child: IconButton(
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                      ),
                      splashRadius: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 2),
              Expanded(
                child: OrganizationEventProvider(
                  key: const Key('EventPicker-EventsList'),
                  builder: (context, model, _) => ListView(
                    children: [
                      ...model.itemsList?.map(
                            (event) => EventHorizontalCard(
                              event: event,
                              onTap: () {
                                AutoRouter.of(context).pop(event);
                              },
                            ),
                          ) ??
                          [],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
