import 'package:flutter/material.dart';
import 'package:flutter_animals_grid/models/animal.dart';
import 'package:flutter_animals_grid/services/data_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animals_grid/views/detail/detail.dart';

class GridSection extends StatefulWidget {
  const GridSection({super.key});

  @override
  State<GridSection> createState() => _GridSectionState();
}

class _GridSectionState extends State<GridSection> {

  /// Propriétés
  late Future<List<Animal>> futureAnimals;

  /// Méthodes
  @override
  void initState() {
    super.initState();
    futureAnimals = Data.fetchAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Animal>>(
        future: futureAnimals,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Une erreur est survenue !'),
            );
          } else if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            final animals = snapshot.data!;

            /// Construction de la grille
            return Padding(
              padding: const EdgeInsets.all(25),
              child: GridView.builder(
                  itemCount: animals.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, /// nombre items par ligne de la grille
                      crossAxisSpacing: 25, /// Espace entre les items sur une ligne
                      mainAxisSpacing: 25 /// Espace entre les lignes de la grille
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    final animal = animals[index];
                    return createTile(animal);
                  }),
            );
          } else {
            return const SizedBox(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }

  /// Méthode permettant de créer chaque tuile animal avec Widget "Détecteur de gestes"
  GestureDetector createTile(Animal animal) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailAnimal(idAnimal: animal.id)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          // https://pub.dev/packages/cached_network_image
          imageUrl: animal.urlImage,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
} // CLASS