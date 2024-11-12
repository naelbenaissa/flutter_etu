import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_go_router/views/home/home.dart';
import 'package:flutter_go_router/views/person/person.dart';
import 'package:flutter_go_router/views/animal/animal.dart';

class Routes {

  static GoRouter routerConfiguration() {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
          pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/person',
          builder: (context, state) => PersonScreen(),
        ),
        GoRoute(
          path: '/animal',
          builder: (context, state) => AnimalScreen(),
        ),
      ],
    );
  }

}

class NoTransitionPage extends CustomTransitionPage<void> {
  NoTransitionPage({required Widget child})
      : super(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}