import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/event/event_card.dart';

class EventHorizontalCard extends StatefulWidget {
  final Event event;
  final Function? onTap;

  const EventHorizontalCard({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);

  @override
  State<EventHorizontalCard> createState() => _EventHorizontalCardState();
}

class _EventHorizontalCardState extends State<EventHorizontalCard> {
  String getImageLink() {
    if (widget.event.externalImageUrls != null &&
        widget.event.externalImageUrls!.isNotEmpty) {
      return widget.event.externalImageUrls!.first;
    }

    return mockImages[widget.event.id % mockImages.length];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: getImageLink(),
              imageBuilder: (context, image) => Container(
                height: 120,
                width: double.infinity,
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
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.7, 0.0),
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
                      width: 35,
                      height: 35,
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
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              months[widget.event.startDate.month - 1],
                              style: const TextStyle(fontSize: 6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.event.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                            size: 12,
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
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
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
