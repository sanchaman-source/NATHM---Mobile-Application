import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:natham_college/provider/track_provider.dart';
import 'package:natham_college/utils/track_repository.dart';


enum AdmitCardStatus { idle, loading, success, error }

class AdmitCardState {
  final AdmitCardStatus status;
  final String? filePath;
  final String? error;

  const AdmitCardState({
    this.status = AdmitCardStatus.idle,
    this.filePath,
    this.error,
  });
}

class AdmitCardController extends StateNotifier<AdmitCardState> {
  AdmitCardController(this._repo) : super(const AdmitCardState());

  final TrackRepository _repo;

  Future<void> download(String input) async {
    final applicationNo = input.trim();

    if (applicationNo.isEmpty) {
      state = const AdmitCardState(
        status: AdmitCardStatus.error,
        error: 'Please enter your application number',
      );
      return;
    }

    state = const AdmitCardState(status: AdmitCardStatus.loading);

    try {
      final file = await _repo.downloadAdmitCard(applicationNo);
      if (!mounted) return;
      state = AdmitCardState(status: AdmitCardStatus.success, filePath: file.path);
    } catch (e) {
      if (!mounted) return;
      state = AdmitCardState(
        status: AdmitCardStatus.error,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }
}

final admitCardControllerProvider =
    StateNotifierProvider.autoDispose<AdmitCardController, AdmitCardState>(
  (ref) => AdmitCardController(ref.watch(trackRepositoryProvider)),
);