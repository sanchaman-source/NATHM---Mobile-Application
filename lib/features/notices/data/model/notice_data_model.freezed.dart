// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticesData {

 List<Notice> get items; List<NoticeCategory> get categories; int get total;@JsonKey(name: 'category_count') int get categoryCount;@JsonKey(name: 'current_academic_year') String? get currentAcademicYear;@JsonKey(name: 'update_frequency') String? get updateFrequency;
/// Create a copy of NoticesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoticesDataCopyWith<NoticesData> get copyWith => _$NoticesDataCopyWithImpl<NoticesData>(this as NoticesData, _$identity);

  /// Serializes this NoticesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoticesData&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.total, total) || other.total == total)&&(identical(other.categoryCount, categoryCount) || other.categoryCount == categoryCount)&&(identical(other.currentAcademicYear, currentAcademicYear) || other.currentAcademicYear == currentAcademicYear)&&(identical(other.updateFrequency, updateFrequency) || other.updateFrequency == updateFrequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(categories),total,categoryCount,currentAcademicYear,updateFrequency);

@override
String toString() {
  return 'NoticesData(items: $items, categories: $categories, total: $total, categoryCount: $categoryCount, currentAcademicYear: $currentAcademicYear, updateFrequency: $updateFrequency)';
}


}

/// @nodoc
abstract mixin class $NoticesDataCopyWith<$Res>  {
  factory $NoticesDataCopyWith(NoticesData value, $Res Function(NoticesData) _then) = _$NoticesDataCopyWithImpl;
@useResult
$Res call({
 List<Notice> items, List<NoticeCategory> categories, int total,@JsonKey(name: 'category_count') int categoryCount,@JsonKey(name: 'current_academic_year') String? currentAcademicYear,@JsonKey(name: 'update_frequency') String? updateFrequency
});




}
/// @nodoc
class _$NoticesDataCopyWithImpl<$Res>
    implements $NoticesDataCopyWith<$Res> {
  _$NoticesDataCopyWithImpl(this._self, this._then);

  final NoticesData _self;
  final $Res Function(NoticesData) _then;

/// Create a copy of NoticesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? categories = null,Object? total = null,Object? categoryCount = null,Object? currentAcademicYear = freezed,Object? updateFrequency = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Notice>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<NoticeCategory>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,categoryCount: null == categoryCount ? _self.categoryCount : categoryCount // ignore: cast_nullable_to_non_nullable
as int,currentAcademicYear: freezed == currentAcademicYear ? _self.currentAcademicYear : currentAcademicYear // ignore: cast_nullable_to_non_nullable
as String?,updateFrequency: freezed == updateFrequency ? _self.updateFrequency : updateFrequency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NoticesData].
extension NoticesDataPatterns on NoticesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoticesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoticesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoticesData value)  $default,){
final _that = this;
switch (_that) {
case _NoticesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoticesData value)?  $default,){
final _that = this;
switch (_that) {
case _NoticesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Notice> items,  List<NoticeCategory> categories,  int total, @JsonKey(name: 'category_count')  int categoryCount, @JsonKey(name: 'current_academic_year')  String? currentAcademicYear, @JsonKey(name: 'update_frequency')  String? updateFrequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoticesData() when $default != null:
return $default(_that.items,_that.categories,_that.total,_that.categoryCount,_that.currentAcademicYear,_that.updateFrequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Notice> items,  List<NoticeCategory> categories,  int total, @JsonKey(name: 'category_count')  int categoryCount, @JsonKey(name: 'current_academic_year')  String? currentAcademicYear, @JsonKey(name: 'update_frequency')  String? updateFrequency)  $default,) {final _that = this;
switch (_that) {
case _NoticesData():
return $default(_that.items,_that.categories,_that.total,_that.categoryCount,_that.currentAcademicYear,_that.updateFrequency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Notice> items,  List<NoticeCategory> categories,  int total, @JsonKey(name: 'category_count')  int categoryCount, @JsonKey(name: 'current_academic_year')  String? currentAcademicYear, @JsonKey(name: 'update_frequency')  String? updateFrequency)?  $default,) {final _that = this;
switch (_that) {
case _NoticesData() when $default != null:
return $default(_that.items,_that.categories,_that.total,_that.categoryCount,_that.currentAcademicYear,_that.updateFrequency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoticesData implements NoticesData {
  const _NoticesData({required final  List<Notice> items, required final  List<NoticeCategory> categories, required this.total, @JsonKey(name: 'category_count') required this.categoryCount, @JsonKey(name: 'current_academic_year') this.currentAcademicYear, @JsonKey(name: 'update_frequency') this.updateFrequency}): _items = items,_categories = categories;
  factory _NoticesData.fromJson(Map<String, dynamic> json) => _$NoticesDataFromJson(json);

 final  List<Notice> _items;
@override List<Notice> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<NoticeCategory> _categories;
@override List<NoticeCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  int total;
@override@JsonKey(name: 'category_count') final  int categoryCount;
@override@JsonKey(name: 'current_academic_year') final  String? currentAcademicYear;
@override@JsonKey(name: 'update_frequency') final  String? updateFrequency;

/// Create a copy of NoticesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoticesDataCopyWith<_NoticesData> get copyWith => __$NoticesDataCopyWithImpl<_NoticesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoticesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoticesData&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.total, total) || other.total == total)&&(identical(other.categoryCount, categoryCount) || other.categoryCount == categoryCount)&&(identical(other.currentAcademicYear, currentAcademicYear) || other.currentAcademicYear == currentAcademicYear)&&(identical(other.updateFrequency, updateFrequency) || other.updateFrequency == updateFrequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_categories),total,categoryCount,currentAcademicYear,updateFrequency);

@override
String toString() {
  return 'NoticesData(items: $items, categories: $categories, total: $total, categoryCount: $categoryCount, currentAcademicYear: $currentAcademicYear, updateFrequency: $updateFrequency)';
}


}

/// @nodoc
abstract mixin class _$NoticesDataCopyWith<$Res> implements $NoticesDataCopyWith<$Res> {
  factory _$NoticesDataCopyWith(_NoticesData value, $Res Function(_NoticesData) _then) = __$NoticesDataCopyWithImpl;
@override @useResult
$Res call({
 List<Notice> items, List<NoticeCategory> categories, int total,@JsonKey(name: 'category_count') int categoryCount,@JsonKey(name: 'current_academic_year') String? currentAcademicYear,@JsonKey(name: 'update_frequency') String? updateFrequency
});




}
/// @nodoc
class __$NoticesDataCopyWithImpl<$Res>
    implements _$NoticesDataCopyWith<$Res> {
  __$NoticesDataCopyWithImpl(this._self, this._then);

  final _NoticesData _self;
  final $Res Function(_NoticesData) _then;

/// Create a copy of NoticesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? categories = null,Object? total = null,Object? categoryCount = null,Object? currentAcademicYear = freezed,Object? updateFrequency = freezed,}) {
  return _then(_NoticesData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Notice>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<NoticeCategory>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,categoryCount: null == categoryCount ? _self.categoryCount : categoryCount // ignore: cast_nullable_to_non_nullable
as int,currentAcademicYear: freezed == currentAcademicYear ? _self.currentAcademicYear : currentAcademicYear // ignore: cast_nullable_to_non_nullable
as String?,updateFrequency: freezed == updateFrequency ? _self.updateFrequency : updateFrequency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
