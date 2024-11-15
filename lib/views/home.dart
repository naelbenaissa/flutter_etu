import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite_dog/models/dog.dart';
import 'package:flutter_sqlite_dog/services/data_provider.dart';

Future<void> main() async {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final DataProvider _dataProvider = DataProvider.instance;

  Dog fido = Dog(id: 1001, name: 'Fido', age: 10);
  Dog bouba = Dog(id: 1002, name: 'Bouba', age: 8);

  @override
  void dispose() {
    super.dispose();
    _dataProvider.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Découvrir SQLITE'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'SQLITE',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.greenAccent),
                  ),
                  onPressed: () async {
                    await _dataProvider.insertDog(fido);
                  },
                  child: const Text("Ajouter Fido")
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    await _dataProvider.deleteDog(1001);
                  },
                  child: const Text("Supprimer Fido")
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.orange),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    fido = Dog(id: fido.id, name: fido.name, age: fido.age + 7);
                    await _dataProvider.updateDog(fido);
                  },
                  child: const Text("Mettre à jour Fido / + 7 ans")
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.greenAccent),
                  ),
                  onPressed: () async {
                    await _dataProvider.insertDog(bouba);
                  },
                  child: const Text("Ajouter Bouba")
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    await _dataProvider.deleteDog(1002);
                  },
                  child: const Text("Supprimer Bouba")
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    print(await _dataProvider.dogs());
                  },
                  child: const Text("Print liste chiens")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
