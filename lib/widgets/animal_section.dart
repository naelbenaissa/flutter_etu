import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listview_etu/models/animal.dart';

import '../services/data_provider.dart';
import '../views/animalDetailsPage.dart';

class AnimalSection extends StatefulWidget {
  const AnimalSection({super.key});

  @override
  State<AnimalSection> createState() => _AnimalSectionState();
}

class _AnimalSectionState extends State<AnimalSection> {
  String nomAnimal = '';
  String categorieAnimal = '';
  String descriptionAnimal = '';
  String image = '';
  Widget messagePourInfo = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: const Text(
      'Cliquez sur une image pour avoir les informations sur un animal.',
      style: TextStyle(
        fontSize: 15,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Animal>>(
      future: Data.fetchAnimals(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucun animal trouvé.'));
        }

        final animals = snapshot.data!;

        return Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                scrollDirection: Axis.horizontal,
                itemCount: animals.length,
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimalDetailPage(animal: animals[index]),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 240,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: animals[index].image,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Expanded(child: messagePourInfo),
          ],
        );
      },
    );
  }
}