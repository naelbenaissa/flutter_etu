class Animal {

  final String id;
  final String nom;
  final String categorie;
  final String description;
  final String urlImage;

  Animal(
      {required this.id, required this.nom, required this.categorie, required this.description, required this.urlImage});

  factory Animal.fromJson(Map<String, dynamic> json) {
    // https://dart.dev/language/constructors#factory-constructors
    return Animal(
      id: json['id'].toString(),
      nom: json['nom'].toString(),
      categorie: json['categorie'].toString(),
      description: json['description'].toString(),
      urlImage: json['urlImage'].toString(),
    );
  }

}