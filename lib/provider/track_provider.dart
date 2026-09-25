import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:natham_college/core/network/provider.dart';
import 'package:natham_college/utils/track_remote_data_source.dart';
import 'package:natham_college/utils/track_repository.dart';
import 'package:natham_college/utils/track_result.dart';


final trackRemoteDataSourceProvider = Provider<TrackRemoteDataSource>(
  (ref) => TrackRemoteDataSource(ref.watch(dioProvider)),
);

final trackRepositoryProvider = Provider<TrackRepository>(
  (ref) => TrackRepository(ref.watch(trackRemoteDataSourceProvider)),
);

enum TrackStatus { idle, loading, success, error }

class TrackState {
  final TrackStatus status;
  final TrackResult? result;
  final String? error;

  const TrackState({this.status = TrackStatus.idle, this.result, this.error});
}

class TrackController extends StateNotifier<TrackState> {
  TrackController(this._repo) : super(const TrackState());

  final TrackRepository _repo;
  String? _latest; // ignore stale responses if user taps Track again

  Future<void> track(String input) async {
    final applicationNo = input.trim();

    if (applicationNo.isEmpty) {
      state = const TrackState(
        status: TrackStatus.error,
        error: 'Please enter your application number',
      );
      return;
    }

    _latest = applicationNo;
    state = const TrackState(status: TrackStatus.loading);

    try {
      final result = await _repo.track(applicationNo);
      if (!mounted || _latest != applicationNo) return;
      state = TrackState(status: TrackStatus.success, result: result);
    } catch (e) {
      if (!mounted || _latest != applicationNo) return;
      state = TrackState(
        status: TrackStatus.error,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  void reset() => state = const TrackState();
}

final trackControllerProvider =
    StateNotifierProvider.autoDispose<TrackController, TrackState>(
  (ref) => TrackController(ref.watch(trackRepositoryProvider)),
);