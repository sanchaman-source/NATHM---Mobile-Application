import 'package:dio/dio.dart';
import 'package:natham_college/model/download_document.dart';

class DownloadsRemoteDataSource {
  final Dio _dio;
  DownloadsRemoteDataSource(this._dio);

  Future<List<DownloadDocument>> getDocuments() async {
    final res = await _dio.get('/notices');
    final data = res.data['data'] as Map<String, dynamic>;
    final items = (data['items'] as List?) ?? const [];

    final docs = <DownloadDocument>[];
    for (final n in items) {
      final notice = n as Map<String, dynamic>;
      final attachments = (notice['attachments'] as List?) ?? const [];
      for (final a in attachments) {
        docs.add(DownloadDocument.fromNoticeJson(
          notice,
          a as Map<String, dynamic>,
        ));
      }
    }

    docs.sort((a, b) => (b.publishedDate ?? DateTime(1970))
        .compareTo(a.publishedDate ?? DateTime(1970)));
    return docs;
  }
}