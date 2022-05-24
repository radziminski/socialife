import 'package:auto_route/auto_route.dart';
import 'package:socialife/pages/account/account.dart';
import 'package:socialife/pages/account/update_account.dart';
import 'package:socialife/pages/auth/login.dart';
import 'package:socialife/pages/auth/register.dart';
import 'package:socialife/pages/auth/register_organization.dart';
import 'package:socialife/pages/auth/register_user.dart';
import 'package:socialife/pages/events/buy_ticket.dart';
import 'package:socialife/pages/events/create_event.dart';
import 'package:socialife/pages/events/event.dart';
import 'package:socialife/pages/events/events.dart';
import 'package:socialife/pages/events/events_home.dart';
import 'package:socialife/pages/dashboard.dart';
import 'package:socialife/pages/events/events_organization_home.dart';
import 'package:socialife/pages/events/liked_events.dart';
import 'package:socialife/pages/events/organization.dart';
import 'package:socialife/pages/events/organization_events.dart';
import 'package:socialife/pages/events/update_event.dart';
import 'package:socialife/pages/events/update_event_tickets.dart';
import 'package:socialife/pages/search/organization_search.dart';
import 'package:socialife/pages/search/search.dart';
import 'package:socialife/pages/search/search_event.dart';
import 'package:socialife/pages/splash.dart';
import 'package:socialife/pages/events/create_ticket_type.dart';
import 'package:socialife/pages/tickets/payment.dart';
import 'package:socialife/pages/tickets/payments.dart';
import 'package:socialife/pages/tickets/ticket.dart';
import 'package:socialife/pages/tickets/tickets.dart';
import 'package:socialife/pages/events/update_ticket_type.dart';
import 'package:socialife/pages/tickets/tickets_scan.dart';
import 'package:socialife/pages/tickets/validate_ticket.dart';

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
              path: 'organization',
              page: EventsOrganizationHomePage,
            ),
            AutoRoute(
              path: 'explore',
              page: EventsPage,
            ),
            AutoRoute(
              path: 'liked',
              page: LikedEventsPage,
            ),
            AutoRoute(
              path: ':eventId',
              page: EventPage,
            ),
            AutoRoute(
              path: 'organization/:organizationId',
              page: OrganizationPage,
            ),
            AutoRoute(
              path: 'create',
              page: CreateEventPage,
            ),
            AutoRoute(
              path: 'update/:eventId',
              page: UpdateEventPage,
            ),
            AutoRoute(
              path: 'update/:eventId/tickets',
              page: UpdateEventTicketsPage,
            ),
            AutoRoute(
              path: 'update/:eventId/tickets/create-type',
              page: CreateTicketTypePage,
            ),
            AutoRoute(
              path: 'update/:eventId/tickets/update/:ticketTypeId',
              page: UpdateTicketTypePage,
            ),
            AutoRoute(
              path: 'my-events',
              page: OrganizationEventsPage,
            ),
            AutoRoute(
              path: 'buy/:ticketTypeId',
              page: BuyTicketPage,
            )
          ],
        ),
        AutoRoute(
            path: 'search',
            name: 'SearchRouter',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: SearchPage,
              ),
              AutoRoute(
                path: 'organization',
                page: OrganizationSearchPage,
              ),
              AutoRoute(
                path: 'search/event/:eventId',
                page: SearchEventPage,
              ),
            ]),
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
            AutoRoute(
              path: 'pay/:ticketId',
              page: PaymentPage,
            ),
            AutoRoute(
              path: 'payments',
              page: PaymentsPage,
            ),
            AutoRoute(
              path: 'tickets-scan',
              page: TicketsScanPage,
            ),
            AutoRoute(
              path: 'validate/:eventId',
              page: ValidateTicketPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'account',
          name: 'AccountRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: AccountPage,
            ),
            AutoRoute(
              path: 'update',
              page: UpdateAccountPage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: 'login',
      page: LoginPage,
    ),
    AutoRoute(
      path: 'register',
      page: RegisterPage,
    ),
    AutoRoute(
      path: 'register/user',
      page: RegisterUserPage,
    ),
    AutoRoute(
      path: 'register/organization',
      page: RegisterOrganizationPage,
    ),
    AutoRoute(
      path: 'splash',
      page: SplashPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
