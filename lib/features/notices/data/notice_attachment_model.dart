import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_attachment_model.freezed.dart';
part 'notice_attachment_model.g.dart';

@freezed
abstract class NoticeAttachment with _$NoticeAttachment {
  const factory NoticeAttachment({
    required String id,
    @JsonKey(name: 'file_url') required String fileUrl,
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'content_type') required String contentType,
    @JsonKey(name: 'size_bytes') required int sizeBytes,
  }) = _NoticeAttachment;

  factory NoticeAttachment.fromJson(Map<String, dynamic> json) =>
      _$NoticeAttachmentFromJson(json);
}