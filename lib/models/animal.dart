class Animal {
  final String id;
  final String nom;
  final String categorie;
  final String description;
  final String image;

  const Animal(this.id, this.nom, this.categorie, this.description, this.image);

  String get getId => id;
  String get getNom => nom;
  String get getCategorie => categorie;
  String get getDescription => description;
  String get getImage => image;

  // Constructeur nommé (fromJson)
  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      json['id'].toString(),
      json['nom'].toString(),
      json['categorie']?.toString() ?? '',
      json['description']?.toString() ?? '',
      json['urlImage'].toString(),
    );
  }
}