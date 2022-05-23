import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/services/user/api/register_organization.request.dart';
import 'package:socialife/services/user/api/register_user.request.dart';
import 'package:socialife/services/user/dto/register.dto.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/animations/fade_in.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/logo/logo.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  bool isLoading = false;
  bool isError = false;
  BaseException? error;
  bool isOrganization = false;

  Future onSubmit(BuildContext context) async {
    final email = emailController.value.text;
    final password = passwordController.value.text;
    final repeatPassword = repeatPasswordController.value.text;

    if (password == '' || email == '' || repeatPassword == '') {
      setState(() {
        isError = true;
        error = BadRequestException(
            title: 'All values are required',
            description: 'Make sure you to fill all inputs in the form');
      });
      return;
    }

    if (password != repeatPassword) {
      setState(() {
        isError = true;
        error = BadRequestException(
            title: 'Passwords do not match',
            description: 'Make sure you type the same password twice');
      });
      return;
    }

    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final response =
          await (isOrganization ? registerOrganization : registerUser)(
        RegisterDto(
          email: emailController.value.text,
          password: passwordController.value.text,
        ),
      );
      await TokensService.setAccessToken(response.tokens.accessToken);
      setState(() {
        isError = false;
        isLoading = false;
      });
      return AutoRouter.of(context).push(
        isOrganization
            ? const RegisterOrganizationRoute()
            : const RegisterUserRoute(),
      );
    } catch (error) {
      setState(() {
        isLoading = false;
        isError = true;

        if (error is UnauthorizedException) {
          this.error = InvalidCredentialsException();
        } else if (error is RequestException) {
          this.error = error;
        } else {
          this.error = const UnknownException();
        }
      });
    }
  }

  @override
  void initState() {
    if (TokensService.isAuthenticated) {
      AutoRouter.of(context).push(const DashboardRoute());
    }
    super.initState();
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
              Row(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'SociaLife',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Create new account',
                        style: TextStyle(
                          color: kGray60Color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              FadeInAnimation(
                delay: const Duration(milliseconds: 50),
                duration: const Duration(milliseconds: 200),
                child: ColumnWithSpacing(
                  spacing: 18,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isOrganization = false;
                              });
                            },
                            child: Text(
                              'Private user',
                              style: TextStyle(
                                color: isOrganization
                                    ? kPrimaryColor
                                    : kGray10Color,
                                fontSize: 12,
                              ),
                            ),
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              )),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                  side: BorderSide(
                                    width: 2,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                !isOrganization
                                    ? kPrimaryColor
                                    : Colors.transparent,
                              ),
                              overlayColor:
                                  MaterialStateProperty.all(kPrimaryDarkColor),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isOrganization = true;
                              });
                            },
                            child: Text(
                              'Organization',
                              style: TextStyle(
                                color: !isOrganization
                                    ? kPrimaryColor
                                    : kGray10Color,
                                fontSize: 12,
                              ),
                            ),
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              )),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  side: BorderSide(
                                    width: 2,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                isOrganization
                                    ? kPrimaryColor
                                    : Colors.transparent,
                              ),
                              overlayColor:
                                  MaterialStateProperty.all(kPrimaryDarkColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    TextInput(
                      controller: emailController,
                      placeholder: 'Email',
                    ),
                    TextInput(
                      controller: passwordController,
                      placeholder: 'Password',
                    ),
                    TextInput(
                      controller: repeatPasswordController,
                      placeholder: 'Repeat Password',
                    ),
                    if (isError)
                      ErrorCard(
                        error: error ?? const UnknownException(),
                        compact: true,
                      ),
                    ButtonPrimary(
                      label: 'Continue',
                      isLoading: isLoading,
                      onPressed: () => onSubmit(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        AutoRouter.of(context).push(const LoginRoute());
                      },
                      child: Text('Already have an account? Log in here.',
                          style:
                              TextStyle(color: kPrimaryColor.withOpacity(0.8))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
