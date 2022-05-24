import 'package:flutter/material.dart';
import 'package:socialife/services/user/entity/organization_profile.entity.dart';
import 'package:socialife/widgets/account/account_field.dart';
import 'package:socialife/widgets/account/logout_button.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';

class OrganizationDetails extends StatelessWidget {
  final OrganizationProfile? profile;
  const OrganizationDetails({Key? key, this.profile}) : super(key: key);

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
          label: 'name',
          value: profile?.name,
        ),
        AccountField(
          label: 'description',
          value: profile?.description,
        ),
        AccountField(
          label: 'region',
          value: profile?.region,
        ),
        AccountField(
          label: 'city',
          value: profile?.city,
        ),
        AccountField(
          label: 'website',
          value: profile?.website,
        ),
        const SizedBox(),
        // ButtonPrimary(
        //   icon: Icons.edit,
        //   label: 'Edit',
        //   onPressed: () {},
        // ),
        const LogoutButton(),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
