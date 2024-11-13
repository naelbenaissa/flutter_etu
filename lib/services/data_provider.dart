import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart'; // https://pub.dev/packages/http

// Installer le package http
// https://pub.dev/packages/http/install

class Data {

  static Future<List<User>> fetchUsers() async {
    // https://api.flutter.dev/flutter/dart-async/Future-class.html
    final response = await http.get(Uri.parse('https://www.simpleeweb.com/a2024/pam/data/users.php'));
    final body = jsonDecode(response.body); // https://api.flutter.dev/flutter/dart-convert/jsonDecode.html

    return body.map<User>((json) => User.fromJson(json)).toList();
  }

}