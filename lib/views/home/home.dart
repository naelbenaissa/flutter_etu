import 'package:flutter/material.dart';
import '../../widgets/animal_section.dart';

class Home extends StatelessWidget {
  final String titre;

  const Home(this.titre, {super.key});

  @override
  Widget build(BuildContext context) {
    var sizeContext = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titre,
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              'lib/assets/images/Home.jpg',
              fit: BoxFit.cover,
              width: sizeContext.width,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: AnimalSection(),
            ),
          ),
        ],
      ),
    );
  }
}
