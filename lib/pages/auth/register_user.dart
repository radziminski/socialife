import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/user/api/create_user_profile.request.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/services/user/dto/create_user_profile.dto.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/animations/fade_in.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/logo/logo.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController regionController = TextEditingController();

  bool isLoading = false;
  bool isError = false;
  BaseException? error;

  Future onSubmit(BuildContext context) async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final user = await createUserProfile(
        CreateUserProfileDto(
          firstName: firstNameController.value.text,
          lastName: lastNameController.value.text,
          region: regionController.value.text,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                          'Create your profile to continue',
                          style: TextStyle(
                            color: kGray60Color,
                          ),
                        ),
                      ],
                    ),
                    TextInput(
                      controller: firstNameController,
                      placeholder: 'First name',
                    ),
                    TextInput(
                      controller: lastNameController,
                      placeholder: 'Last name',
                    ),
                    TextInput(
                      controller: regionController,
                      placeholder: 'Region',
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
