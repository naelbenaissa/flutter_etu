import 'package:flutter/material.dart';
import 'package:flutter_imc/models/imc.dart';
import '../../services/data_provider.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _tailleController = TextEditingController();
  final _poidsController = TextEditingController();

  final DataProvider _dataProvider = DataProvider.instance;
  late Future<List<Imc>> _imcList;

  @override
  void initState() {
    super.initState();
    _imcList = _dataProvider.imc();
  }

  @override
  void dispose() {
    _dataProvider.close();
    _tailleController.dispose();
    _poidsController.dispose();
    super.dispose();
  }

  Future<void> _calculerIMC() async {
    if (_formKey.currentState!.validate()) {
      final taille = double.parse(_tailleController.text) / 100;
      final poids = double.parse(_poidsController.text);
      final imc = poids / (taille * taille);

      final newImc = Imc(imc: imc, date: DateTime.now().toString());
      await _dataProvider.insertImc(newImc);

      setState(() {
        _imcList = _dataProvider.imc();
      });

      String categorie;
      Color couleur;

      if (imc < 18.5) {
        categorie = "Sous-poids";
        couleur = Colors.blue;
      } else if (imc >= 18.5 && imc < 25) {
        categorie = "Poids normal";
        couleur = Colors.green;
      } else if (imc >= 25 && imc < 30) {
        categorie = "Surpoids";
        couleur = Colors.orange;
      } else {
        categorie = "Obésité";
        couleur = Colors.red;
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Votre IMC'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Votre IMC est de ${imc.toStringAsFixed(2)}\n($categorie)',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: _getImcProgress(imc),
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(couleur),
              ),
              const SizedBox(height: 8),
              Text(
                'IMC idéal : 18.5 - 24.9',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
            ],
          ),
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

  double _getImcProgress(double imc) {
    const minImc = 10.0;
    const maxImc = 40.0;
    return ((imc - minImc) / (maxImc - minImc)).clamp(0.0, 1.0);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _tailleController,
                    decoration: const InputDecoration(
                      labelText: 'Taille en cm',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) => (value == null ||
                            double.tryParse(value) == null ||
                            double.parse(value) <= 0)
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
                    validator: (value) => (value == null ||
                            double.tryParse(value) == null ||
                            double.parse(value) <= 0)
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
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Expanded(
                child: FutureBuilder<List<Imc>>(
                  future: _imcList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child:
                              Text('Erreur lors du chargement des données.'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Aucun IMC enregistré.'));
                    }

                    final imcList = snapshot.data!;
                    return ListView.builder(
                      itemCount: imcList.length,
                      itemBuilder: (context, index) {
                        final imc = imcList[index];
                        final dateFormatted = DateFormat('dd MM yyyy').format(
                            DateTime.parse(imc.date));
                        return ListTile(
                          title: Text('IMC : ${imc.imc.toStringAsFixed(2)}'),
                          subtitle: Text('Date : $dateFormatted'),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
