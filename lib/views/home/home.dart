import 'package:flutter/material.dart';
import '../../models/tache.dart';
import '../../services/data_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tache> taches = [];

  @override
  void initState() {
    super.initState();
    _loadTaches();
  }

  Future<void> _loadTaches() async {
    taches = await DataProvider.instance.getAllTaches();
    setState(() {});
  }

  Future<void> _ajouterTache(String contenu) async {
    if (contenu.isNotEmpty) {
      await DataProvider.instance.insertTache(contenu);
      _loadTaches();
    }
  }

  Future<void> _modifierStatut(Tache tache) async {
    await DataProvider.instance.updateTacheStatut(tache);
    _loadTaches();
  }

  Future<void> _supprimerTache(int id) async {
    await DataProvider.instance.deleteTache(id);
    _loadTaches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de tâches'),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: taches.length,
        itemBuilder: (context, index) {
          final tache = taches[index];
          return ListTile(
            title: Text(
              tache.contenu,
              style: TextStyle(
                decoration: tache.statut == 1 ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: tache.statut == 1,
              onChanged: (_) => _modifierStatut(tache),
            ),
            onLongPress: () => _supprimerTache(tache.id!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog() {
    String newTask = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter une tâche'),
        content: TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onChanged: (value) => newTask = value,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              _ajouterTache(newTask);
              Navigator.pop(context);
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
