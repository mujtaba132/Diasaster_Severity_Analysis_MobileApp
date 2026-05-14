import 'dart:io';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/storage/media_storage/local_media_storage.dart';
import 'package:fyp_project/storage/sqlLite_storage/sqllite_operations.dart';

class SQLLiteMediaRepository {
  final sqlDatabase = SQLLiteOperations();
  final storage = LocalMediaStorage();

  Future<String> storeFile(File file) async {
    try {
      final path = await storage.saveFileLocally(file);
      return path;
    } on TimeoutException {
      throw TimeoutException('');
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  // INSERT
  Future<void> insertData(MediaModel media) async {
    final data = media.toJson();

    try {
      await sqlDatabase.insertTable(data, 'media');
    } on TimeoutException {
      throw TimeoutException('');
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  // GET ALL
  Future<List<MediaModel>> getMediaList() async {
    List<MediaModel> data = [];

    try {
      final maps = await sqlDatabase.getTableList('media');

      data = maps.map((e) {
        return MediaModel.fromJson(Map<String, dynamic>.from(e));
      }).toList();

      return data;
    } on TimeoutException {
      throw TimeoutException('');
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  // UPDATE
  Future<void> updateData(MediaModel media, String tableName) async {
    final data = media.toJson();

    try {
      await sqlDatabase.updateTable(data, 'media');
    } on TimeoutException {
      throw TimeoutException('');
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  // DELETE
  Future<void> deleteData(String reportId) async {
    try {
      await sqlDatabase.deleteTable(reportId, 'media');
    } on TimeoutException {
      throw TimeoutException('');
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
