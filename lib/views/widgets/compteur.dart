import 'package:flutter/material.dart';

class Compteur extends StatefulWidget {
  const Compteur({super.key});

  @override
  State<Compteur> createState() => _CompteurState();
}

class _CompteurState extends State<Compteur> {

  int _compteur = 0;

  // Méthodes
  void _augmenterCompteur() {
    setState(() {
      _compteur++;
    });
  }

  void _diminuerCompteur() {
    setState(() {
      if (_compteur > 0) _compteur--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$_compteur',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Ink(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Color.fromRGBO(0, 255, 0, 1),
              ),
              child: IconButton(
                  color: Colors.white,
                  onPressed: _augmenterCompteur,
                  icon: const Icon(Icons.plus_one)),
            ),
            Ink(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
              child: IconButton(
                  color: Colors.white,
                  onPressed: _diminuerCompteur,
                  icon: const Icon(Icons.exposure_minus_1)),
            ),
          ],
        )
      ],
    );
  }
}