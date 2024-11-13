class User {
  // Propriétés
  final String name;
  final String courriel;
  final String urlAvatar;

  // Constructeurs
  const User({required this.name, required this.courriel, required this.urlAvatar});

  // Constructeur nommé (fromJson)
  factory User.fromJson(Map<String, dynamic> json) {
    // https://dart.dev/language/constructors#factory-constructors
    return User(
      name: json['username'].toString(),
      courriel: json['courriel'].toString(),
      urlAvatar: json['urlAvatar'].toString(),
    );
  }
}
