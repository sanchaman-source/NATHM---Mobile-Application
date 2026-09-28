// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notice _$NoticeFromJson(Map<String, dynamic> json) => _Notice(
  id: json['id'] as String,
  title: json['title'] as String,
  slug: json['slug'] as String,
  shortDescription: json['short_description'] as String?,
  content: json['content'] as String?,
  categoryId: json['category_id'] as String,
  category: json['category'] as String,
  categorySlug: json['category_slug'] as String,
  publishedDate: json['published_date'] as String,
  academicYear: json['academic_year'] as String?,
  reference: json['reference'] as String?,
  featured: json['featured'] as bool,
  status: json['status'] as String,
  displayOrder: (json['display_order'] as num).toInt(),
  coverImage: json['cover_image'] as String?,
  expiryDate: json['expiry_date'] as String?,
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => NoticeAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$NoticeToJson(_Notice instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'short_description': instance.shortDescription,
  'content': instance.content,
  'category_id': instance.categoryId,
  'category': instance.category,
  'category_slug': instance.categorySlug,
  'published_date': instance.publishedDate,
  'academic_year': instance.academicYear,
  'reference': instance.reference,
  'featured': instance.featured,
  'status': instance.status,
  'display_order': instance.displayOrder,
  'cover_image': instance.coverImage,
  'expiry_date': instance.expiryDate,
  'attachments': instance.attachments,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
