import 'package:flutter/material.dart';
import 'package:flutter_listview_etu/models/animal.dart';
import 'package:flutter_listview_etu/data/data.dart';

class AnimalSection extends StatefulWidget {
  AnimalSection({super.key});

  final List<Animal> animals = Data.animals();

  @override
  State<AnimalSection> createState() => _AnimalSectionState();
}

class _AnimalSectionState extends State<AnimalSection> {

  String nomAnimal = '';
  String categorieAnimal = '';
  String descriptionAnimal = '';
  Container infoAnimal = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: const Text(
      'Cliques sur une image pour avoir les informations sur un animal.',
      style: TextStyle(
        fontSize: 15,
      ),
    ),
  );

  void _actualiserInfo(Animal animal) {
    setState(() {
      // print(animal.getNom);
      nomAnimal = animal.getNom;
      categorieAnimal = animal.getCategorie;
      descriptionAnimal = animal.getDescription;

      infoAnimal = Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nomAnimal,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 40, color: Colors.purple)),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              const Text('Catégorie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(categorieAnimal,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const Text('Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(descriptionAnimal,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            ],
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((BuildContext context, int index) => GestureDetector(
                    onTap: () => _actualiserInfo(widget.animals[index]),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset('lib/assets/images/${widget.animals[index].getImage}')),
                      ),
                    ),
                  )),
              separatorBuilder: ((BuildContext context, int index) => const SizedBox(
                    width: 10,
                  )),
              itemCount: widget.animals.length),
        ),
        infoAnimal,
        const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
      ],
    );
  }
}
