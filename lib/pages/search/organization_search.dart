import 'package:flutter/material.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/widgets/event/event_horizontal_card.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class OrganizationSearchPage extends StatefulWidget {
  const OrganizationSearchPage({Key? key}) : super(key: key);

  @override
  State<OrganizationSearchPage> createState() => _OrganizationSearchPageState();
}

class _OrganizationSearchPageState extends State<OrganizationSearchPage> {
  TextEditingController searchController = TextEditingController();

  List<Event>? filterEvents(List<Event>? allEvents) {
    if (allEvents == null) return null;
    final searchValue = searchController.text.toLowerCase();

    if (searchValue == '') {
      return allEvents;
    }

    return allEvents
        .where((element) =>
            element.title.toLowerCase().trim().contains(searchValue) ||
            (element.description != null &&
                element.description!
                    .toLowerCase()
                    .trim()
                    .contains(searchValue)) ||
            (element.locationName != null &&
                element.locationName!
                    .toLowerCase()
                    .trim()
                    .contains(searchValue)) ||
            (getEventCategoryString(element.category).contains(searchValue)))
        .toList();
  }

  void onType() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(onType);
  }

  @override
  void dispose() {
    searchController.removeListener(onType);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(title: 'Search'),
          const SizedBox(
            height: 16,
          ),
          PagePadding(
            child: Column(
              children: [
                TextInput(
                  controller: searchController,
                  label: 'Search your events',
                  placeholder: 'Eg. Tomorrowland',
                ),
              ],
            ),
          ),
          Expanded(
            child: PagePadding(
              child: OrganizationEventProvider(
                isListProvider: true,
                key: const Key('OrganizationSearchPage-EventsList'),
                builder: (context, model, _) => RefreshIndicator(
                  onRefresh: () async {
                    model.invalidateList();
                  },
                  child: ListView(
                    children: [
                      if (model.itemsList != null &&
                          model.itemsList!.isNotEmpty)
                        ...(filterEvents(model.itemsList)
                                ?.map((event) =>
                                    EventHorizontalCard(event: event))
                                .toList() ??
                            [])
                      else
                        const SizedBox(
                          height: 500,
                          child: InfoMessage(
                            message:
                                'There are no events matching searched value',
                            icon: Icons.no_drinks_sharp,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
