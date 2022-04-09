import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/layout/navigation/bottom_navbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      navigatorObservers: () => [HeroController()],
      backgroundColor: kGray10Color,
      routes: const [
        EventsRouter(),
        SearchRouter(),
        TicketsRouter(),
        AccountRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavbar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
