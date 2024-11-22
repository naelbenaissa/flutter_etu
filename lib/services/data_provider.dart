import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DataProvider {
  Future initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'sample.db');

    final exist = await databaseExists(path);

    if (exist) {
      print('Database existe');
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
    }
    {}
  }
}
