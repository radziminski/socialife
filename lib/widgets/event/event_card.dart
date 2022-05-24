import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/styles/colors.dart';

final List<String> mockImages = [
  'https://gfx.rozrywka.radiozet.pl/var/radiozetsg/storage/images/muzyka/fest-festival-dla-zaszczepionych-organizatorzy-odpieraja-ataki-nie-ma-wolnosci-bez-odpornosci/16366450-1-pol-PL/FEST-Festival-dla-zaszczepionych.-Organizatorzy-odpieraja-ataki-Nie-ma-wolnosci-bez-odpornosci_article.jpg',
  'https://www.neptunus.pl/wp-content/uploads/2018/11/Festivals-6.jpg',
  'https://muno.pl/wp-content/uploads/2021/03/67402947_10156846299089177_4958409086031888384_o-960x500.jpeg',
  'https://cdn.galleries.smcloud.net/t/galleries/gf-2BcT-eVyn-FbnT_polak-na-tomorrowland-2019-wystapi-z-wielkimi-gwiazdami-664x442.jpg',
  'https://pbs.twimg.com/media/CeeLxY9XEAAqI-_.jpg:large',
  'https://www.thedjrevolution.com/wp-content/uploads/2022/01/Tomorrowland-announces-pre-registration-2022.jpg',
  'https://l-isa-immersive.com/wp-content/uploads/2018/09/Tomorrowland_1.jpg',
];

const kCardHeight = 400.0;
const kCardWidth = 280.0;

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class EventCard extends StatefulWidget {
  final Event event;

  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  String image = '';

  String getImageLink() {
    if (widget.event.externalImageUrls != null &&
        widget.event.externalImageUrls!.isNotEmpty) {
      return widget.event.externalImageUrls!.first;
    }

    return mockImages[widget.event.id % mockImages.length];
  }

  @override
  void initState() {
    image = getImageLink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(
        EventRoute(eventId: widget.event.id),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, image) => Container(
                height: kCardHeight,
                width: kCardWidth,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: kPrimaryDarkColor,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      begin: FractionalOffset(0.0, 1.0),
                      end: FractionalOffset(0.5, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 3),
                            Text(
                              '${widget.event.startDate.day}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              months[widget.event.startDate.month - 1],
                              style: const TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.event.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (widget.event.locationName != null)
                      const SizedBox(height: 4),
                    if (widget.event.locationName != null)
                      Row(
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
                              widget.event.locationName!,
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
                    const SizedBox(height: 6),
                    if (widget.event.description != null)
                      Flexible(
                        child: Text(
                          widget.event.description!,
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
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}
