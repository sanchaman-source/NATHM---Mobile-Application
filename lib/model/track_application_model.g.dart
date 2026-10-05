// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackApplication _$TrackApplicationFromJson(Map<String, dynamic> json) =>
    _TrackApplication(
      id: json['id'] as String,
      applicationNo: json['application_no'] as String,
      fullNameEn: json['full_name_en'] as String?,
      fullNameNp: json['full_name_np'] as String?,
      programName: json['program_name'] as String?,
      courseName: json['course_name'] as String?,
      status: json['status'] as String?,
      photo: json['photo'] as String?,
      category: json['category'] as String?,
      isPaymentCompleted: json['is_payment_completed'] as bool? ?? false,
      paymentAmount: json['payment_amount'] as num? ?? 0,
      paymentPaidAmount: json['payment_paid_amount'] as num? ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TrackApplicationToJson(_TrackApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'application_no': instance.applicationNo,
      'full_name_en': instance.fullNameEn,
      'full_name_np': instance.fullNameNp,
      'program_name': instance.programName,
      'course_name': instance.courseName,
      'status': instance.status,
      'photo': instance.photo,
      'category': instance.category,
      'is_payment_completed': instance.isPaymentCompleted,
      'payment_amount': instance.paymentAmount,
      'payment_paid_amount': instance.paymentPaidAmount,
      'created_at': instance.createdAt?.toIso8601String(),
    };
