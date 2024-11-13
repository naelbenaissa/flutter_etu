import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../page_one/page_one.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
              "https://images.pexels.com/photos/219998/pexels-photo-219998.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
          const Padding(padding: EdgeInsets.symmetric(vertical: 100)),
          ElevatedButton(
            child: Text(
              'Page #1',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageOne()),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Et un SnackBar !!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Afficher un SnackBar'),
          ),
        ],
      )),
    );
  }
}
