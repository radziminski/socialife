// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i10;

import '../pages/account/account.dart' as _i4;
import '../pages/event/event.dart' as _i7;
import '../pages/event/events.dart' as _i6;
import '../pages/event/events_home.dart' as _i5;
import '../pages/home.dart' as _i1;
import '../pages/search/search.dart' as _i3;
import '../pages/ticket/ticket.dart' as _i9;
import '../pages/ticket/tickets.dart' as _i8;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    EventsRouter.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.SearchPage());
    },
    TicketsRouter.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    AccountRouter.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.AccountPage());
    },
    EventsHomeRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i5.EventsHomePage());
    },
    EventsRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.EventsPage());
    },
    EventRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventRouteArgs>(
          orElse: () => EventRouteArgs(eventId: pathParams.getInt('eventId')));
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i7.EventPage(key: args.key, eventId: args.eventId));
    },
    TicketsRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i8.TicketsPage());
    },
    TicketRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TicketRouteArgs>(
          orElse: () =>
              TicketRouteArgs(ticketId: pathParams.getInt('ticketId')));
      return _i2.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i9.TicketPage(key: args.key, ticketId: args.ticketId));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(EventsRouter.name,
              path: 'events',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(EventsHomeRoute.name,
                    path: '', parent: EventsRouter.name),
                _i2.RouteConfig(EventsRoute.name,
                    path: 'explore', parent: EventsRouter.name),
                _i2.RouteConfig(EventRoute.name,
                    path: ':eventId', parent: EventsRouter.name)
              ]),
          _i2.RouteConfig(SearchRouter.name,
              path: 'search', parent: HomeRoute.name),
          _i2.RouteConfig(TicketsRouter.name,
              path: 'tickets',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(TicketsRoute.name,
                    path: '', parent: TicketsRouter.name),
                _i2.RouteConfig(TicketRoute.name,
                    path: ':ticketId', parent: TicketsRouter.name)
              ]),
          _i2.RouteConfig(AccountRouter.name,
              path: 'account', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EventsRouter extends _i2.PageRouteInfo<void> {
  const EventsRouter({List<_i2.PageRouteInfo>? children})
      : super(EventsRouter.name, path: 'events', initialChildren: children);

  static const String name = 'EventsRouter';
}

/// generated route for
/// [_i3.SearchPage]
class SearchRouter extends _i2.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class TicketsRouter extends _i2.PageRouteInfo<void> {
  const TicketsRouter({List<_i2.PageRouteInfo>? children})
      : super(TicketsRouter.name, path: 'tickets', initialChildren: children);

  static const String name = 'TicketsRouter';
}

/// generated route for
/// [_i4.AccountPage]
class AccountRouter extends _i2.PageRouteInfo<void> {
  const AccountRouter() : super(AccountRouter.name, path: 'account');

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i5.EventsHomePage]
class EventsHomeRoute extends _i2.PageRouteInfo<void> {
  const EventsHomeRoute() : super(EventsHomeRoute.name, path: '');

  static const String name = 'EventsHomeRoute';
}

/// generated route for
/// [_i6.EventsPage]
class EventsRoute extends _i2.PageRouteInfo<void> {
  const EventsRoute() : super(EventsRoute.name, path: 'explore');

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i7.EventPage]
class EventRoute extends _i2.PageRouteInfo<EventRouteArgs> {
  EventRoute({_i10.Key? key, required int eventId})
      : super(EventRoute.name,
            path: ':eventId',
            args: EventRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'EventRoute';
}

class EventRouteArgs {
  const EventRouteArgs({this.key, required this.eventId});

  final _i10.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i8.TicketsPage]
class TicketsRoute extends _i2.PageRouteInfo<void> {
  const TicketsRoute() : super(TicketsRoute.name, path: '');

  static const String name = 'TicketsRoute';
}

/// generated route for
/// [_i9.TicketPage]
class TicketRoute extends _i2.PageRouteInfo<TicketRouteArgs> {
  TicketRoute({_i10.Key? key, required int ticketId})
      : super(TicketRoute.name,
            path: ':ticketId',
            args: TicketRouteArgs(key: key, ticketId: ticketId),
            rawPathParams: {'ticketId': ticketId});

  static const String name = 'TicketRoute';
}

class TicketRouteArgs {
  const TicketRouteArgs({this.key, required this.ticketId});

  final _i10.Key? key;

  final int ticketId;

  @override
  String toString() {
    return 'TicketRouteArgs{key: $key, ticketId: $ticketId}';
  }
}
