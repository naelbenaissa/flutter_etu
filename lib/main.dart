import 'package:flutter/material.dart';
import 'package:flutter_todolist/models/tache.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Propriétés
  String? _tache;
  bool isChecked = false;


  // Méthodes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de tâches'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: _listeTaches(),
      floatingActionButton: _boutonAjoutTache(),
    );
  }

  Widget _boutonAjoutTache() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(context: context, builder: (BuildContext context) => AlertDialog(
          title: const Text('Ajouter une tâche'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ) ,
                onChanged: (value) {
                  setState(() {
                    _tache = value;
                  });
                },
              ),
              MaterialButton(
                color: Colors.purple[900],
                textColor: Colors.white,
                child: const Text('Ajouter'),
                onPressed: () {
                  if(_tache != null) {
                    // Enregistrement de la tâche
                    setState(() {
                      _tache = null;
                    });
                    Navigator.pop(context);
                  };
                },
              )
            ],
          ),
        ));
      },
      child: const Icon(Icons.add),
    );
  }

 Widget _listeTaches() {
    return ListView(
      children: [
        ListTile(
          title: const Text('Terminer travail pratique 2'),
          onLongPress: (){
            // Suppresion de la tâche
            setState(() {});
          },
          trailing: Checkbox( // trailing : A widget to display after the title
            value: isChecked, // Statut de la tâche
            onChanged: (value) {
              // Mise à jour du status de la tâche
              setState(() {
                isChecked = value!;
              });
            },
          ),
        )
      ],
    );
 }

}


