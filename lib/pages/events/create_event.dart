import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/services/event/dto/create_event.dto.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/create_event.model.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/api_mutation_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: ListView(
        children: [
          const PageHeader(
            title: 'Create new Event',
            compact: true,
          ),
          const SizedBox(
            height: 24,
          ),
          PagePadding(
            child: ApiMutationProvider<CreateEventModelSingleton>(
              builder: (context, model, _) =>
                  ColumnWithSpacing(spacing: 16, children: [
                TextInput(
                  controller: titleController,
                  label: 'Title',
                  placeholder: 'Eg. Tomorrowland',
                ),
                TextInput(
                  controller: descriptionController,
                  label: 'Description (optional)',
                  placeholder: 'Eg. Best festival in the world',
                ),
                TextInput(
                  controller: locationController,
                  label: 'Location',
                  placeholder: 'Eg. Torwar, Warsaw',
                ),
                TextInput(
                  controller: titleController,
                  label: 'Start date',
                  placeholder: 'Eg. 01.01.2022',
                ),
                TextInput(
                  controller: titleController,
                  label: 'End date (optional)',
                  placeholder: 'Eg. 01.01.2023',
                ),
                TextInput(
                  controller: categoryController,
                  label: 'Category',
                  placeholder: 'electronic-music',
                ),
                const SizedBox(),
                if (model.isError)
                  ErrorCard(
                    error: model.error ?? const UnknownException(),
                    compact: true,
                  ),
                ButtonPrimary(
                  label: 'Submit',
                  isLoading: model.isLoading,
                  onPressed: () {
                    model.mutate(
                      CreateEventDto(
                        title: titleController.value.text,
                        description: descriptionController.value.text,
                        locationName: locationController.value.text,
                        startDate: DateTime.now(),
                        category: EventCategory.music,
                        longitude: "12",
                        latitude: "11",
                      ),
                      onSuccess: (_) {
                        AutoRouter.of(context).pop();
                      },
                    );
                  },
                  icon: Icons.send,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
