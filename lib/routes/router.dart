import 'package:auto_route/auto_route.dart';
import 'package:socialife/pages/account/account.dart';
import 'package:socialife/pages/event/event.dart';
import 'package:socialife/pages/event/events.dart';
import 'package:socialife/pages/event/events_home.dart';
import 'package:socialife/pages/home.dart';
import 'package:socialife/pages/search/search.dart';
import 'package:socialife/pages/ticket/ticket.dart';
import 'package:socialife/pages/ticket/tickets.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
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
  ],
)
class $AppRouter {}
