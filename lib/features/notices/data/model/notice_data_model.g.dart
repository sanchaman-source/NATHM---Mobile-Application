// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoticesData _$NoticesDataFromJson(Map<String, dynamic> json) => _NoticesData(
  items: (json['items'] as List<dynamic>)
      .map((e) => Notice.fromJson(e as Map<String, dynamic>))
      .toList(),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => NoticeCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  categoryCount: (json['category_count'] as num).toInt(),
  currentAcademicYear: json['current_academic_year'] as String?,
  updateFrequency: json['update_frequency'] as String?,
);

Map<String, dynamic> _$NoticesDataToJson(_NoticesData instance) =>
    <String, dynamic>{
      'items': instance.items,
      'categories': instance.categories,
      'total': instance.total,
      'category_count': instance.categoryCount,
      'current_academic_year': instance.currentAcademicYear,
      'update_frequency': instance.updateFrequency,
    };
