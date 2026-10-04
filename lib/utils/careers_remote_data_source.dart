import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:natham_college/model/career_job.dart';
import 'package:natham_college/utils/dio_client.dart';
import '../model/job_application_request.dart';

class CareersRemoteDataSource {
  final Dio _dio;
  CareersRemoteDataSource(this._dio);

  Future<void> submitApplication({
    required JobApplicationRequest request,
    String? resumePath,
    String? resumeName,
  }) async {
    var resumeUrl = '';
    if (resumePath != null) {
      resumeUrl = await _uploadResume(resumePath, resumeName);
    }
    await _apply(request, resumeUrl);
  }

  Future<String> _uploadResume(String path, String? name) async {
    try {
      final form = FormData.fromMap({
        'file': await MultipartFile.fromFile(path, filename: name),
      });
      final res = await _dio.post(
        '/recruitment/applications/upload-resume',
        data: form,
      );
      final body = res.data as Map<String, dynamic>;
      if (body['success'] != true) {
        throw Exception(body['message'] ?? 'Resume upload failed');
      }
      return body['data']['file_url'] as String;
    } on DioException catch (e) {
      throw Exception(_messageFrom(e, 'Resume upload failed'));
    }
  }

  Future<void> _apply(JobApplicationRequest req, String resumeUrl) async {
    try {
      final payload = req.toJson()..['resume_url'] = resumeUrl;
      final res = await _dio.post('/recruitment/jobs/apply', data: payload);
      final body = res.data as Map<String, dynamic>;
      if (body['success'] != true) {
        throw Exception(body['message'] ?? 'Application failed');
      }
    } on DioException catch (e) {
      throw Exception(_messageFrom(e, 'Application failed'));
    }
  }

  String _messageFrom(DioException e, String fallback) {
    final data = e.response?.data;
    if (data is Map) {
      final errors = data['errors'];
      if (errors is List && errors.isNotEmpty) {
        // 422 validation: "email: Field required" jasto
        return errors.map((x) {
          final loc = (x['loc'] as List?)?.last ?? '';
          return '$loc: ${x['msg']}';
        }).join('\n');
      }
      if (data['message'] is String) return data['message'] as String;
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Server is taking too long. Please try again.';
    }
    return fallback;
  }


  Future<List<CareerJob>> getActiveJobs() async {
  try {
    final res = await _dio.get('/recruitment/jobs/active');
    final body = res.data as Map<String, dynamic>;
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Failed to load jobs');
    }
    final list = (body['data'] as List?) ?? [];
    return list
        .map((e) => CareerJob.fromJson(e as Map<String, dynamic>))
        .toList();
  } on DioException catch (e) {
    throw Exception(_messageFrom(e, 'Failed to load jobs'));
  }
}
}

final careersRemoteProvider = Provider<CareersRemoteDataSource>(
  (ref) => CareersRemoteDataSource(DioClient.create()),
);

final activeJobsProvider = FutureProvider.autoDispose<List<CareerJob>>(
  (ref) => ref.read(careersRemoteProvider).getActiveJobs(),
);