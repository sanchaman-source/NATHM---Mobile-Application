import 'package:natham_college/model/track_application_model.dart';
import 'package:natham_college/model/track_document_model.dart';

class TrackResult {
  final TrackApplication application;
  final List<TrackDocument> documents;

  const TrackResult({required this.application, required this.documents});
}