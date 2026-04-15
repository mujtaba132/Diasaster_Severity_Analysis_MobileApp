import 'package:flutter/material.dart';
import 'package:fyp_project/Cloudinary/DataUploadService.dart';
import 'package:fyp_project/config/components/CustomSnackbar.dart';


class UploadProvider extends ChangeNotifier {
  final CloudinaryService _service = CloudinaryService();

  bool _isUploading = false;
  double _progress = 0;
  String? _uploadedUrl;

  bool get isUploading => _isUploading;
  double get progress => _progress;
  String? get uploadedUrl => _uploadedUrl;

  Future<void> upload({
  required String path,
  required bool isVideo,
}) async {
  try {
    _isUploading = true;
    _progress = 0;
    _uploadedUrl = null;
    notifyListeners();

    final result = await _service.uploadFile(
      filePath: path,
      isVideo: isVideo,
    );

    if (result == null) {
      CustomSnackBar.error("Upload failed. Please try again.");
    } else {
      _uploadedUrl = result;
      CustomSnackBar.success("Upload successful.");
    }

  } catch (e) {
    CustomSnackBar.error("Something went wrong: ${e.toString()}");
  } finally {
    _isUploading = false;
    notifyListeners();
  }
}
}