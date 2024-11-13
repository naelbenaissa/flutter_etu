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
  /// Attributs
  late Future<List<Animal>> futureAnimals;

  /// Méthodes
  @override
  void initState() {
    super.initState();
    futureAnimals = Data.fetchAnimals();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureAnimals,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Text('Une erreur est survenue !');
          } else if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            final animals = snapshot.data!;

            /// Création d'une liste de tuiles
            List<Widget> tilesAnimals = [];
            for (Animal animal in animals) {
              tilesAnimals.add(appendTile(animal));
            }

            /// Création de la grille
            return GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: tilesAnimals,
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

  ///
  GestureDetector appendTile(Animal animal) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAnimal(idAnimal: animal.id),
          ),
        );
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
}
