import 'package:flutter_listview_etu/models/animal.dart';
import 'package:flutter_listview_etu/models/voiture.dart';

class Data {
  static List<Voiture> voiture() {
    return [
      Voiture('VW', 'Jetta'),
      Voiture('Toyota', 'Prius'),
      Voiture('Ford', 'Focus'),
      Voiture('Porsche', 'Carrera'),
      Voiture('Ferrari', 'F340'),
      Voiture('VW', 'Jetta'),
      Voiture('Toyota', 'Prius'),
      Voiture('Ford', 'Focus'),
      Voiture('Porsche', 'Carrera'),
      Voiture('Ferrari', 'F340'),
      Voiture('VW', 'Jetta'),
      Voiture('Toyota', 'Prius'),
      Voiture('Ford', 'Focus'),
      Voiture('Porsche', 'Carrera'),
      Voiture('Ferrari', 'F340'),
    ];
  }

  static List<Animal> animals() {
    return [
      Animal(
          'Lion',
          'Fauve',
          'Le Lion (Panthera leo) est une espèce de mammifères carnivores de la famille des Félidés. La femelle du lion est la lionne, son petit est le lionceau. Le mâle adulte, aisément reconnaissable à son importante crinière, accuse une masse moyenne qui peut être variable selon les zones géographiques où il se trouve, allant de 145 à 180 kg pour les lions d\'Asie à plus de 225 kg pour les lions d\'Afrique.',
          'Lion.jpg'),
      Animal(
          'Gorille',
          'Primate',
          'Les gorilles sont les plus grands des hominoïdes. Les mâles, en particulier, peuvent développer une force physique colossale. Les gorilles vivent en groupes dans les forêts tropicales ou subtropicales, où ils se nourrissent de végétaux et parfois d\'insectes.',
          'Gorille.jpg'),
      Animal(
          'Crocodile',
          'Reptile',
          'Les crocodiles vivent dans les régions chaudes. Toutes les espèces fréquentent les eaux douces (même le crocodile marin, en particulier durant les saisons tropicales humides). Ils vivent immergés dans des cours d\'eau stagnante où ils passent leurs journées à guetter leurs proies.',
          'Crocodile.jpg'),
      Animal(
          'Éléphant',
          'Pachyderme',
          'Les éléphants sont des mammifères proboscidiens de la famille des Éléphantidés. Ils correspondent aujourd\'hui à trois espèces réparties en deux genres distincts. L\'éléphant de savane d\'Afrique et l\'éléphant de forêt d\'Afrique, autrefois regroupés sous la même espèce d\'« éléphant d\'Afrique », appartiennent au genre Loxodonta, tandis que l\'éléphant d\'Asie, anciennement appelé « éléphant indien », appartient au genre Elephas.\n\nIls se différencient par certaines caractéristiques anatomiques, les éléphants d\'Asie étant en général plus petits avec des oreilles plus petites, ou encore une différence du bout de la trompe. Ces espèces survivantes font localement l\'objet de programmes ou de projets de réintroduction et de protection.',
          'Elephant.jpg')
    ];
  }
}
