import 'package:auto_route/auto_route.dart';
import 'package:socialife/pages/account/account.dart';
import 'package:socialife/pages/auth/login.dart';
import 'package:socialife/pages/events/event.dart';
import 'package:socialife/pages/events/events.dart';
import 'package:socialife/pages/events/events_home.dart';
import 'package:socialife/pages/dashboard.dart';
import 'package:socialife/pages/search/search.dart';
import 'package:socialife/pages/splash.dart';
import 'package:socialife/pages/tickets/ticket.dart';
import 'package:socialife/pages/tickets/tickets.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: 'dashboard',
      page: DashboardPage,
      children: [
        AutoRoute(
          path: 'events',
          name: 'EventsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: EventsHomePage,
            ),
            AutoRoute(
              path: 'explore',
              page: EventsPage,
            ),
            AutoRoute(
              path: ':eventId',
              page: EventPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'search',
          name: 'SearchRouter',
          page: SearchPage,
        ),
        AutoRoute(
          path: 'tickets',
          name: 'TicketsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: TicketsPage,
            ),
            AutoRoute(
              path: ':ticketId',
              page: TicketPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'account',
          name: 'AccountRouter',
          page: AccountPage,
        ),
      ],
    ),
    AutoRoute(
      path: 'login',
      page: LoginPage,
    ),
    AutoRoute(
      path: 'splash',
      page: SplashPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
