import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlLiteStorage {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE media(
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             user_name TEXT,
             user_token TEXT,
             user_profile_url TEXT,
             location TEXT,
             report_id TEXT,
             disaster_type TEXT, 
             severity REAL,
             media_url TEXT,
             video_thumbnail TEXT,
             post_status TEXT,
             time_stamp TEXT
            )
            ''');
      },
    );
  }
}
