import 'package:flutter/material.dart';
import 'package:socialife/services/event/dto/create_event.dto.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/inputs/date_input.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';

class EventForm extends StatefulWidget {
  final bool isSubmitError;
  final bool isSubmitting;
  final BaseException? submitError;
  final Function(CreateEventDto) onSubmit;
  final CreateEventDto? initialValues;

  const EventForm({
    Key? key,
    required this.onSubmit,
    this.isSubmitError = false,
    this.submitError,
    this.isSubmitting = false,
    this.initialValues,
  }) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController coverImageController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  bool isTitleError = false;
  bool isDescriptionError = false;
  bool isStartDateError = false;

  @override
  void initState() {
    super.initState();
    final initialValues = widget.initialValues;
    if (initialValues != null) {
      titleController.text = initialValues.title;
      descriptionController.text = initialValues.description;
      locationController.text = initialValues.locationName ?? '';
      categoryController.text =
          getEventCategoryString(initialValues.category ?? EventCategory.music);
      startDate = initialValues.startDate;
      endDate = initialValues.endDate;
      coverImageController.text = initialValues.externalImageUrls != null &&
              initialValues.externalImageUrls!.isNotEmpty
          ? initialValues.externalImageUrls!.first
          : '';
    }
  }

  void onSubmit() {
    setState(() {
      isTitleError = titleController.text.isEmpty;
    });
    setState(() {
      isDescriptionError = descriptionController.text.isEmpty;
    });
    setState(() {
      isStartDateError = startDate == null;
    });
    if (isTitleError || isDescriptionError || isStartDateError) {
      return;
    }

    widget.onSubmit(
      CreateEventDto(
          title: titleController.value.text,
          description: descriptionController.value.text,
          locationName: locationController.value.text,
          startDate: startDate!,
          endDate: endDate,
          category: EventCategory.music,
          longitude: "12",
          latitude: "11",
          externalImageUrls: coverImageController.text.isNotEmpty
              ? [coverImageController.text]
              : []),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColumnWithSpacing(spacing: 12, children: [
      TextInput(
        controller: titleController,
        label: 'Title',
        placeholder: 'Eg. Tomorrowland',
        isError: isTitleError,
        error: RequiredException('Title'),
      ),
      TextInput(
        controller: descriptionController,
        label: 'Description (optional)',
        placeholder: 'Eg. Best festival in the world',
        error: RequiredException('Description'),
        isError: isDescriptionError,
      ),
      TextInput(
        controller: locationController,
        label: 'Location',
        placeholder: 'Eg. Torwar, Warsaw',
      ),
      DateInput(
        label: 'Start date',
        placeholder: 'Eg. 01.01.2022',
        onChange: (date) {
          setState(() {
            startDate = date;
          });
        },
        value: startDate,
        error: RequiredException('Start date'),
        isError: isStartDateError,
      ),
      DateInput(
        label: 'End date',
        placeholder: 'Eg. 01.01.2023',
        onChange: (date) {
          setState(() {
            endDate = date;
          });
        },
        value: endDate,
      ),
      TextInput(
        controller: categoryController,
        label: 'Category',
        placeholder: 'electronic-music',
      ),
      TextInput(
        controller: coverImageController,
        label: 'Cover image',
        placeholder: 'Eg. https://www.example.com/image.png',
      ),
      const SizedBox(),
      if (widget.isSubmitError)
        ErrorCard(
          error: widget.submitError ?? const UnknownException(),
          compact: true,
        ),
      ButtonPrimary(
        label: 'Submit',
        isLoading: widget.isSubmitting,
        onPressed: () => onSubmit(),
        icon: Icons.send,
      )
    ]);
  }
}
