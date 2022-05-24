import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/ticket/dto/create_ticket_type.dto.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/inputs/date_input.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';

class TicketTypeForm extends StatefulWidget {
  final bool isSubmitError;
  final bool isSubmitting;
  final BaseException? submitError;
  final Function(CreateTicketTypeDto) onSubmit;
  final CreateTicketTypeDto? initialValues;

  const TicketTypeForm({
    Key? key,
    required this.onSubmit,
    this.isSubmitError = false,
    this.submitError,
    this.isSubmitting = false,
    this.initialValues,
  }) : super(key: key);

  @override
  State<TicketTypeForm> createState() => _TicketTypeFormState();
}

class _TicketTypeFormState extends State<TicketTypeForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  DateTime? availableTillDate;

  bool isTitleError = false;
  bool isPriceError = false;

  @override
  void initState() {
    super.initState();
    final initialValues = widget.initialValues;
    if (initialValues != null) {
      titleController.text = initialValues.title;
      descriptionController.text = initialValues.description ?? '';
      priceController.text = initialValues.price.toString();
      availableTillDate = initialValues.availableTillDate;
    }
  }

  void onSubmit() {
    setState(() {
      isTitleError = titleController.text.isEmpty;
    });
    setState(() {
      isPriceError = priceController.text.isEmpty ||
          int.tryParse(priceController.text) == null;
    });

    if (isTitleError || isPriceError) {
      return;
    }

    widget.onSubmit(
      CreateTicketTypeDto(
        title: titleController.text,
        description: descriptionController.text,
        price: int.parse(priceController.text),
        availableTillDate: availableTillDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColumnWithSpacing(spacing: 12, children: [
      TextInput(
        controller: titleController,
        label: 'Title',
        placeholder: 'Eg. Early bird 1',
        isError: isTitleError,
        error: RequiredException('Title'),
      ),
      TextInput(
        controller: descriptionController,
        label: 'Description (optional)',
        placeholder: 'Eg. Ticket for sitting in the front row',
      ),
      TextInput(
        controller: priceController,
        label: 'Price (in \$)',
        placeholder: 'Eg. 100',
        error: RequiredException('Price'),
      ),
      DateInput(
        label: 'Available till',
        placeholder: 'Eg. 01.01.2023',
        onChange: (date) {
          setState(() {
            availableTillDate = date;
          });
        },
        value: availableTillDate,
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
