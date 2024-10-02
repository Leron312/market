import 'package:notes_app/features/note/data/db/notes_db_service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static const String _databaseName = 'notes.db';
  static const int _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final _databasePath = await getDatabasesPath();

    final path = join(_databasePath, _databaseName);

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: _databaseVersion,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
  //   await db.execute(
  //       ''' CREAT TABLE notes (id INTEGER PRIMARY KEY AVTOINCREMENT, title TEXT, content TEXT) ''');

    await db.execute(''' CREATE TABLE ${NotesDbService.tableName}(
    ${NotesDbService.columnId} TEXT PRIMARY KEY,
    ${NotesDbService.columnTitle} TEXT,
    ${NotesDbService.columnContent} TEXT) ''');
  }
}
