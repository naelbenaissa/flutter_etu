import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listview_etu/models/animal.dart';

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;

  const AnimalDetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.nom),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: animal.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              animal.nom,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 40,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Catégorie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(animal.categorie, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            const SizedBox(height: 10),
            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(animal.description, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
