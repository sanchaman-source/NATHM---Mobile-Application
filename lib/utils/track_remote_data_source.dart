import 'package:dio/dio.dart';
import 'package:natham_college/model/track_application_model.dart';
import 'package:natham_college/model/track_document_model.dart';
import 'dart:convert';
import 'dart:typed_data';

class TrackRemoteDataSource {
  final Dio _dio;
  TrackRemoteDataSource(this._dio);

  String _clean(String applicationNo) =>
      Uri.encodeComponent(applicationNo.trim().toUpperCase());

  Future<TrackApplication> trackApplication(String applicationNo) async {
    final body = await _get('/admissions/track/${_clean(applicationNo)}');
    return TrackApplication.fromJson(body['data'] as Map<String, dynamic>);
  }

  Future<List<TrackDocument>> getDocuments(String applicationNo) async {
    final body = await _get(
      '/admissions/track/${_clean(applicationNo)}/documents',
    );
    final list = (body['data'] as List?) ?? [];
    return list
        .map((e) => TrackDocument.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Map<String, dynamic>> _get(String path) async {
    try {
      final res = await _dio.get(path);
      final body = res.data as Map<String, dynamic>;
      if (body['success'] != true || body['data'] == null) {
        throw Exception(body['message'] ?? 'Application not found');
      }
      return body;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception('Server is waking up, please try again in a moment.');
        case DioExceptionType.connectionError:
          throw Exception('No internet connection.');
        default:
          if (e.response?.statusCode == 404) {
            throw Exception('Application not found');
          }
          throw Exception('Something went wrong. Please try again.');
      }
    }
  }

  Future<Uint8List> downloadAdmitCard(String applicationNo) async {
    try {
      final res = await _dio.get<List<int>>(
        '/admissions/track/${_clean(applicationNo)}/admit-card',
        options: Options(
          responseType: ResponseType.bytes,
          validateStatus: (_) => true, // we inspect the response ourselves
        ),
      );

      final bytes = Uint8List.fromList(res.data ?? const []);
      final contentType = res.headers.value(Headers.contentTypeHeader) ?? '';
      final isPdf = contentType.contains('pdf') || _startsWithPdfHeader(bytes);

      if (res.statusCode == 200 && isPdf) return bytes;

      throw Exception(_errorMessageFrom(bytes));
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception('Server is waking up, please try again in a moment.');
        case DioExceptionType.connectionError:
          throw Exception('No internet connection.');
        default:
          throw Exception('Something went wrong. Please try again.');
      }
    }
  }

  // PDF files always start with "%PDF"
  bool _startsWithPdfHeader(Uint8List b) =>
      b.length > 4 &&
      b[0] == 0x25 &&
      b[1] == 0x50 &&
      b[2] == 0x44 &&
      b[3] == 0x46;

  String _errorMessageFrom(Uint8List bytes) {
    try {
      final json = jsonDecode(utf8.decode(bytes));
      final msg = json is Map ? json['message'] : null;
      if (msg is String && msg.trim().isNotEmpty) return msg;
    } catch (_) {}
    return 'Could not download the admit card. Please try again.';
  }
}
