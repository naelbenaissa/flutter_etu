import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_go_router/utils/routes.dart';

/// Home page
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GoRouter router = Routes.routerConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
          title: const Text('Home Screen !')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/person'),
              child: const Text('Go to the Person screen'),
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