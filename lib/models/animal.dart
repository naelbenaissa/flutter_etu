class Animal {

  final String _nom;
  final String _categorie;
  final String _description;
  final String _image;

  Animal(this._nom,this._categorie,this._description,this._image);

  String get getImage => _image;
  String get getDescription => _description;
  String get getCategorie => _categorie;
  String get getNom => _nom;
}
