import 'package:natham_college/features/notices/data/model/notice_data_model.dart';
import 'package:natham_college/features/notices/data/notice_remote_data_source.dart';

class NoticeRepository {
  final NoticeRemoteDataSource _remoteDataSource;
  NoticeRepository(this._remoteDataSource);

  Future<NoticesData> getNotices() => _remoteDataSource.getNotices();
}