import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home(this.titrePage, {super.key});
  final String titrePage;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color couleurPage = const Color.fromRGBO(0, 0, 0, 1);

  void changerCouleur() {
    setState(() {
      couleurPage = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titrePage,
          style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        backgroundColor: couleurPage,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'La couleur affichée est :',
              style: TextStyle(fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.15,
              color: couleurPage,
              child: Center(
                child: Text(
                  'R(${couleurPage.red}), G(${couleurPage.green}), B(${couleurPage.blue})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changerCouleur,
        tooltip: 'Change page color',
        backgroundColor: couleurPage,
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
