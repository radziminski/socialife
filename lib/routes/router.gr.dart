// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i31;

import '../pages/account/account.dart' as _i29;
import '../pages/account/update_account.dart' as _i30;
import '../pages/auth/login.dart' as _i2;
import '../pages/auth/register.dart' as _i3;
import '../pages/auth/register_organization.dart' as _i5;
import '../pages/auth/register_user.dart' as _i4;
import '../pages/dashboard.dart' as _i1;
import '../pages/events/create_event.dart' as _i14;
import '../pages/events/create_ticket_type.dart' as _i17;
import '../pages/events/event.dart' as _i12;
import '../pages/events/events.dart' as _i10;
import '../pages/events/events_home.dart' as _i8;
import '../pages/events/events_organization_home.dart' as _i9;
import '../pages/events/liked_events.dart' as _i11;
import '../pages/events/organization.dart' as _i13;
import '../pages/events/organization_events.dart' as _i19;
import '../pages/events/update_event.dart' as _i15;
import '../pages/events/update_event_tickets.dart' as _i16;
import '../pages/events/update_ticket_type.dart' as _i18;
import '../pages/search/organization_search.dart' as _i21;
import '../pages/search/search.dart' as _i20;
import '../pages/splash.dart' as _i6;
import '../pages/tickets/buy_ticket.dart' as _i24;
import '../pages/tickets/payment.dart' as _i25;
import '../pages/tickets/payments.dart' as _i26;
import '../pages/tickets/ticket.dart' as _i23;
import '../pages/tickets/tickets.dart' as _i22;
import '../pages/tickets/tickets_scan.dart' as _i27;
import '../pages/tickets/validate_ticket.dart' as _i28;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i31.GlobalKey<_i31.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    LoginRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    RegisterUserRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterUserPage());
    },
    RegisterOrganizationRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i5.RegisterOrganizationPage());
    },
    SplashRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.SplashPage());
    },
    EventsRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    TicketsRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    AccountRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    EventsHomeRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i8.EventsHomePage());
    },
    EventsOrganizationHomeRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i9.EventsOrganizationHomePage());
    },
    EventsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i10.EventsPage());
    },
    LikedEventsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i11.LikedEventsPage());
    },
    EventRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventRouteArgs>(
          orElse: () => EventRouteArgs(eventId: pathParams.getInt('eventId')));
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i12.EventPage(key: args.key, eventId: args.eventId));
    },
    OrganizationRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i13.OrganizationPage());
    },
    CreateEventRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i14.CreateEventPage());
    },
    UpdateEventRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UpdateEventRouteArgs>(
          orElse: () =>
              UpdateEventRouteArgs(eventId: pathParams.getInt('eventId')));
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i15.UpdateEventPage(key: args.key, eventId: args.eventId));
    },
    UpdateEventTicketsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UpdateEventTicketsRouteArgs>(
          orElse: () => UpdateEventTicketsRouteArgs(
              eventId: pathParams.getInt('eventId')));
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i16.UpdateEventTicketsPage(
              key: args.key, eventId: args.eventId));
    },
    CreateTicketTypeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateTicketTypeRouteArgs>(
          orElse: () =>
              CreateTicketTypeRouteArgs(eventId: pathParams.getInt('eventId')));
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i17.CreateTicketTypePage(key: args.key, eventId: args.eventId));
    },
    UpdateTicketTypeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UpdateTicketTypeRouteArgs>(
          orElse: () => UpdateTicketTypeRouteArgs(
              eventId: pathParams.getInt('eventId'),
              ticketTypeId: pathParams.getInt('ticketTypeId')));
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i18.UpdateTicketTypePage(
              key: args.key,
              eventId: args.eventId,
              ticketTypeId: args.ticketTypeId));
    },
    OrganizationEventsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i19.OrganizationEventsPage());
    },
    SearchRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i20.SearchPage());
    },
    OrganizationSearchRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i21.OrganizationSearchPage());
    },
    TicketsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i22.TicketsPage());
    },
    TicketRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TicketRouteArgs>(
          orElse: () =>
              TicketRouteArgs(ticketId: pathParams.getInt('ticketId')));
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i23.TicketPage(key: args.key, ticketId: args.ticketId));
    },
    BuyTicketRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i24.BuyTicketPage());
    },
    PaymentRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i25.PaymentPage());
    },
    PaymentsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i26.PaymentsPage());
    },
    TicketsScanRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i27.TicketsScanPage());
    },
    ValidateTicketRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ValidateTicketRouteArgs>(
          orElse: () =>
              ValidateTicketRouteArgs(eventId: pathParams.getInt('eventId')));
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i28.ValidateTicketPage(key: args.key, eventId: args.eventId));
    },
    AccountRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i29.AccountPage());
    },
    UpdateAccountRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i30.UpdateAccountPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i7.RouteConfig(DashboardRoute.name, path: 'dashboard', children: [
          _i7.RouteConfig(EventsRouter.name,
              path: 'events',
              parent: DashboardRoute.name,
              children: [
                _i7.RouteConfig(EventsHomeRoute.name,
                    path: '', parent: EventsRouter.name),
                _i7.RouteConfig(EventsOrganizationHomeRoute.name,
                    path: 'organization', parent: EventsRouter.name),
                _i7.RouteConfig(EventsRoute.name,
                    path: 'explore', parent: EventsRouter.name),
                _i7.RouteConfig(LikedEventsRoute.name,
                    path: 'liked', parent: EventsRouter.name),
                _i7.RouteConfig(EventRoute.name,
                    path: ':eventId', parent: EventsRouter.name),
                _i7.RouteConfig(OrganizationRoute.name,
                    path: 'organization/:organizationId',
                    parent: EventsRouter.name),
                _i7.RouteConfig(CreateEventRoute.name,
                    path: 'create', parent: EventsRouter.name),
                _i7.RouteConfig(UpdateEventRoute.name,
                    path: 'update/:eventId', parent: EventsRouter.name),
                _i7.RouteConfig(UpdateEventTicketsRoute.name,
                    path: 'update/:eventId/tickets', parent: EventsRouter.name),
                _i7.RouteConfig(CreateTicketTypeRoute.name,
                    path: 'update/:eventId/tickets/create-type',
                    parent: EventsRouter.name),
                _i7.RouteConfig(UpdateTicketTypeRoute.name,
                    path: 'update/:eventId/tickets/update/:ticketTypeId',
                    parent: EventsRouter.name),
                _i7.RouteConfig(OrganizationEventsRoute.name,
                    path: 'my-events', parent: EventsRouter.name)
              ]),
          _i7.RouteConfig(SearchRouter.name,
              path: 'search',
              parent: DashboardRoute.name,
              children: [
                _i7.RouteConfig(SearchRoute.name,
                    path: '', parent: SearchRouter.name),
                _i7.RouteConfig(OrganizationSearchRoute.name,
                    path: 'organization', parent: SearchRouter.name)
              ]),
          _i7.RouteConfig(TicketsRouter.name,
              path: 'tickets',
              parent: DashboardRoute.name,
              children: [
                _i7.RouteConfig(TicketsRoute.name,
                    path: '', parent: TicketsRouter.name),
                _i7.RouteConfig(TicketRoute.name,
                    path: ':ticketId', parent: TicketsRouter.name),
                _i7.RouteConfig(BuyTicketRoute.name,
                    path: 'buy/:ticketId', parent: TicketsRouter.name),
                _i7.RouteConfig(PaymentRoute.name,
                    path: 'pay/:ticketId', parent: TicketsRouter.name),
                _i7.RouteConfig(PaymentsRoute.name,
                    path: 'payments', parent: TicketsRouter.name),
                _i7.RouteConfig(TicketsScanRoute.name,
                    path: 'tickets-scan', parent: TicketsRouter.name),
                _i7.RouteConfig(ValidateTicketRoute.name,
                    path: 'validate/:eventId', parent: TicketsRouter.name)
              ]),
          _i7.RouteConfig(AccountRouter.name,
              path: 'account',
              parent: DashboardRoute.name,
              children: [
                _i7.RouteConfig(AccountRoute.name,
                    path: '', parent: AccountRouter.name),
                _i7.RouteConfig(UpdateAccountRoute.name,
                    path: 'update', parent: AccountRouter.name)
              ])
        ]),
        _i7.RouteConfig(LoginRoute.name, path: 'login'),
        _i7.RouteConfig(RegisterRoute.name, path: 'register'),
        _i7.RouteConfig(RegisterUserRoute.name, path: 'register/user'),
        _i7.RouteConfig(RegisterOrganizationRoute.name,
            path: 'register/organization'),
        _i7.RouteConfig(SplashRoute.name, path: 'splash')
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: 'dashboard', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.RegisterUserPage]
class RegisterUserRoute extends _i7.PageRouteInfo<void> {
  const RegisterUserRoute()
      : super(RegisterUserRoute.name, path: 'register/user');

