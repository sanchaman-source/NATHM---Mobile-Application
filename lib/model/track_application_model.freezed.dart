// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackApplication {

 String get id;@JsonKey(name: 'application_no') String get applicationNo;@JsonKey(name: 'full_name_en') String? get fullNameEn;@JsonKey(name: 'full_name_np') String? get fullNameNp;@JsonKey(name: 'program_name') String? get programName;@JsonKey(name: 'course_name') String? get courseName; String? get status; String? get photo; String? get category;@JsonKey(name: 'is_payment_completed') bool get isPaymentCompleted;@JsonKey(name: 'payment_amount') num get paymentAmount;@JsonKey(name: 'payment_paid_amount') num get paymentPaidAmount;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of TrackApplication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackApplicationCopyWith<TrackApplication> get copyWith => _$TrackApplicationCopyWithImpl<TrackApplication>(this as TrackApplication, _$identity);

  /// Serializes this TrackApplication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackApplication&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationNo, applicationNo) || other.applicationNo == applicationNo)&&(identical(other.fullNameEn, fullNameEn) || other.fullNameEn == fullNameEn)&&(identical(other.fullNameNp, fullNameNp) || other.fullNameNp == fullNameNp)&&(identical(other.programName, programName) || other.programName == programName)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.status, status) || other.status == status)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPaymentCompleted, isPaymentCompleted) || other.isPaymentCompleted == isPaymentCompleted)&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.paymentPaidAmount, paymentPaidAmount) || other.paymentPaidAmount == paymentPaidAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationNo,fullNameEn,fullNameNp,programName,courseName,status,photo,category,isPaymentCompleted,paymentAmount,paymentPaidAmount,createdAt);

