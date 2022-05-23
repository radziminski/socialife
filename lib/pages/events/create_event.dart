import 'package:flutter/material.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  TextEditingController nameController = TextEditingController();
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
            child: ColumnWithSpacing(spacing: 16, children: [
              TextInput(
                controller: nameController,
                label: 'Name',
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
                controller: nameController,
                label: 'Start date',
                placeholder: 'Eg. 01.01.2022',
              ),
              TextInput(
                controller: nameController,
                label: 'End date (optional)',
                placeholder: 'Eg. 01.01.2023',
              ),
              TextInput(
                controller: categoryController,
                label: 'Category',
                placeholder: 'electronic-music',
              ),
              const SizedBox(),
              ButtonPrimary(
                label: 'Submit',
                onPressed: () {},
                icon: Icons.send,
              )
            ]),
          )
        ],
      ),
    );
  }
}
