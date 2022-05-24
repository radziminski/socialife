import 'package:flutter/material.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/utils/date.utils.dart';

class TicketTypeCard extends StatelessWidget {
  final TicketType ticketType;
  final Function()? onTap;
  final bool canEdit;
  const TicketTypeCard({
    Key? key,
    required this.ticketType,
    this.onTap,
    this.canEdit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: kPrimaryDarkColor,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ticketType.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      if (ticketType.description != null)
                        Text(
                          ticketType.description!,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      const SizedBox(height: 6),
                      Text('Price: ${ticketType.price}\$',
                          style: const TextStyle(
                            fontSize: 14,
                          )),
                      if (ticketType.availableTillDate != null)
                        const SizedBox(
                          height: 4,
                        ),
                      if (ticketType.availableTillDate != null)
                        Text(
                          'Available till: \n${formatDateTime(ticketType.availableTillDate)}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                kWhiteColor.withOpacity(0.15))),
                        onPressed: onTap,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              canEdit
                                  ? Icons.edit
                                  : Icons.shopping_cart_checkout,
                              color: kWhiteColor,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              canEdit ? 'Edit' : 'Buy',
                              style: const TextStyle(
                                color: kWhiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 50,
          top: -6,
          child: Container(
            width: 20,
            height: 15,
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          right: 50,
          bottom: -6,
          child: Container(
            width: 20,
            height: 15,
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
