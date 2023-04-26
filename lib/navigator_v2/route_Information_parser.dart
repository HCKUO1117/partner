import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:partner/navigator_v2/model.dart';

class AppRouterParser extends RouteInformationParser<RoutePage> {
  @override
  Future<RoutePage> parseRouteInformation(RouteInformation routeInformation) {
    RoutePage configuration = getRoutePage(name: routeInformation.location ?? '/');

    return SynchronousFuture(configuration);
  }

  @override
  RouteInformation restoreRouteInformation(RoutePage configuration) {
    return RouteInformation(location: configuration.path ?? '/');
  }
}
