import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class data
{
  Future<Database>createdatabase()
  async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, number Text)');
        });

    return database;
  }

}