import 'dart:convert';
import '../models/user.dart';


class Data {
  static List<User> fetchUsers() {
    const usersJson = ''' 
    [
      {
        "name": "Stefanie Derazu",
        "courriel": "sd@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-6742893659243.jpg",
        "infos" : {
          "id" : 222555888,
          "pays" : "France"
        }
      },
      {
        "name": "Michel Grondin",
        "courriel": "mg@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-60965420365042.jpg",
        "infos" : {
          "id" : 598632147,
          "pays" : "Canada"
        }
        
      },
      {
        "name": "Isabelle Hoareau",
        "courriel": "ih@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-8402562309549.jpg",
        "infos" : {
          "id" : 852369147,
          "pays" : "Reunion"
        }
      },
      {
        "name": "Frédéric Patrez",
        "courriel": "fp@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-78254978234982.jpg",
        "infos" : {
          "id" : 789123456,
          "pays" : "Italie"
        }
      }
    ]
    ''';

    final users = jsonDecode(usersJson);

    return users.map<User>((json) => User.fromJson(json)).toList();
  }
}
