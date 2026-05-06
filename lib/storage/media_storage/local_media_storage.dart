import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalMediaStorage {
    
  Future<String> saveFileLocally(File file) async {
  final directory = await getApplicationDocumentsDirectory();

  final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  final savedFile = File('${directory.path}/$fileName');

  return (await file.copy(savedFile.path)).path;
}

}