import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fyp_project/data/networks/network_services_api.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';

class ModelPredictRepository {
  final _apiService = NetworkServicesApi();

  Future<Map<String, dynamic>> predictImage(
    File preDisaster,
    File postDisaster,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        "pre_image": await MultipartFile.fromFile(
          preDisaster.path,
          filename: preDisaster.path.split('/').last,
        ),
        "post_image": await MultipartFile.fromFile(
          postDisaster.path,
          filename: postDisaster.path.split('/').last,
        ),
      });

      final response = await _apiService.postAPI(
        'https://disaster-backend-5ekh.onrender.com/reports/create',
        formData,
        null,
      );

      return response as Map<String, dynamic>;
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
