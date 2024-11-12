// Package Go_router à installer
// https://pub.dev/documentation/go_router/latest/
//
// Configuration topic
// https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_go_router/utils/routes.dart';

void main() => runApp(MyApp());

/// Main app.
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = Routes.routerConfiguration();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

