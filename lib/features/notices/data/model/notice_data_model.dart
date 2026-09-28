import 'package:freezed_annotation/freezed_annotation.dart';
import 'notice_model.dart';
import 'notice_category_model.dart';

part 'notice_data_model.freezed.dart';
part 'notice_data_model.g.dart';

@freezed
abstract class NoticesData with _$NoticesData {
  const factory NoticesData({
    required List<Notice> items,
    required List<NoticeCategory> categories,
    required int total,
    @JsonKey(name: 'category_count') required int categoryCount,
    @JsonKey(name: 'current_academic_year') String? currentAcademicYear,
    @JsonKey(name: 'update_frequency') String? updateFrequency,
  }) = _NoticesData;

  factory NoticesData.fromJson(Map<String, dynamic> json) =>
      _$NoticesDataFromJson(json);
}