import 'package:flutter/material.dart';
import '../../data/data.dart';
import '../../models/animal.dart';

class Home extends StatelessWidget {
  Home(this._titre, {super.key});

  final String _titre;
  final List<Animal> animals = Data.animals();

  @override
  Widget build(BuildContext context) {

    var sizeContext = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titre,
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

          SizedBox(
            height: 200,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                scrollDirection: Axis.horizontal,
                itemCount: animals.length,
                itemBuilder: (
                        (BuildContext context, int index) => GestureDetector(
                      onTap: () => print('animal : ${animals[index].getNom}, index ; $index'),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('lib/assets/images/${animals[index].getImage}')),
                        ),
                      ),
                    )
                ),
                separatorBuilder: (
                        (BuildContext context, int index) => const SizedBox(width: 10,)
                )
            ),
          ),
        ],
      ),
    );
  }
}