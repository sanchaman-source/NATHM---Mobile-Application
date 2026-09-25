import 'dart:io';
import 'package:natham_college/model/track_document_model.dart';
import 'package:path_provider/path_provider.dart';
import 'track_remote_data_source.dart';
import 'track_result.dart';

class TrackRepository {
  final TrackRemoteDataSource _remote;
  TrackRepository(this._remote);

  Future<TrackResult> track(String applicationNo) async {
    final appFuture = _remote.trackApplication(applicationNo);
    final docsFuture = _remote
        .getDocuments(applicationNo)
        .catchError((_) => <TrackDocument>[]);

    final application = await appFuture;
    final documents = await docsFuture;

    return TrackResult(application: application, documents: documents);
  }

  Future<File> downloadAdmitCard(String applicationNo) async {
    final bytes = await _remote.downloadAdmitCard(applicationNo);
    final dir = await getTemporaryDirectory();
    final safeName = applicationNo.trim().toUpperCase().replaceAll(
      RegExp(r'[^A-Z0-9\-]'),
      '_',
    );
    final file = File('${dir.path}/admit_card_$safeName.pdf');
    return file.writeAsBytes(bytes, flush: true);
  }
}
