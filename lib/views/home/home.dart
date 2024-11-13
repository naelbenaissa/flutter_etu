import 'package:flutter/material.dart';
import 'package:flutter_animals_grid/views/home/grid_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Découvres les animaux !"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: const GridSection(),
    );
  }
}

