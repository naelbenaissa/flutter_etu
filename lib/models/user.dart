import 'package:flutter/cupertino.dart';

class User {
  // Propriétés
  final String name;
  final String courriel;
  final String urlAvatar;
  final int id;
  final String pays;

  // Constructeurs
  const User(
      {required this.name,
      required this.courriel,
      required this.urlAvatar,
      required this.id,
      required this.pays});

  // Constructeur nommé
  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      name: json['name'].toString(),
      courriel: json['courriel'].toString(),
      urlAvatar: json['urlAvatar'].toString(),
      id: json['infos']['id'] as int,
      pays: json['infos']['pays'],
    );
  }
}
