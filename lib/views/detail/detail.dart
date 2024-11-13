import 'package:flutter/material.dart';

import '../../models/tache.dart';

class Detail extends StatelessWidget {
  /// Classe permettant l'affichage d'une tâche donnée.
  const Detail({super.key, required this.tache});

  final Tache tache;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tache.titre),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(tache.description),
      ),
    );
  }
}