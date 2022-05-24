import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/user/api/create_organization_profile.request.dart';
import 'package:socialife/services/user/dto/create_organization_profile.dto.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/animations/fade_in.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/logo/logo.dart';

class RegisterOrganizationPage extends StatefulWidget {
  const RegisterOrganizationPage({Key? key}) : super(key: key);

  @override
  State<RegisterOrganizationPage> createState() =>
      _RegisterOrganizationPageState();
}

class _RegisterOrganizationPageState extends State<RegisterOrganizationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController coverController = TextEditingController();

  bool isLoading = false;
  bool isError = false;
  BaseException? error;

  Future onSubmit(BuildContext context) async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final user = await createOrganizationProfile(
        CreateOrganizationProfileDto(
          name: nameController.value.text,
          description: descriptionController.value.text,
          region: regionController.value.text,
          city: cityController.value.text,
          website: websiteController.value.text,
          coverUrl: websiteController.value.text,
        ),
      );
      UserModel.setUser(user);
      setState(() {
        isError = false;
        isLoading = false;
      });
      return AutoRouter.of(context).push(const DashboardRoute());
    } catch (error) {
      setState(() {
        isLoading = false;
        isError = true;

        if (error is UnauthorizedException) {
          AutoRouter.of(context).push(const LoginRoute());
          return;
        } else if (error is RequestException) {
          this.error = error;
        } else {
          this.error = const UnknownException();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      unfocusOnTap: true,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: 'logo',
                  child: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: const SizedBox(
                      child: Logo(size: 60),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FadeInAnimation(
                delay: const Duration(milliseconds: 50),
                duration: const Duration(milliseconds: 200),
                child: ColumnWithSpacing(
                  spacing: 18,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Almost there!',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Create your organization profile to continue',
                          style: TextStyle(
                            color: kGray60Color,
                          ),
                        ),
                      ],
                    ),
                    TextInput(
                      controller: nameController,
                      placeholder: 'Organization name',
                    ),
                    TextInput(
                      controller: descriptionController,
                      placeholder: 'Organization description',
                    ),
                    TextInput(
                      controller: regionController,
                      placeholder: 'Region',
                    ),
                    TextInput(
                      controller: cityController,
                      placeholder: 'City',
                    ),
                    TextInput(
                      controller: websiteController,
                      placeholder: 'Organization website',
                    ),
                    TextInput(
                      controller: coverController,
                      placeholder: 'Cover image link',
                    ),
                    if (isError)
                      ErrorCard(
                        error: error ?? const UnknownException(),
                        compact: true,
                      ),
                    ButtonPrimary(
                      label: 'Create profile',
                      isLoading: isLoading,
                      onPressed: () => onSubmit(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
