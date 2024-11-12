import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_go_router/utils/routes.dart';

/// Animal page
class AnimalScreen extends StatelessWidget {
  AnimalScreen({super.key});

  final GoRouter router = Routes.routerConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(title: const Text('Animal Screen !')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go to the Home screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/person'),
              child: const Text('Go to the Person screen'),
            ),
          ],
        ),
      ),
    );
  }
}