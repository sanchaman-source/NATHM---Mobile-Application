// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedData<T> {

 List<T> get items; int get total; int get page; int get size; int get pages;
/// Create a copy of PaginatedData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedDataCopyWith<T, PaginatedData<T>> get copyWith => _$PaginatedDataCopyWithImpl<T, PaginatedData<T>>(this as PaginatedData<T>, _$identity);

  /// Serializes this PaginatedData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedData<T>&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.pages, pages) || other.pages == pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,page,size,pages);

@override
String toString() {
  return 'PaginatedData<$T>(items: $items, total: $total, page: $page, size: $size, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $PaginatedDataCopyWith<T,$Res>  {
  factory $PaginatedDataCopyWith(PaginatedData<T> value, $Res Function(PaginatedData<T>) _then) = _$PaginatedDataCopyWithImpl;
@useResult
$Res call({
 List<T> items, int total, int page, int size, int pages
});




}
/// @nodoc
class _$PaginatedDataCopyWithImpl<T,$Res>
    implements $PaginatedDataCopyWith<T, $Res> {
  _$PaginatedDataCopyWithImpl(this._self, this._then);

  final PaginatedData<T> _self;
  final $Res Function(PaginatedData<T>) _then;

/// Create a copy of PaginatedData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? page = null,Object? size = null,Object? pages = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedData].
extension PaginatedDataPatterns<T> on PaginatedData<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedData<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedData<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedData<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items,  int total,  int page,  int size,  int pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedData() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.size,_that.pages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items,  int total,  int page,  int size,  int pages)  $default,) {final _that = this;
switch (_that) {
case _PaginatedData():
return $default(_that.items,_that.total,_that.page,_that.size,_that.pages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items,  int total,  int page,  int size,  int pages)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedData() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.size,_that.pages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginatedData<T> implements PaginatedData<T> {
  const _PaginatedData({required final  List<T> items, required this.total, required this.page, required this.size, required this.pages}): _items = items;
  factory _PaginatedData.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedDataFromJson(json,fromJsonT);

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int page;
@override final  int size;
@override final  int pages;

/// Create a copy of PaginatedData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedDataCopyWith<T, _PaginatedData<T>> get copyWith => __$PaginatedDataCopyWithImpl<T, _PaginatedData<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginatedDataToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedData<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.pages, pages) || other.pages == pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,page,size,pages);

@override
String toString() {
  return 'PaginatedData<$T>(items: $items, total: $total, page: $page, size: $size, pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$PaginatedDataCopyWith<T,$Res> implements $PaginatedDataCopyWith<T, $Res> {
  factory _$PaginatedDataCopyWith(_PaginatedData<T> value, $Res Function(_PaginatedData<T>) _then) = __$PaginatedDataCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, int total, int page, int size, int pages
});




}
/// @nodoc
class __$PaginatedDataCopyWithImpl<T,$Res>
    implements _$PaginatedDataCopyWith<T, $Res> {
  __$PaginatedDataCopyWithImpl(this._self, this._then);

  final _PaginatedData<T> _self;
  final $Res Function(_PaginatedData<T>) _then;

/// Create a copy of PaginatedData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? page = null,Object? size = null,Object? pages = null,}) {
  return _then(_PaginatedData<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
