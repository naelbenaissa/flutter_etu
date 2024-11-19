// Référence : Persist data with SQLite
// https://docs.flutter.dev/cookbook/persistence/sqlite
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/imc.dart';

class DataProvider {
  DataProvider._privateConstructor();

  static final DataProvider instance = DataProvider._privateConstructor();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'imc_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE imc(id INTEGER PRIMARY KEY AUTOINCREMENT, imc DOUBLE, date TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertImc(Imc imc) async {
    final db = await database;

    await db.insert(
      'imc',
      imc.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Imc>> imc() async {
    final db = await database;

    final List<Map<String, Object?>> imcMaps = await db.query('imc');

    return [
      for (final {
            'id': id as int,
            'imc': imc as double,
            'date': date as String,
          } in imcMaps)
        Imc(id: id, imc: imc, date: date),
    ];
  }

  Future<void> updateImc(Imc imc) async {
    final db = await database;

    await db.update(
      'imc',
      imc.toMap(),
      where: 'id = ?',
      whereArgs: [imc.id],
    );
  }

  Future<void> deleteImc(int id) async {
    final db = await database;

    await db.delete(
      'imc',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async => _db!.close;
}
