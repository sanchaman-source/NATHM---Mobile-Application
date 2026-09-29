import 'package:dio/dio.dart';
import 'package:natham_college/model/api_response_model.dart';
import 'package:natham_college/features/notices/data/model/notice_data_model.dart';

class NoticeRemoteDataSource {
  final Dio _dio;
  NoticeRemoteDataSource(this._dio);

  Future<NoticesData> getNotices() async {
    try {
      final response = await _dio.get('/notices');
      final apiResponse = ApiResponse<NoticesData>.fromJson(
        response.data,
        (json) => NoticesData.fromJson(json as Map<String, dynamic>),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final data = apiResponse.data;
      if (data == null) {
        throw Exception('No data received from server');
      }

      return data;
    } catch (e) {
      throw Exception('Failed to fetch notices');
    }
  }
}
