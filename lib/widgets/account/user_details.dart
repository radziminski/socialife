import 'package:flutter/material.dart';
import 'package:socialife/services/user/entity/profile.entity.dart';
import 'package:socialife/widgets/account/account_field.dart';
import 'package:socialife/widgets/account/logout_button.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';

class UserDetails extends StatelessWidget {
  final Profile? profile;
  const UserDetails({Key? key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColumnWithSpacing(
      spacing: 24,
      children: [
        AccountField(
          label: 'email',
          value: profile?.email,
        ),
        AccountField(
          label: 'first name',
          value: profile?.firstName,
        ),
        AccountField(
          label: 'last name',
          value: profile?.lastName,
        ),
        const SizedBox(),
        // ButtonPrimary(
        //   icon: Icons.edit,
        //   label: 'Edit',
        //   onPressed: () {},
        // ),
        const LogoutButton(),
      ],
    );
  }
}