@override
String toString() {
  return 'TrackApplication(id: $id, applicationNo: $applicationNo, fullNameEn: $fullNameEn, fullNameNp: $fullNameNp, programName: $programName, courseName: $courseName, status: $status, photo: $photo, category: $category, isPaymentCompleted: $isPaymentCompleted, paymentAmount: $paymentAmount, paymentPaidAmount: $paymentPaidAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrackApplicationCopyWith<$Res>  {
  factory $TrackApplicationCopyWith(TrackApplication value, $Res Function(TrackApplication) _then) = _$TrackApplicationCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'application_no') String applicationNo,@JsonKey(name: 'full_name_en') String? fullNameEn,@JsonKey(name: 'full_name_np') String? fullNameNp,@JsonKey(name: 'program_name') String? programName,@JsonKey(name: 'course_name') String? courseName, String? status, String? photo, String? category,@JsonKey(name: 'is_payment_completed') bool isPaymentCompleted,@JsonKey(name: 'payment_amount') num paymentAmount,@JsonKey(name: 'payment_paid_amount') num paymentPaidAmount,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$TrackApplicationCopyWithImpl<$Res>
    implements $TrackApplicationCopyWith<$Res> {
  _$TrackApplicationCopyWithImpl(this._self, this._then);

  final TrackApplication _self;
  final $Res Function(TrackApplication) _then;

/// Create a copy of TrackApplication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationNo = null,Object? fullNameEn = freezed,Object? fullNameNp = freezed,Object? programName = freezed,Object? courseName = freezed,Object? status = freezed,Object? photo = freezed,Object? category = freezed,Object? isPaymentCompleted = null,Object? paymentAmount = null,Object? paymentPaidAmount = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationNo: null == applicationNo ? _self.applicationNo : applicationNo // ignore: cast_nullable_to_non_nullable
as String,fullNameEn: freezed == fullNameEn ? _self.fullNameEn : fullNameEn // ignore: cast_nullable_to_non_nullable
as String?,fullNameNp: freezed == fullNameNp ? _self.fullNameNp : fullNameNp // ignore: cast_nullable_to_non_nullable
as String?,programName: freezed == programName ? _self.programName : programName // ignore: cast_nullable_to_non_nullable
as String?,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isPaymentCompleted: null == isPaymentCompleted ? _self.isPaymentCompleted : isPaymentCompleted // ignore: cast_nullable_to_non_nullable
as bool,paymentAmount: null == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as num,paymentPaidAmount: null == paymentPaidAmount ? _self.paymentPaidAmount : paymentPaidAmount // ignore: cast_nullable_to_non_nullable
as num,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackApplication].
extension TrackApplicationPatterns on TrackApplication {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackApplication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackApplication() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackApplication value)  $default,){
final _that = this;
switch (_that) {
case _TrackApplication():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackApplication value)?  $default,){
final _that = this;
switch (_that) {
case _TrackApplication() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'application_no')  String applicationNo, @JsonKey(name: 'full_name_en')  String? fullNameEn, @JsonKey(name: 'full_name_np')  String? fullNameNp, @JsonKey(name: 'program_name')  String? programName, @JsonKey(name: 'course_name')  String? courseName,  String? status,  String? photo,  String? category, @JsonKey(name: 'is_payment_completed')  bool isPaymentCompleted, @JsonKey(name: 'payment_amount')  num paymentAmount, @JsonKey(name: 'payment_paid_amount')  num paymentPaidAmount, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackApplication() when $default != null:
return $default(_that.id,_that.applicationNo,_that.fullNameEn,_that.fullNameNp,_that.programName,_that.courseName,_that.status,_that.photo,_that.category,_that.isPaymentCompleted,_that.paymentAmount,_that.paymentPaidAmount,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'application_no')  String applicationNo, @JsonKey(name: 'full_name_en')  String? fullNameEn, @JsonKey(name: 'full_name_np')  String? fullNameNp, @JsonKey(name: 'program_name')  String? programName, @JsonKey(name: 'course_name')  String? courseName,  String? status,  String? photo,  String? category, @JsonKey(name: 'is_payment_completed')  bool isPaymentCompleted, @JsonKey(name: 'payment_amount')  num paymentAmount, @JsonKey(name: 'payment_paid_amount')  num paymentPaidAmount, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrackApplication():
return $default(_that.id,_that.applicationNo,_that.fullNameEn,_that.fullNameNp,_that.programName,_that.courseName,_that.status,_that.photo,_that.category,_that.isPaymentCompleted,_that.paymentAmount,_that.paymentPaidAmount,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'application_no')  String applicationNo, @JsonKey(name: 'full_name_en')  String? fullNameEn, @JsonKey(name: 'full_name_np')  String? fullNameNp, @JsonKey(name: 'program_name')  String? programName, @JsonKey(name: 'course_name')  String? courseName,  String? status,  String? photo,  String? category, @JsonKey(name: 'is_payment_completed')  bool isPaymentCompleted, @JsonKey(name: 'payment_amount')  num paymentAmount, @JsonKey(name: 'payment_paid_amount')  num paymentPaidAmount, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrackApplication() when $default != null:
return $default(_that.id,_that.applicationNo,_that.fullNameEn,_that.fullNameNp,_that.programName,_that.courseName,_that.status,_that.photo,_that.category,_that.isPaymentCompleted,_that.paymentAmount,_that.paymentPaidAmount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackApplication extends TrackApplication {
  const _TrackApplication({required this.id, @JsonKey(name: 'application_no') required this.applicationNo, @JsonKey(name: 'full_name_en') this.fullNameEn, @JsonKey(name: 'full_name_np') this.fullNameNp, @JsonKey(name: 'program_name') this.programName, @JsonKey(name: 'course_name') this.courseName, this.status, this.photo, this.category, @JsonKey(name: 'is_payment_completed') this.isPaymentCompleted = false, @JsonKey(name: 'payment_amount') this.paymentAmount = 0, @JsonKey(name: 'payment_paid_amount') this.paymentPaidAmount = 0, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _TrackApplication.fromJson(Map<String, dynamic> json) => _$TrackApplicationFromJson(json);

@override final  String id;
@override@JsonKey(name: 'application_no') final  String applicationNo;
@override@JsonKey(name: 'full_name_en') final  String? fullNameEn;
@override@JsonKey(name: 'full_name_np') final  String? fullNameNp;
@override@JsonKey(name: 'program_name') final  String? programName;
@override@JsonKey(name: 'course_name') final  String? courseName;
@override final  String? status;
@override final  String? photo;
@override final  String? category;
@override@JsonKey(name: 'is_payment_completed') final  bool isPaymentCompleted;
@override@JsonKey(name: 'payment_amount') final  num paymentAmount;
@override@JsonKey(name: 'payment_paid_amount') final  num paymentPaidAmount;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of TrackApplication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackApplicationCopyWith<_TrackApplication> get copyWith => __$TrackApplicationCopyWithImpl<_TrackApplication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackApplicationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackApplication&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationNo, applicationNo) || other.applicationNo == applicationNo)&&(identical(other.fullNameEn, fullNameEn) || other.fullNameEn == fullNameEn)&&(identical(other.fullNameNp, fullNameNp) || other.fullNameNp == fullNameNp)&&(identical(other.programName, programName) || other.programName == programName)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.status, status) || other.status == status)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPaymentCompleted, isPaymentCompleted) || other.isPaymentCompleted == isPaymentCompleted)&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.paymentPaidAmount, paymentPaidAmount) || other.paymentPaidAmount == paymentPaidAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationNo,fullNameEn,fullNameNp,programName,courseName,status,photo,category,isPaymentCompleted,paymentAmount,paymentPaidAmount,createdAt);

