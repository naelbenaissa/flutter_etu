import 'package:flutter/material.dart';

import '../page_two/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  final String message = "Ceci est une alerte - AlertDialog";

  void _onItemTapped(int index) {
    print(index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Retour',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageTwo()),
                );
              },
              child: const Text(
                'Page #2',
                // style: TextStyle(
                //   fontSize: 20,
                //   color: Colors.black,
                // ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Éducation',
            ),
          ],
          onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          affichAlert(context, message);
        },
        tooltip: 'Alert',
        backgroundColor: Colors.black,
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),

        child: const Icon(Icons.add_alert),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
    );
  }

  void affichAlert(context, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Information importante"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Fermer"),
              )
            ],
          );
        });
  }



} // Class
