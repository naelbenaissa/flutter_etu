import 'dart:async';
import 'dart:convert';
import 'package:flutter_animals_grid/models/animal.dart';
import 'package:http/http.dart' as http; // https://pub.dev/packages/http

// Installer le package http
// https://pub.dev/packages/http/install

class Data {

  static Future<List<Animal>> fetchAnimals() async {
    // https://api.flutter.dev/flutter/dart-async/Future-class.html
    final response = await http.get(Uri.parse('https://www.simpleeweb.com/a2024/pam/data/list_animals.php'));
    final body = jsonDecode(response.body); // https://api.flutter.dev/flutter/dart-convert/jsonDecode.html
    return body.map<Animal>((json) => Animal.fromJson(json)).toList();
  }

  static Future<Animal> fetchAnimal(String idAnimal) async {
    final response = await http.get(Uri.parse('https://www.simpleeweb.com/a2024/pam/data/detail_animal.php?id=$idAnimal'));
    final body = json.decode(utf8.decode(response.bodyBytes)); // https://api.flutter.dev/flutter/dart-convert/jsonDecode.html
    return Animal.fromJson(body);
  }

}