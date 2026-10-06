import 'package:natham_college/screen/study/model/training.dart';
import 'package:natham_college/screen/study/model/training_remote_data_source.dart';

class TrainingRepository {
  final TrainingRemoteDataSource _remote;
  TrainingRepository(this._remote);

  Future<List<Training>> getPublicTrainings() async {
    final items = await _remote.getPublicTrainings();
    final published = items.where((t) => t.isPublished).toList()
      ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
    return published;
  }

  Future<Training> getPublicTrainingBySlug(String slug) =>
      _remote.getPublicTrainingBySlug(slug);
}