import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/animal.dart';

class Data {

  static Future<List<Animal>> fetchAnimals() async {
    final response = await http.get(Uri.parse('https://www.simpleeweb.com/a2024/pam/data/list_animals.php'));
    final body = jsonDecode(response.body);

    return body.map<Animal>((json) => Animal.fromJson(json)).toList();
  }

  static Future<Animal> fetchDetails(String id) async {
    final response = await http.get(Uri.parse('https://www.simpleeweb.com/a2024/pam/data/detail_animal.php?id=$id'));
    final body = json.decode(utf8.decode(response.bodyBytes));
    return Animal.fromJson(body);
  }
}