// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i12;

import '../pages/account/account.dart' as _i6;
import '../pages/auth/login.dart' as _i2;
import '../pages/dashboard.dart' as _i1;
import '../pages/events/event.dart' as _i9;
import '../pages/events/events.dart' as _i8;
import '../pages/events/events_home.dart' as _i7;
import '../pages/search/search.dart' as _i5;
import '../pages/splash.dart' as _i3;
import '../pages/tickets/ticket.dart' as _i11;
import '../pages/tickets/tickets.dart' as _i10;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    LoginRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    SplashRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashPage());
    },
    EventsRouter.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i5.SearchPage());
    },
    TicketsRouter.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    AccountRouter.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.AccountPage());
    },
    EventsHomeRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.EventsHomePage());
    },
    EventsRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i8.EventsPage());
    },
    EventRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventRouteArgs>(
          orElse: () => EventRouteArgs(eventId: pathParams.getInt('eventId')));
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i9.EventPage(key: args.key, eventId: args.eventId));
    },
    TicketsRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i10.TicketsPage());
    },
    TicketRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TicketRouteArgs>(
          orElse: () =>
              TicketRouteArgs(ticketId: pathParams.getInt('ticketId')));
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i11.TicketPage(key: args.key, ticketId: args.ticketId));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i4.RouteConfig(DashboardRoute.name, path: 'dashboard', children: [
          _i4.RouteConfig(EventsRouter.name,
              path: 'events',
              parent: DashboardRoute.name,
              children: [
                _i4.RouteConfig(EventsHomeRoute.name,
                    path: '', parent: EventsRouter.name),
                _i4.RouteConfig(EventsRoute.name,
                    path: 'explore', parent: EventsRouter.name),
                _i4.RouteConfig(EventRoute.name,
                    path: ':eventId', parent: EventsRouter.name)
              ]),
          _i4.RouteConfig(SearchRouter.name,
              path: 'search', parent: DashboardRoute.name),
          _i4.RouteConfig(TicketsRouter.name,
              path: 'tickets',
              parent: DashboardRoute.name,
              children: [
                _i4.RouteConfig(TicketsRoute.name,
                    path: '', parent: TicketsRouter.name),
                _i4.RouteConfig(TicketRoute.name,
                    path: ':ticketId', parent: TicketsRouter.name)
              ]),
          _i4.RouteConfig(AccountRouter.name,
              path: 'account', parent: DashboardRoute.name)
        ]),
        _i4.RouteConfig(LoginRoute.name, path: 'login'),
        _i4.RouteConfig(SplashRoute.name, path: 'splash')
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: 'dashboard', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class EventsRouter extends _i4.PageRouteInfo<void> {
  const EventsRouter({List<_i4.PageRouteInfo>? children})
      : super(EventsRouter.name, path: 'events', initialChildren: children);

  static const String name = 'EventsRouter';
}

/// generated route for
/// [_i5.SearchPage]
class SearchRouter extends _i4.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class TicketsRouter extends _i4.PageRouteInfo<void> {
  const TicketsRouter({List<_i4.PageRouteInfo>? children})
      : super(TicketsRouter.name, path: 'tickets', initialChildren: children);

  static const String name = 'TicketsRouter';
}

/// generated route for
/// [_i6.AccountPage]
class AccountRouter extends _i4.PageRouteInfo<void> {
  const AccountRouter() : super(AccountRouter.name, path: 'account');

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i7.EventsHomePage]
class EventsHomeRoute extends _i4.PageRouteInfo<void> {
  const EventsHomeRoute() : super(EventsHomeRoute.name, path: '');

  static const String name = 'EventsHomeRoute';
}

/// generated route for
/// [_i8.EventsPage]
class EventsRoute extends _i4.PageRouteInfo<void> {
  const EventsRoute() : super(EventsRoute.name, path: 'explore');

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i9.EventPage]
class EventRoute extends _i4.PageRouteInfo<EventRouteArgs> {
  EventRoute({_i12.Key? key, required int eventId})
      : super(EventRoute.name,
            path: ':eventId',
            args: EventRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'EventRoute';
}

class EventRouteArgs {
  const EventRouteArgs({this.key, required this.eventId});

  final _i12.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i10.TicketsPage]
class TicketsRoute extends _i4.PageRouteInfo<void> {
  const TicketsRoute() : super(TicketsRoute.name, path: '');

  static const String name = 'TicketsRoute';
}

/// generated route for
/// [_i11.TicketPage]
class TicketRoute extends _i4.PageRouteInfo<TicketRouteArgs> {
  TicketRoute({_i12.Key? key, required int ticketId})
      : super(TicketRoute.name,
            path: ':ticketId',
            args: TicketRouteArgs(key: key, ticketId: ticketId),
            rawPathParams: {'ticketId': ticketId});

  static const String name = 'TicketRoute';
}

class TicketRouteArgs {
  const TicketRouteArgs({this.key, required this.ticketId});

  final _i12.Key? key;

  final int ticketId;

  @override
  String toString() {
    return 'TicketRouteArgs{key: $key, ticketId: $ticketId}';
  }
}
