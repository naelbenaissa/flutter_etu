import 'package:flutter/material.dart';
import 'package:flutter_animals_grid/views/detail/detail_section.dart';

class DetailAnimal extends StatelessWidget {
  const DetailAnimal({required this.idAnimal, super.key});

  final String idAnimal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Découvres les animaux !"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: DetailSection(idAnimal: idAnimal),
    );
  }
}
