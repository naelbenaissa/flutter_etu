import 'package:flutter/material.dart';
import 'package:flutter_animals_grid/models/animal.dart';
import 'package:flutter_animals_grid/services/data_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailSection extends StatefulWidget {
  const DetailSection({required this.idAnimal, super.key});

  final String idAnimal;

  @override
  State<DetailSection> createState() => _DetailSectionState();
}

class _DetailSectionState extends State<DetailSection> {

  late Future<Animal> futureAnimal;

  @override
  void initState() {
    super.initState();
    futureAnimal = Data.fetchAnimal(widget.idAnimal);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Animal>(
        future: futureAnimal,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Text('Une erreur est survenue !');
          } else if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            final animal = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: animal.urlImage,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text(animal.nom,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 40, color: Colors.purple)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  const Text('Catégorie',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(animal.categorie,
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  const Text('Description',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(animal.description,
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 15)
                  )
                ],
              ),
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
}
