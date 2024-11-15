// Référence : Persist data with SQLite
// https://docs.flutter.dev/cookbook/persistence/sqlite
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/imc.dart';

class DataProvider {

  // Pattern simplifié Singleton
  // https://fr.wikipedia.org/wiki/Singleton_(patron_de_conception)

  // Constructeur privé
  DataProvider._privateConstructor();

  // L'instance unique de la classe
  static final DataProvider instance = DataProvider._privateConstructor();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'imc_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE imc(id INTEGER PRIMARY KEY, date TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }


  // Define a function that inserts dogs into the database
  Future<void> insertImc(Imc imc) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'imc',
      imc.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Imc>> imc() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all the dogs.
    final List<Map<String, Object?>> imcMaps = await db.query('imc');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {
      'id': id as int,
      'date': date as DateTime,
      } in imcMaps)
        Imc(id: id, date: date),
    ];
  }

  Future<void> updateImc(Imc imc) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'imc',
      imc.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [imc.id],
    );
  }

  Future<void> deleteImc(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'imc',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future close() async => _db!.close;


}
