import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/event/dto/create_event.dto.dart';
import 'package:socialife/store/create_event.model.dart';
import 'package:socialife/widgets/forms/event_form.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/api_mutation_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  void onSubmit(BuildContext context, CreateEventDto dto) {
    locator<CreateEventModelSingleton>().mutate(dto, onSuccess: (_) {
      AutoRouter.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: ListView(
        children: [
          const PageHeader(
            title: 'Create new Event',
            compact: true,
            withBackButton: true,
          ),
          const SizedBox(
            height: 24,
          ),
          PagePadding(
            child: ApiMutationProvider<CreateEventModelSingleton>(
              builder: (context, model, _) => EventForm(
                isSubmitError: model.isError,
                isSubmitting: model.isLoading,
                submitError: model.error,
                onSubmit: (dto) => onSubmit(context, dto),
              ),
            ),
          )
        ],
      ),
    );
  }
}
