import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_data_model.freezed.dart';
part 'paginated_data_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedData<T> with _$PaginatedData<T> {
  const factory PaginatedData({
    required List<T> items,
    required int total,
    required int page,
    required int size,
    required int pages,
  }) = _PaginatedData<T>;

  factory PaginatedData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedDataFromJson(json, fromJsonT);
}