// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoticeAttachment _$NoticeAttachmentFromJson(Map<String, dynamic> json) =>
    _NoticeAttachment(
      id: json['id'] as String,
      fileUrl: json['file_url'] as String,
      fileName: json['file_name'] as String,
      contentType: json['content_type'] as String,
      sizeBytes: (json['size_bytes'] as num).toInt(),
    );

Map<String, dynamic> _$NoticeAttachmentToJson(_NoticeAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_url': instance.fileUrl,
      'file_name': instance.fileName,
      'content_type': instance.contentType,
      'size_bytes': instance.sizeBytes,
    };
