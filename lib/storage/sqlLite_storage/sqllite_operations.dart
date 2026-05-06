import 'package:fyp_project/storage/sqlLite_storage/sql_lite_storage.dart';
import 'package:sqflite/sqflite.dart';

class SQLLiteOperations {
  
  final SqlLiteStorage dbHelper = SqlLiteStorage();

      

  // INSERT
  Future<int> insertTable(Map<String,dynamic> data,String tableName) async {
    final db = await dbHelper.database;

    return await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // GET ALL
  Future<List<Map<String, dynamic>>> getTableList(String tableName) async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);
    
    return maps;
  }

  // UPDATE
  Future<int> updateTable(Map<String,dynamic> data, String tableName) async {
    final db = await dbHelper.database;

    return await db.update(
      tableName,
      data,
      where: 'report_id = ?',
      whereArgs: data['report_id'],
    );
  }

  // DELETE
  Future<int> deleteTable(String reportId,String tableName) async {
    final db = await dbHelper.database;

    return await db.delete(
      tableName,
      where: 'report_id = ?',
      whereArgs: [reportId],
    );
  }
}