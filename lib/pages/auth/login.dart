import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/animations/fade_in.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();

  Future handleNavigate(BuildContext context) {
    return AutoRouter.of(context).push(const DashboardRoute());
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
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Enter your credentials to log in now',
                          style: TextStyle(
                            color: kGray60Color,
                          ),
                        ),
                      ],
                    ),
                    TextInput(
                      controller: controller,
                    ),
                    ButtonPrimary(
                      label: 'Continue',
                      onPressed: () => handleNavigate(context),
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
