// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_attachment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeAttachment {

 String get id;@JsonKey(name: 'file_url') String get fileUrl;@JsonKey(name: 'file_name') String get fileName;@JsonKey(name: 'content_type') String get contentType;@JsonKey(name: 'size_bytes') int get sizeBytes;
/// Create a copy of NoticeAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoticeAttachmentCopyWith<NoticeAttachment> get copyWith => _$NoticeAttachmentCopyWithImpl<NoticeAttachment>(this as NoticeAttachment, _$identity);

  /// Serializes this NoticeAttachment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoticeAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileUrl,fileName,contentType,sizeBytes);

@override
String toString() {
  return 'NoticeAttachment(id: $id, fileUrl: $fileUrl, fileName: $fileName, contentType: $contentType, sizeBytes: $sizeBytes)';
}


}

/// @nodoc
abstract mixin class $NoticeAttachmentCopyWith<$Res>  {
  factory $NoticeAttachmentCopyWith(NoticeAttachment value, $Res Function(NoticeAttachment) _then) = _$NoticeAttachmentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'file_url') String fileUrl,@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'size_bytes') int sizeBytes
});




}
/// @nodoc
class _$NoticeAttachmentCopyWithImpl<$Res>
    implements $NoticeAttachmentCopyWith<$Res> {
  _$NoticeAttachmentCopyWithImpl(this._self, this._then);

  final NoticeAttachment _self;
  final $Res Function(NoticeAttachment) _then;

/// Create a copy of NoticeAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileUrl = null,Object? fileName = null,Object? contentType = null,Object? sizeBytes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NoticeAttachment].
extension NoticeAttachmentPatterns on NoticeAttachment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoticeAttachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoticeAttachment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoticeAttachment value)  $default,){
final _that = this;
switch (_that) {
case _NoticeAttachment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoticeAttachment value)?  $default,){
final _that = this;
switch (_that) {
case _NoticeAttachment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'file_url')  String fileUrl, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'size_bytes')  int sizeBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoticeAttachment() when $default != null:
return $default(_that.id,_that.fileUrl,_that.fileName,_that.contentType,_that.sizeBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'file_url')  String fileUrl, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'size_bytes')  int sizeBytes)  $default,) {final _that = this;
switch (_that) {
case _NoticeAttachment():
return $default(_that.id,_that.fileUrl,_that.fileName,_that.contentType,_that.sizeBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'file_url')  String fileUrl, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'size_bytes')  int sizeBytes)?  $default,) {final _that = this;
switch (_that) {
case _NoticeAttachment() when $default != null:
return $default(_that.id,_that.fileUrl,_that.fileName,_that.contentType,_that.sizeBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoticeAttachment implements NoticeAttachment {
  const _NoticeAttachment({required this.id, @JsonKey(name: 'file_url') required this.fileUrl, @JsonKey(name: 'file_name') required this.fileName, @JsonKey(name: 'content_type') required this.contentType, @JsonKey(name: 'size_bytes') required this.sizeBytes});
  factory _NoticeAttachment.fromJson(Map<String, dynamic> json) => _$NoticeAttachmentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'file_url') final  String fileUrl;
@override@JsonKey(name: 'file_name') final  String fileName;
@override@JsonKey(name: 'content_type') final  String contentType;
@override@JsonKey(name: 'size_bytes') final  int sizeBytes;

/// Create a copy of NoticeAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoticeAttachmentCopyWith<_NoticeAttachment> get copyWith => __$NoticeAttachmentCopyWithImpl<_NoticeAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoticeAttachmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoticeAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileUrl,fileName,contentType,sizeBytes);

@override
String toString() {
  return 'NoticeAttachment(id: $id, fileUrl: $fileUrl, fileName: $fileName, contentType: $contentType, sizeBytes: $sizeBytes)';
}


}

/// @nodoc
abstract mixin class _$NoticeAttachmentCopyWith<$Res> implements $NoticeAttachmentCopyWith<$Res> {
  factory _$NoticeAttachmentCopyWith(_NoticeAttachment value, $Res Function(_NoticeAttachment) _then) = __$NoticeAttachmentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'file_url') String fileUrl,@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'size_bytes') int sizeBytes
});




}
/// @nodoc
class __$NoticeAttachmentCopyWithImpl<$Res>
    implements _$NoticeAttachmentCopyWith<$Res> {
  __$NoticeAttachmentCopyWithImpl(this._self, this._then);

  final _NoticeAttachment _self;
  final $Res Function(_NoticeAttachment) _then;

/// Create a copy of NoticeAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileUrl = null,Object? fileName = null,Object? contentType = null,Object? sizeBytes = null,}) {
  return _then(_NoticeAttachment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
