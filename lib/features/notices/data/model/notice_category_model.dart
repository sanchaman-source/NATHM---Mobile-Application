import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_category_model.freezed.dart';
part 'notice_category_model.g.dart';

@freezed
abstract class NoticeCategory with _$NoticeCategory {
  const factory NoticeCategory({
    required String id,
    required String name,
    required String slug,
    @JsonKey(name: 'display_order') required int displayOrder,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _NoticeCategory;

  factory NoticeCategory.fromJson(Map<String, dynamic> json) =>
      _$NoticeCategoryFromJson(json);
}