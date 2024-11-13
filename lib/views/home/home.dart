import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../services/data_provider.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({required this.title, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<User>> futureUsers;
  // // https://api.flutter.dev/flutter/dart-async/Future-class.html

  @override
  void initState() {
    super.initState();
    futureUsers = Data.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<List<User>>(
            // https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
            future: futureUsers,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              // https://api.flutter.dev/flutter/widgets/AsyncSnapshot-class.html
              if (snapshot.hasError) {
                return const Text('Une erreur est survenue !');
              } else if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                final users = snapshot.data!;
                return showUsers(users);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }

  Widget showUsers(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        User user = users[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(user.urlAvatar),
            ),
            title: Text(user.name),
            subtitle: Text(user.courriel),
          ),
        );
      },
    );
  }
}
