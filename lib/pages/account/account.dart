import 'package:flutter/material.dart';
import 'package:socialife/services/user/entity/user.entity.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/account/organization_details.dart';
import 'package:socialife/widgets/account/user_details.dart';
import 'package:socialife/widgets/gravatar/user_gravatar.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/user_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: PageHeader(title: 'Your Account')),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: UserProvider(
                  key: const Key('AccountPageHeader-UserProvider'),
                  builder: (context, model, _) => UserGravatar(
                    email: UserModel.user?.email,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: UserProvider(
              key: const Key('AccountPageContent-UserProvider'),
              builder: (context, model, _) => RefreshIndicator(
                onRefresh: () {
                  model.getUser(notifyOnInit: true);
                  return Future.value();
                },
                color: kPrimaryColor,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    PagePadding(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: model.user != null
                            ? model.user?.role == UserRole.user
                                ? UserDetails(profile: model.user?.profile)
                                : OrganizationDetails(
                                    profile: model.user?.organizationProfile)
                            : Container(),
                      ),
                    ),
                    if (model.user?.role == UserRole.user)
                      const SizedBox(
                        height: 150,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
