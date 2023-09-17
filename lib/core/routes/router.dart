import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_menu/app.dart';
import 'package:restaurant_menu/core/routes/routes.dart';
import 'package:restaurant_menu/feature/menu_management/presentation/pages/home_page.dart';
import 'package:restaurant_menu/feature/menu_management/presentation/pages/plate_details_page.dart';

mixin RouterMixin on State<App> {
  GoRouter? _router;

  GoRouter get router {
    if (_router != null) {
      return _router!;
    }

    final routes = [
      GoRoute(
        name: Routes.home,
        path: '/',
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        name: Routes.plateDetail,
        path: '/${Routes.plateDetail}',
        builder: (_, state) => PlateDetailsPage(
          params: state.extra! as PlaceDetailsPageParams,
        ),
      ),
    ];

    _router = GoRouter(
      initialLocation: '/',
      routes: routes,
    );
    return _router!;
  }
}
