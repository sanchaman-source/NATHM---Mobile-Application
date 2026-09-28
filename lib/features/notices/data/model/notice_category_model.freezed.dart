// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeCategory {

 String get id; String get name; String get slug;@JsonKey(name: 'display_order') int get displayOrder;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of NoticeCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoticeCategoryCopyWith<NoticeCategory> get copyWith => _$NoticeCategoryCopyWithImpl<NoticeCategory>(this as NoticeCategory, _$identity);

  /// Serializes this NoticeCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoticeCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,displayOrder,isActive);

@override
String toString() {
  return 'NoticeCategory(id: $id, name: $name, slug: $slug, displayOrder: $displayOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $NoticeCategoryCopyWith<$Res>  {
  factory $NoticeCategoryCopyWith(NoticeCategory value, $Res Function(NoticeCategory) _then) = _$NoticeCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$NoticeCategoryCopyWithImpl<$Res>
    implements $NoticeCategoryCopyWith<$Res> {
  _$NoticeCategoryCopyWithImpl(this._self, this._then);

  final NoticeCategory _self;
  final $Res Function(NoticeCategory) _then;

/// Create a copy of NoticeCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? displayOrder = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NoticeCategory].
extension NoticeCategoryPatterns on NoticeCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoticeCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoticeCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoticeCategory value)  $default,){
final _that = this;
switch (_that) {
case _NoticeCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoticeCategory value)?  $default,){
final _that = this;
switch (_that) {
case _NoticeCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoticeCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.displayOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _NoticeCategory():
return $default(_that.id,_that.name,_that.slug,_that.displayOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _NoticeCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.displayOrder,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoticeCategory implements NoticeCategory {
  const _NoticeCategory({required this.id, required this.name, required this.slug, @JsonKey(name: 'display_order') required this.displayOrder, @JsonKey(name: 'is_active') required this.isActive});
  factory _NoticeCategory.fromJson(Map<String, dynamic> json) => _$NoticeCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override@JsonKey(name: 'display_order') final  int displayOrder;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of NoticeCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoticeCategoryCopyWith<_NoticeCategory> get copyWith => __$NoticeCategoryCopyWithImpl<_NoticeCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoticeCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoticeCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,displayOrder,isActive);

@override
String toString() {
  return 'NoticeCategory(id: $id, name: $name, slug: $slug, displayOrder: $displayOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$NoticeCategoryCopyWith<$Res> implements $NoticeCategoryCopyWith<$Res> {
  factory _$NoticeCategoryCopyWith(_NoticeCategory value, $Res Function(_NoticeCategory) _then) = __$NoticeCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$NoticeCategoryCopyWithImpl<$Res>
    implements _$NoticeCategoryCopyWith<$Res> {
  __$NoticeCategoryCopyWithImpl(this._self, this._then);

  final _NoticeCategory _self;
  final $Res Function(_NoticeCategory) _then;

/// Create a copy of NoticeCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? displayOrder = null,Object? isActive = null,}) {
  return _then(_NoticeCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
