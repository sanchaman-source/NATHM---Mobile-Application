// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoticeCategory _$NoticeCategoryFromJson(Map<String, dynamic> json) =>
    _NoticeCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      displayOrder: (json['display_order'] as num).toInt(),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$NoticeCategoryToJson(_NoticeCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'display_order': instance.displayOrder,
      'is_active': instance.isActive,
    };
