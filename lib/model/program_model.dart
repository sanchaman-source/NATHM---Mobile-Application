
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_model.freezed.dart';
part 'program_model.g.dart';

@freezed
abstract class Program with _$Program {
  const factory Program({
    required String id,
    @JsonKey(name: 'campus_id') required String campusId,
    required String name,
    @JsonKey(name: 'name_np') String? nameNp,
    String? code,
    String? about,
    @JsonKey(name: 'about_np') String? aboutNp,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'display_order') @Default(0) int displayOrder,
    @JsonKey(name: 'campus_name') String? campusName,
    @JsonKey(name: 'campus_name_np') String? campusNameNp,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);
}