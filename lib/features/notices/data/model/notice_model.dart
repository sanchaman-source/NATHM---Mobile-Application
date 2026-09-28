import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natham_college/features/notices/data/notice_attachment_model.dart';

part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

@freezed
abstract class Notice with _$Notice {
  const factory Notice({
    required String id,
    required String title,
    required String slug,
    @JsonKey(name: 'short_description') String? shortDescription,
    String? content,
    @JsonKey(name: 'category_id') required String categoryId,
    required String category,
    @JsonKey(name: 'category_slug') required String categorySlug,
    @JsonKey(name: 'published_date') required String publishedDate,
    @JsonKey(name: 'academic_year') String? academicYear,
    String? reference,
    required bool featured,
    required String status,
    @JsonKey(name: 'display_order') required int displayOrder,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'expiry_date') String? expiryDate,
    required List<NoticeAttachment> attachments,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) =>
      _$NoticeFromJson(json);
}