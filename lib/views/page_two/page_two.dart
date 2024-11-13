import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]),
            title: const Text('Page avec onglet'),
          ),
          body: TabBarView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Voyages en voiture',
                      style: GoogleFonts.rubikWetPaint(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.deepOrange,
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    const Icon(Icons.directions_car),
                  ],
                ),

                const Icon(Icons.directions_transit),
                const Icon(Icons.directions_bike),
              ]),
        ),
      ),
    );
  }
}