  static const String name = 'RegisterUserRoute';
}

/// generated route for
/// [_i5.RegisterOrganizationPage]
class RegisterOrganizationRoute extends _i7.PageRouteInfo<void> {
  const RegisterOrganizationRoute()
      : super(RegisterOrganizationRoute.name, path: 'register/organization');

  static const String name = 'RegisterOrganizationRoute';
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class EventsRouter extends _i7.PageRouteInfo<void> {
  const EventsRouter({List<_i7.PageRouteInfo>? children})
      : super(EventsRouter.name, path: 'events', initialChildren: children);

  static const String name = 'EventsRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class SearchRouter extends _i7.PageRouteInfo<void> {
  const SearchRouter({List<_i7.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class TicketsRouter extends _i7.PageRouteInfo<void> {
  const TicketsRouter({List<_i7.PageRouteInfo>? children})
      : super(TicketsRouter.name, path: 'tickets', initialChildren: children);

  static const String name = 'TicketsRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class AccountRouter extends _i7.PageRouteInfo<void> {
  const AccountRouter({List<_i7.PageRouteInfo>? children})
      : super(AccountRouter.name, path: 'account', initialChildren: children);

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i8.EventsHomePage]
class EventsHomeRoute extends _i7.PageRouteInfo<void> {
  const EventsHomeRoute() : super(EventsHomeRoute.name, path: '');

  static const String name = 'EventsHomeRoute';
}

/// generated route for
/// [_i9.EventsOrganizationHomePage]
class EventsOrganizationHomeRoute extends _i7.PageRouteInfo<void> {
  const EventsOrganizationHomeRoute()
      : super(EventsOrganizationHomeRoute.name, path: 'organization');

  static const String name = 'EventsOrganizationHomeRoute';
}

/// generated route for
/// [_i10.EventsPage]
class EventsRoute extends _i7.PageRouteInfo<void> {
  const EventsRoute() : super(EventsRoute.name, path: 'explore');

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i11.LikedEventsPage]
class LikedEventsRoute extends _i7.PageRouteInfo<void> {
  const LikedEventsRoute() : super(LikedEventsRoute.name, path: 'liked');

  static const String name = 'LikedEventsRoute';
}

/// generated route for
/// [_i12.EventPage]
class EventRoute extends _i7.PageRouteInfo<EventRouteArgs> {
  EventRoute({_i31.Key? key, required int eventId})
      : super(EventRoute.name,
            path: ':eventId',
            args: EventRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'EventRoute';
}

class EventRouteArgs {
  const EventRouteArgs({this.key, required this.eventId});

  final _i31.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i13.OrganizationPage]
class OrganizationRoute extends _i7.PageRouteInfo<void> {
  const OrganizationRoute()
      : super(OrganizationRoute.name, path: 'organization/:organizationId');

  static const String name = 'OrganizationRoute';
}

/// generated route for
/// [_i14.CreateEventPage]
class CreateEventRoute extends _i7.PageRouteInfo<void> {
  const CreateEventRoute() : super(CreateEventRoute.name, path: 'create');

  static const String name = 'CreateEventRoute';
}

/// generated route for
/// [_i15.UpdateEventPage]
class UpdateEventRoute extends _i7.PageRouteInfo<UpdateEventRouteArgs> {
  UpdateEventRoute({_i31.Key? key, required int eventId})
      : super(UpdateEventRoute.name,
            path: 'update/:eventId',
            args: UpdateEventRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'UpdateEventRoute';
}

class UpdateEventRouteArgs {
  const UpdateEventRouteArgs({this.key, required this.eventId});

  final _i31.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'UpdateEventRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i16.UpdateEventTicketsPage]
class UpdateEventTicketsRoute
    extends _i7.PageRouteInfo<UpdateEventTicketsRouteArgs> {
  UpdateEventTicketsRoute({_i31.Key? key, required int eventId})
      : super(UpdateEventTicketsRoute.name,
            path: 'update/:eventId/tickets',
            args: UpdateEventTicketsRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'UpdateEventTicketsRoute';
}

class UpdateEventTicketsRouteArgs {
  const UpdateEventTicketsRouteArgs({this.key, required this.eventId});

  final _i31.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'UpdateEventTicketsRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i17.CreateTicketTypePage]
class CreateTicketTypeRoute
    extends _i7.PageRouteInfo<CreateTicketTypeRouteArgs> {
  CreateTicketTypeRoute({_i31.Key? key, required int eventId})
      : super(CreateTicketTypeRoute.name,
            path: 'update/:eventId/tickets/create-type',
            args: CreateTicketTypeRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'CreateTicketTypeRoute';
}

class CreateTicketTypeRouteArgs {
  const CreateTicketTypeRouteArgs({this.key, required this.eventId});

  final _i31.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'CreateTicketTypeRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i18.UpdateTicketTypePage]
class UpdateTicketTypeRoute
    extends _i7.PageRouteInfo<UpdateTicketTypeRouteArgs> {
  UpdateTicketTypeRoute(
      {_i31.Key? key, required int eventId, required int ticketTypeId})
      : super(UpdateTicketTypeRoute.name,
            path: 'update/:eventId/tickets/update/:ticketTypeId',
            args: UpdateTicketTypeRouteArgs(
                key: key, eventId: eventId, ticketTypeId: ticketTypeId),
            rawPathParams: {'eventId': eventId, 'ticketTypeId': ticketTypeId});

  static const String name = 'UpdateTicketTypeRoute';
}

class UpdateTicketTypeRouteArgs {
  const UpdateTicketTypeRouteArgs(
      {this.key, required this.eventId, required this.ticketTypeId});

  final _i31.Key? key;

  final int eventId;

  final int ticketTypeId;

  @override
  String toString() {
    return 'UpdateTicketTypeRouteArgs{key: $key, eventId: $eventId, ticketTypeId: $ticketTypeId}';
  }
}

/// generated route for
/// [_i19.OrganizationEventsPage]
class OrganizationEventsRoute extends _i7.PageRouteInfo<void> {
  const OrganizationEventsRoute()
      : super(OrganizationEventsRoute.name, path: 'my-events');

  static const String name = 'OrganizationEventsRoute';
}

/// generated route for
/// [_i20.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i21.OrganizationSearchPage]
class OrganizationSearchRoute extends _i7.PageRouteInfo<void> {
  const OrganizationSearchRoute()
      : super(OrganizationSearchRoute.name, path: 'organization');

  static const String name = 'OrganizationSearchRoute';
}

/// generated route for
/// [_i22.TicketsPage]
class TicketsRoute extends _i7.PageRouteInfo<void> {
  const TicketsRoute() : super(TicketsRoute.name, path: '');

  static const String name = 'TicketsRoute';
}

/// generated route for
/// [_i23.TicketPage]
class TicketRoute extends _i7.PageRouteInfo<TicketRouteArgs> {
  TicketRoute({_i31.Key? key, required int ticketId})
      : super(TicketRoute.name,
            path: ':ticketId',
            args: TicketRouteArgs(key: key, ticketId: ticketId),
            rawPathParams: {'ticketId': ticketId});

  static const String name = 'TicketRoute';
}

class TicketRouteArgs {
  const TicketRouteArgs({this.key, required this.ticketId});

  final _i31.Key? key;

  final int ticketId;

  @override
  String toString() {
    return 'TicketRouteArgs{key: $key, ticketId: $ticketId}';
  }
}

/// generated route for
/// [_i24.BuyTicketPage]
class BuyTicketRoute extends _i7.PageRouteInfo<void> {
  const BuyTicketRoute() : super(BuyTicketRoute.name, path: 'buy/:ticketId');

  static const String name = 'BuyTicketRoute';
}

/// generated route for
/// [_i25.PaymentPage]
class PaymentRoute extends _i7.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: 'pay/:ticketId');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i26.PaymentsPage]
class PaymentsRoute extends _i7.PageRouteInfo<void> {
  const PaymentsRoute() : super(PaymentsRoute.name, path: 'payments');

  static const String name = 'PaymentsRoute';
}

/// generated route for
/// [_i27.TicketsScanPage]
class TicketsScanRoute extends _i7.PageRouteInfo<void> {
  const TicketsScanRoute() : super(TicketsScanRoute.name, path: 'tickets-scan');

  static const String name = 'TicketsScanRoute';
}

/// generated route for
/// [_i28.ValidateTicketPage]
class ValidateTicketRoute extends _i7.PageRouteInfo<ValidateTicketRouteArgs> {
  ValidateTicketRoute({_i31.Key? key, required int eventId})
      : super(ValidateTicketRoute.name,
            path: 'validate/:eventId',
            args: ValidateTicketRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'ValidateTicketRoute';
}

class ValidateTicketRouteArgs {
  const ValidateTicketRouteArgs({this.key, required this.eventId});

  final _i31.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'ValidateTicketRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i29.AccountPage]
class AccountRoute extends _i7.PageRouteInfo<void> {
  const AccountRoute() : super(AccountRoute.name, path: '');

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i30.UpdateAccountPage]
class UpdateAccountRoute extends _i7.PageRouteInfo<void> {
  const UpdateAccountRoute() : super(UpdateAccountRoute.name, path: 'update');

  static const String name = 'UpdateAccountRoute';
}
