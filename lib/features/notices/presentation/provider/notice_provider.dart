import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:natham_college/core/network/provider.dart';
import 'package:natham_college/features/notices/data/model/notice_data_model.dart';
import '../../data/notice_remote_data_source.dart';
import '../../domain/notice_repository.dart';

final noticeRepositoryProvider = Provider<NoticeRepository>((ref) {
  return NoticeRepository(NoticeRemoteDataSource(ref.read(dioProvider)));
});

final noticesProvider = FutureProvider<NoticesData>((ref) async {
  final repo = ref.read(noticeRepositoryProvider);
  return repo.getNotices();
});