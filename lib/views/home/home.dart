import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../models/user.dart';

class Home extends StatefulWidget {

  final String title;

  const Home({required this.title, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<User> users = Data.fetchUsers();

  @override
  Widget build(BuildContext context) {
    
    // print(users.length);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: Center(
          child: showUsers(users),
        )
    );
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
            title: Text('${user.name} (${user.pays})'),
            subtitle: Text('${user.id} - ${user.courriel}'),
          ),
        );
      },
    );

  }

}

