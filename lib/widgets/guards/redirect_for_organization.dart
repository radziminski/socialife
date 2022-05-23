import 'package:flutter/material.dart';
import 'package:socialife/services/user/entity/user.entity.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/widgets/error/error_card.dart';

class RedirectForOrganization extends StatefulWidget {
  final Widget child;
  final void Function(BuildContext) onRedirect;
  const RedirectForOrganization(
      {Key? key, required this.onRedirect, required this.child})
      : super(key: key);

  @override
  State<RedirectForOrganization> createState() =>
      _RedirectForOrganizationState();
}

class _RedirectForOrganizationState extends State<RedirectForOrganization> {
  bool isOrganization = false;
  bool hasInitialized = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    if (UserModel.user != null) {
      if (UserModel.user?.role == UserRole.organization) {
        setState(() {
          isOrganization = true;
          hasInitialized = true;
        });
        widget.onRedirect(context);
      } else {
        setState(() {
          isOrganization = false;
          hasInitialized = true;
        });
      }
    } else {
      UserModel.getUser(onSuccess: (user) {
        if (user.role == UserRole.organization) {
          setState(() {
            isOrganization = true;
            hasInitialized = true;
          });
          widget.onRedirect(context);
        } else {
          setState(() {
            isOrganization = false;
            hasInitialized = true;
          });
        }
      }, onError: (e) {
        setState(() {
          isError = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hasInitialized && !isOrganization) {
      return AnimatedOpacity(
        opacity: 1,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      );
    }

    if (isError) {
      return const Center(
        child: ErrorCard(),
      );
    }

    return Container();
  }
}
