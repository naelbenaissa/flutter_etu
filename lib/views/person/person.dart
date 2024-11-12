import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_go_router/utils/routes.dart';

/// Person page
class PersonScreen extends StatelessWidget {
  PersonScreen({super.key});

  final GoRouter router = Routes.routerConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(title: const Text('Person Screen !')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go to the Home screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/animal'),
              child: const Text('Go to the Animal screen'),
            ),
          ],
        ),
      ),
    );
  }
}