@override
String toString() {
  return 'TrackApplication(id: $id, applicationNo: $applicationNo, fullNameEn: $fullNameEn, fullNameNp: $fullNameNp, programName: $programName, courseName: $courseName, status: $status, photo: $photo, category: $category, isPaymentCompleted: $isPaymentCompleted, paymentAmount: $paymentAmount, paymentPaidAmount: $paymentPaidAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrackApplicationCopyWith<$Res> implements $TrackApplicationCopyWith<$Res> {
  factory _$TrackApplicationCopyWith(_TrackApplication value, $Res Function(_TrackApplication) _then) = __$TrackApplicationCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'application_no') String applicationNo,@JsonKey(name: 'full_name_en') String? fullNameEn,@JsonKey(name: 'full_name_np') String? fullNameNp,@JsonKey(name: 'program_name') String? programName,@JsonKey(name: 'course_name') String? courseName, String? status, String? photo, String? category,@JsonKey(name: 'is_payment_completed') bool isPaymentCompleted,@JsonKey(name: 'payment_amount') num paymentAmount,@JsonKey(name: 'payment_paid_amount') num paymentPaidAmount,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$TrackApplicationCopyWithImpl<$Res>
    implements _$TrackApplicationCopyWith<$Res> {
  __$TrackApplicationCopyWithImpl(this._self, this._then);

  final _TrackApplication _self;
  final $Res Function(_TrackApplication) _then;

/// Create a copy of TrackApplication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationNo = null,Object? fullNameEn = freezed,Object? fullNameNp = freezed,Object? programName = freezed,Object? courseName = freezed,Object? status = freezed,Object? photo = freezed,Object? category = freezed,Object? isPaymentCompleted = null,Object? paymentAmount = null,Object? paymentPaidAmount = null,Object? createdAt = freezed,}) {
  return _then(_TrackApplication(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationNo: null == applicationNo ? _self.applicationNo : applicationNo // ignore: cast_nullable_to_non_nullable
as String,fullNameEn: freezed == fullNameEn ? _self.fullNameEn : fullNameEn // ignore: cast_nullable_to_non_nullable
as String?,fullNameNp: freezed == fullNameNp ? _self.fullNameNp : fullNameNp // ignore: cast_nullable_to_non_nullable
as String?,programName: freezed == programName ? _self.programName : programName // ignore: cast_nullable_to_non_nullable
as String?,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isPaymentCompleted: null == isPaymentCompleted ? _self.isPaymentCompleted : isPaymentCompleted // ignore: cast_nullable_to_non_nullable
as bool,paymentAmount: null == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as num,paymentPaidAmount: null == paymentPaidAmount ? _self.paymentPaidAmount : paymentPaidAmount // ignore: cast_nullable_to_non_nullable
as num,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
