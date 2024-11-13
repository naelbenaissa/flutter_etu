
import '../models/user.dart';

class Data {
  static List<User> fetchUsers() {
    const usersJson = <Map>[
      {
        "name": "Stefanie Derazu",
        "courriel": "sd@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-6742893659243.jpg"
      },
      {
        "name": "Michel Grondin",
        "courriel": "mg@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-60965420365042.jpg"
      },
      {
        "name": "Isabelle Hoareau",
        "courriel": "ih@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-8402562309549.jpg"
      },
      {
        "name": "Frédéric Patrez",
        "courriel": "fp@gmail.com",
        "urlAvatar": "https://www.simpleeweb.com/a2024/pam/lib/json/photo-78254978234982.jpg"
      }
    ];

    return usersJson.map<User>((json) => User.fromJson(json)).toList();
  }
}
