// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => _RoleModel(
  id: json['id'] as String,
  name: json['name'] as String,
  permissions:
      (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$RoleModelToJson(_RoleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permissions': instance.permissions,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  employeeId: json['employee_id'] as String?,
  role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'employee_id': instance.employeeId,
      'role': instance.role,
    };
