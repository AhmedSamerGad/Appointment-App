// core/database/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _dbName = 'app_database.db';
  static const _dbVersion = 1;
  static const appointmentTable = 'appointments';
  static const userTable = 'user';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $appointmentTable (
        appointmentId INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        startingTime TEXT NOT NULL,
        endingTime TEXT ,
        startingDate TEXT NOT NULL,
        endingDate TEXT
        
      )
    ''');
  
  }

  

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
  Future<void> deleteDatabase() async {
    final db = await database;
    await db.close();
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);
    await databaseFactory.deleteDatabase(path);
  }
}
