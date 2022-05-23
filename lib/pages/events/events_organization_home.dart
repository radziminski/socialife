import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/event/event_horizontal_scroll.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class EventsOrganizationHomePage extends StatelessWidget {
  const EventsOrganizationHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: ListView(
        children: [
          const PageHeader(
            title: 'Events',
          ),
          const SizedBox(
            height: 16,
          ),
          PagePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome to SociaLife!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'On this page you can manage events belonging to you organization, create new ones or edit the existing ones.',
                  style: TextStyle(
                    color: kGray60Color,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const PagePadding(
            child: Text(
              'Organization events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: OrganizationEventProvider(
              key: const Key('EventsOrganizationHomePage-EventProvider'),
              isListProvider: true,
              builder: (context, model, _) =>
                  model.itemsList != null && model.itemsList!.isNotEmpty == true
                      ? EventHorizontalScroll(
                          events: model.itemsList,
                        )
                      : const Center(
                          child: InfoMessage(
                            icon: Icons.event,
                            message: 'You don\'t have any events yet',
                          ),
                        ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          PagePadding(
            child: ColumnWithSpacing(
              spacing: 24,
              children: [
                ButtonPrimary(
                  label: 'Create new Event',
                  onPressed: () {
                    AutoRouter.of(context).push(const CreateEventRoute());
                  },
                  icon: Icons.add_box_outlined,
                ),
                ButtonPrimary(
                  label: 'Edit event',
                  onPressed: () {},
                  icon: Icons.edit,
                ),
                ButtonPrimary(
                  label: 'Cancel event',
                  onPressed: () {},
                  icon: Icons.cancel_outlined,
                ),
                ButtonPrimary(
                  label: 'Delete event',
                  onPressed: () {},
                  icon: Icons.delete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
