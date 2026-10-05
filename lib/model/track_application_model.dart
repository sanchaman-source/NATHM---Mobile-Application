import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_application_model.freezed.dart';
part 'track_application_model.g.dart';

@freezed
abstract class TrackApplication with _$TrackApplication {
  const TrackApplication._();

  const factory TrackApplication({
    required String id,
    @JsonKey(name: 'application_no') required String applicationNo,
    @JsonKey(name: 'full_name_en') String? fullNameEn,
    @JsonKey(name: 'full_name_np') String? fullNameNp,
    @JsonKey(name: 'program_name') String? programName,
    @JsonKey(name: 'course_name') String? courseName,
    String? status,
    String? photo,
    String? category,
    @JsonKey(name: 'is_payment_completed')
    @Default(false)
    bool isPaymentCompleted,
    @JsonKey(name: 'payment_amount') @Default(0) num paymentAmount,
    @JsonKey(name: 'payment_paid_amount') @Default(0) num paymentPaidAmount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TrackApplication;

  factory TrackApplication.fromJson(Map<String, dynamic> json) =>
      _$TrackApplicationFromJson(json);

  /// Remaining amount to pay (never negative)
  num get remainingDue {
    final due = paymentAmount - paymentPaidAmount;
    return due < 0 ? 0 : due;
  }
}