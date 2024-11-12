import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _tailleController = TextEditingController();
  final _poidsController = TextEditingController();


  void _calculerIMC() {
    if (_formKey.currentState!.validate()) {
      final taille = double.parse(_tailleController.text) / 100;
      final poids = double.parse(_poidsController.text);
      final imc = poids / (taille * taille);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Votre IMC'),
          content: Text('Votre IMC est de ${imc.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculateur IMC'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _tailleController,
                decoration: const InputDecoration(
                  labelText: 'Taille en cm',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => (value == null || double.tryParse(value) == null || double.parse(value) <= 0)
                    ? 'Veuillez entrer une taille valide.'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _poidsController,
                decoration: const InputDecoration(
                  labelText: 'Poids en kg',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => (value == null || double.tryParse(value) == null || double.parse(value) <= 0)
                    ? 'Veuillez entrer un poids valide.'
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calculerIMC,
                child: const Text('Calculer IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
