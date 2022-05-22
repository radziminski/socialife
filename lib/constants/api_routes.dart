String getAuthRoute() => '/auth';
String getLoginRoute() => '${getAuthRoute()}/login';
String getRegisterRoute() => '${getAuthRoute()}/register';
String getRegisterOrganizationRoute() =>
    '${getAuthRoute()}/register-organization';
String getChangePasswordRoute() => '${getAuthRoute()}/change-password';

String getUserRoute() => '/user';
String getUserProfileRoute() => '${getUserRoute()}/profile';

String getEventsRoute() => '/event';
String getEventRoute(int id) => '${getEventsRoute()}/$id';
String getCancelEventRoute(int id) => '${getEventsRoute()}/$id/cancel';
String getMyEventsRoute() => '${getEventsRoute()}/mine';
String getLikeEventRoute(int id) => '${getEventsRoute()}/$id/like';
String getUnlikeEventRoute(int id) => '${getEventsRoute()}/$id/unlike';
String getEventStatsRoute(int id) => '${getEventsRoute()}/$id/stats';

String getTicketsRoute() => '/event-ticket';
String getTicketEventRoute(int eventId) => '${getTicketsRoute()}/$eventId';
String getTicketTypesRoute(int eventId) =>
    '${getTicketEventRoute(eventId)}/type';
String getTicketTypeRoute(int eventId, int ticketTypeId) =>
    '${getTicketEventRoute(eventId)}/type/$ticketTypeId';
String getTicketInstancesRoute() => '${getTicketsRoute()}/instance';
String getTicketInstanceRoute(int ticketId) =>
    '${getTicketInstancesRoute()}/$ticketId';
String getValidateTicketRoute(int eventId) =>
    '${getTicketEventRoute(eventId)}/validate';

String getPaymentsRoute() => '/payment';
String getPotentialPaymentRoute() => '${getPaymentsRoute()}/calculate';
String getPaymentRoute(int paymentId) => '${getPaymentsRoute()}/$paymentId';
