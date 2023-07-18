import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class AppRouterDelegate extends RouterDelegate<RoutePage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePage> {
  final List<Page> _pages = [];

  AppRouterDelegate() : navigatorKey = GlobalKey();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  RoutePage get currentConfiguration {
    return _pages.last.arguments as RoutePage;
  }

  @override
  Future<void> setNewRoutePath(RoutePage configuration) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.arguments as RoutePage).name != configuration.name;

    if (shouldAddPage) {
      replace(configuration);
    }

    return SynchronousFuture(null);
  }

  replace(RoutePage configuration) {
    _pages.clear();
    _addPage(configuration);
  }

  static AppRouterDelegate of(BuildContext context) {
    RouterDelegate routerDelegate = Router.of(context).routerDelegate;
    return routerDelegate as AppRouterDelegate;
  }

  void push(Widget widget) {
    _addPage(RoutePage.widget(widget));
  }

  void _addPage(RoutePage configuration) {
    _pages.add(
      MaterialPage(
        child: configuration.widget,
        key: ValueKey(configuration.name),
        name: configuration.name,
        arguments: configuration,
      ),
    );
    notifyListeners();
  }

  void pushNamed(String name) {
    RoutePage configuration = getRoutePage(name: name);
    replace(configuration);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
      transitionDelegate: NoAnimationTransitionDelegate(),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);

    if (!didPop) {
      return false;
    }

    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    required List<RouteTransitionRecord> newPageRouteHistory,
    required Map<RouteTransitionRecord?, RouteTransitionRecord> locationToExitingPageRoute,
    required Map<RouteTransitionRecord?, List<RouteTransitionRecord>> pageRouteToPagelessRoutes,
  }) {
    final List<RouteTransitionRecord> results = <RouteTransitionRecord>[];

    for (final RouteTransitionRecord pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);

    }
    for (final RouteTransitionRecord exitingPageRoute in locationToExitingPageRoute.values) {
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();
        final List<RouteTransitionRecord>? pagelessRoutes = pageRouteToPagelessRoutes[exitingPageRoute];
        if (pagelessRoutes != null) {
          for (final RouteTransitionRecord pagelessRoute in pagelessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }
      results.add(exitingPageRoute);

    }
    return results;
  }
}