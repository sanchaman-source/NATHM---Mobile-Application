import 'package:natham_college/model/download_document.dart';

import 'downloads_remote_data_source.dart';

class DownloadsRepository {
  final DownloadsRemoteDataSource _remote;
  DownloadsRepository(this._remote);

  Future<List<DownloadDocument>> getDocuments() => _remote.getDocuments();
}