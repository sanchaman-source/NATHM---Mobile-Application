// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedData<T> _$PaginatedDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginatedData<T>(
  items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedDataToJson<T>(
  _PaginatedData<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'items': instance.items.map(toJsonT).toList(),
  'total': instance.total,
  'page': instance.page,
  'size': instance.size,
  'pages': instance.pages,
};
