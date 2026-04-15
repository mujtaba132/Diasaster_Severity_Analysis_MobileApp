import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

class CloudinaryService {
  final String cloudName = "dx6o3ymbb";
  final String imagePreset = "Images";
  final String videoPreset = "Videos";

  Future<String?> uploadFile({
    required String filePath,
    required bool isVideo,
  }) async {
    final preset = isVideo ? videoPreset : imagePreset;

    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$cloudName/${isVideo ? "video" : "image"}/upload",
    );

    var request = http.MultipartRequest("POST", url);
    request.fields['upload_preset'] = preset;

    var file = File(filePath);
    var length = await file.length();

    var stream = http.ByteStream(file.openRead());


    var multipartFile = http.MultipartFile(
      'file',
      stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            sink.add(data);
          },
        ),
      ),
      length,
      filename: file.path.split('/').last,
    );

    request.files.add(multipartFile);

    var response = await request.send();
    var res = await http.Response.fromStream(response);

    if (res.statusCode == 200) {
      final jsonData = json.decode(res.body);
      return jsonData['secure_url'];
    } else {
      throw GeneralException("Uploading failed");
    }
  }
}