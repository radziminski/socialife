import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/store/event.model.dart';
import 'package:socialife/store/ticket.model.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/widgets/button/button_primary.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  void onLogout(BuildContext context) async {
    UserModel.logout();
    EventModel.clear();
    TicketModel.clear();
    await TokensService.clearAccessToken();
    AutoRouter.of(context).popUntilRoot();
    AutoRouter.of(context).push(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return ButtonPrimary(
      icon: Icons.logout,
      label: 'Logout',
      onPressed: () => onLogout(context),
    );
  }
}
