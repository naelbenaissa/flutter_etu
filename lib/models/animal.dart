class Animal {
  final String _nom;
  final String _categorie;
  final String _description;
  final String _image;

  const Animal(this._nom, this._categorie, this._description, this._image);

  String get nom => _nom;
  String get categorie => _categorie;
  String get description => _description;
  String get image => _image;

  // Constructeur nommé (fromJson)
  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      json['nom'].toString(),
      json['categorie'].toString(),
      json['description'].toString(),
      json['urlImage'].toString(),
    );
  }
}
