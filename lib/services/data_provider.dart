import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/tache.dart';

class DataProvider {
  DataProvider._privateConstructor();

  static final DataProvider instance = DataProvider._privateConstructor();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE taches(
            id INTEGER PRIMARY KEY,
            contenu TEXT NOT NULL,
            statut INTEGER NOT NULL
          )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<List<Tache>> getAllTaches() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('taches');
    return List.generate(
      maps.length,
          (i) => Tache(
        id: maps[i]['id'],
        contenu: maps[i]['contenu'],
        statut: maps[i]['statut'],
      ),
    );
  }

  Future<void> insertTache(String contenu) async {
    final db = await database;
    await db.insert(
      'taches',
      {'contenu': contenu, 'statut': 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTacheStatut(Tache tache) async {
    final db = await database;
    await db.update(
      'taches',
      {'statut': tache.statut == 0 ? 1 : 0},
      where: 'id = ?',
      whereArgs: [tache.id],
    );
  }

  Future<void> deleteTache(int id) async {
    final db = await database;
    await db.delete(
      'taches',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> closeDatabase() async {
    await _db?.close();
  }
}
