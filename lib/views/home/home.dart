import 'package:flutter/material.dart';
import '../widgets/compteur.dart';


class Home extends StatelessWidget {
  const Home(this._titre,{super.key});

  final String _titre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _titre,
            style: const TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Utiliser les boutons pour modifier les compteurs',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Compteur(),
          ],
        ),
      ),
    );
  }
}