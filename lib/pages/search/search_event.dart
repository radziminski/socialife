import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/utils/date.utils.dart';
import 'package:socialife/widgets/event/event_card.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/event_provider.dart';
import 'package:socialife/widgets/ticket/ticket_type_card.dart';

class SearchEventPage extends StatelessWidget {
  const SearchEventPage({
    Key? key,
    @PathParam() required this.eventId,
  }) : super(key: key);

  final int eventId;

  String getImageLink(Event event) {
    if (event.externalImageUrls != null &&
        event.externalImageUrls!.isNotEmpty) {
      return event.externalImageUrls!.first;
    }

    return mockImages[event.id % mockImages.length];
  }

  @override
  Widget build(BuildContext context) {
    return EventProvider(
      key: Key('$eventId-SearchEventPage'),
      isItemProvider: true,
      itemId: eventId,
      builder: (context, model, _) => model.items[eventId] != null
          ? PageWrapper(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      GestureDetector(
                        onVerticalDragEnd: (details) {
                          final velocity = details.primaryVelocity ?? 0;
                          if (velocity > 800) {
                            AutoRouter.of(context).pop();
                          }
                        },
                        child: CachedNetworkImage(
                          imageUrl: getImageLink(model.items[eventId]!),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PagePadding(
                        child: Text(
                          model.items[eventId]!.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (model.items[eventId]!.locationName != null)
                        PagePadding(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 14,
                                color: kGray60Color,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Flexible(
                                child: Text(
                                  model.items[eventId]!.locationName!,
                                  style: const TextStyle(
                                    color: kGray60Color,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (model.items[eventId]!.description != null)
                        PagePadding(
                          child: Text(
                            model.items[eventId]!.description!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: kGray60Color,
                            ),
                          ),
                        ),
                      const SizedBox(height: 8),
                      if (model.items[eventId]!.category != null)
                        PagePadding(
                          child: Text(
                            'Category: ' +
                                getEventCategoryString(
                                    model.items[eventId]!.category),
                            style: const TextStyle(
                              fontSize: 14,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      const SizedBox(height: 4),
                      PagePadding(
                        child: Text(
                          'Start: ' +
                              formatDateTime(model.items[eventId]!.startDate)
                                  .toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (model.items[eventId]!.endDate != null)
                        PagePadding(
                          child: Text(
                            'End: ' +
                                formatDateTime(model.items[eventId]!.endDate)
                                    .toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      const PagePadding(
                        child: Text(
                          'Tickets:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (final type in (model.items[eventId]!.ticketTypes))
                        PagePadding(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TicketTypeCard(
                            ticketType: type,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(BuyTicketRoute(ticketTypeId: type.id));
                            },
                          ),
                        )),
                      if (model.items[eventId]!.ticketTypes.isEmpty)
                        const PagePadding(
                          child: SizedBox(
                            height: 100,
                            child: InfoMessage(
                              icon: Icons.local_activity,
                              message:
                                  'There are no tickets available for this event yet.',
                            ),
                          ),
                        ),
                    ],
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: IconButton(
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: kWhiteColor,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(),
    );
  }
}
