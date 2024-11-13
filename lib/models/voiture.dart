class Voiture {
  final String _marque, _modele;

  Voiture(this._marque, this._modele);

  String afficherVoiture() {
    return "$_marque ($_modele)";
  }
}
