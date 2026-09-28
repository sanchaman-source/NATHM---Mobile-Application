// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Notice {

 String get id; String get title; String get slug;@JsonKey(name: 'short_description') String? get shortDescription; String? get content;@JsonKey(name: 'category_id') String get categoryId; String get category;@JsonKey(name: 'category_slug') String get categorySlug;@JsonKey(name: 'published_date') String get publishedDate;@JsonKey(name: 'academic_year') String? get academicYear; String? get reference; bool get featured; String get status;@JsonKey(name: 'display_order') int get displayOrder;@JsonKey(name: 'cover_image') String? get coverImage;@JsonKey(name: 'expiry_date') String? get expiryDate; List<NoticeAttachment> get attachments;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of Notice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoticeCopyWith<Notice> get copyWith => _$NoticeCopyWithImpl<Notice>(this as Notice, _$identity);

  /// Serializes this Notice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Notice&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.academicYear, academicYear) || other.academicYear == academicYear)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,slug,shortDescription,content,categoryId,category,categorySlug,publishedDate,academicYear,reference,featured,status,displayOrder,coverImage,expiryDate,const DeepCollectionEquality().hash(attachments),createdAt,updatedAt]);

@override
String toString() {
  return 'Notice(id: $id, title: $title, slug: $slug, shortDescription: $shortDescription, content: $content, categoryId: $categoryId, category: $category, categorySlug: $categorySlug, publishedDate: $publishedDate, academicYear: $academicYear, reference: $reference, featured: $featured, status: $status, displayOrder: $displayOrder, coverImage: $coverImage, expiryDate: $expiryDate, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NoticeCopyWith<$Res>  {
  factory $NoticeCopyWith(Notice value, $Res Function(Notice) _then) = _$NoticeCopyWithImpl;
@useResult
$Res call({
 String id, String title, String slug,@JsonKey(name: 'short_description') String? shortDescription, String? content,@JsonKey(name: 'category_id') String categoryId, String category,@JsonKey(name: 'category_slug') String categorySlug,@JsonKey(name: 'published_date') String publishedDate,@JsonKey(name: 'academic_year') String? academicYear, String? reference, bool featured, String status,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'cover_image') String? coverImage,@JsonKey(name: 'expiry_date') String? expiryDate, List<NoticeAttachment> attachments,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$NoticeCopyWithImpl<$Res>
    implements $NoticeCopyWith<$Res> {
  _$NoticeCopyWithImpl(this._self, this._then);

  final Notice _self;
  final $Res Function(Notice) _then;

/// Create a copy of Notice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? shortDescription = freezed,Object? content = freezed,Object? categoryId = null,Object? category = null,Object? categorySlug = null,Object? publishedDate = null,Object? academicYear = freezed,Object? reference = freezed,Object? featured = null,Object? status = null,Object? displayOrder = null,Object? coverImage = freezed,Object? expiryDate = freezed,Object? attachments = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,publishedDate: null == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String,academicYear: freezed == academicYear ? _self.academicYear : academicYear // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<NoticeAttachment>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Notice].
extension NoticePatterns on Notice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Notice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Notice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Notice value)  $default,){
final _that = this;
switch (_that) {
case _Notice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Notice value)?  $default,){
final _that = this;
switch (_that) {
case _Notice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String slug, @JsonKey(name: 'short_description')  String? shortDescription,  String? content, @JsonKey(name: 'category_id')  String categoryId,  String category, @JsonKey(name: 'category_slug')  String categorySlug, @JsonKey(name: 'published_date')  String publishedDate, @JsonKey(name: 'academic_year')  String? academicYear,  String? reference,  bool featured,  String status, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'cover_image')  String? coverImage, @JsonKey(name: 'expiry_date')  String? expiryDate,  List<NoticeAttachment> attachments, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Notice() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.shortDescription,_that.content,_that.categoryId,_that.category,_that.categorySlug,_that.publishedDate,_that.academicYear,_that.reference,_that.featured,_that.status,_that.displayOrder,_that.coverImage,_that.expiryDate,_that.attachments,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String slug, @JsonKey(name: 'short_description')  String? shortDescription,  String? content, @JsonKey(name: 'category_id')  String categoryId,  String category, @JsonKey(name: 'category_slug')  String categorySlug, @JsonKey(name: 'published_date')  String publishedDate, @JsonKey(name: 'academic_year')  String? academicYear,  String? reference,  bool featured,  String status, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'cover_image')  String? coverImage, @JsonKey(name: 'expiry_date')  String? expiryDate,  List<NoticeAttachment> attachments, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Notice():
return $default(_that.id,_that.title,_that.slug,_that.shortDescription,_that.content,_that.categoryId,_that.category,_that.categorySlug,_that.publishedDate,_that.academicYear,_that.reference,_that.featured,_that.status,_that.displayOrder,_that.coverImage,_that.expiryDate,_that.attachments,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String slug, @JsonKey(name: 'short_description')  String? shortDescription,  String? content, @JsonKey(name: 'category_id')  String categoryId,  String category, @JsonKey(name: 'category_slug')  String categorySlug, @JsonKey(name: 'published_date')  String publishedDate, @JsonKey(name: 'academic_year')  String? academicYear,  String? reference,  bool featured,  String status, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'cover_image')  String? coverImage, @JsonKey(name: 'expiry_date')  String? expiryDate,  List<NoticeAttachment> attachments, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Notice() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.shortDescription,_that.content,_that.categoryId,_that.category,_that.categorySlug,_that.publishedDate,_that.academicYear,_that.reference,_that.featured,_that.status,_that.displayOrder,_that.coverImage,_that.expiryDate,_that.attachments,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Notice implements Notice {
  const _Notice({required this.id, required this.title, required this.slug, @JsonKey(name: 'short_description') this.shortDescription, this.content, @JsonKey(name: 'category_id') required this.categoryId, required this.category, @JsonKey(name: 'category_slug') required this.categorySlug, @JsonKey(name: 'published_date') required this.publishedDate, @JsonKey(name: 'academic_year') this.academicYear, this.reference, required this.featured, required this.status, @JsonKey(name: 'display_order') required this.displayOrder, @JsonKey(name: 'cover_image') this.coverImage, @JsonKey(name: 'expiry_date') this.expiryDate, required final  List<NoticeAttachment> attachments, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _attachments = attachments;
  factory _Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

@override final  String id;
@override final  String title;
@override final  String slug;
@override@JsonKey(name: 'short_description') final  String? shortDescription;
@override final  String? content;
@override@JsonKey(name: 'category_id') final  String categoryId;
@override final  String category;
@override@JsonKey(name: 'category_slug') final  String categorySlug;
@override@JsonKey(name: 'published_date') final  String publishedDate;
@override@JsonKey(name: 'academic_year') final  String? academicYear;
@override final  String? reference;
@override final  bool featured;
@override final  String status;
@override@JsonKey(name: 'display_order') final  int displayOrder;
@override@JsonKey(name: 'cover_image') final  String? coverImage;
@override@JsonKey(name: 'expiry_date') final  String? expiryDate;
 final  List<NoticeAttachment> _attachments;
@override List<NoticeAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of Notice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoticeCopyWith<_Notice> get copyWith => __$NoticeCopyWithImpl<_Notice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoticeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Notice&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.academicYear, academicYear) || other.academicYear == academicYear)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,slug,shortDescription,content,categoryId,category,categorySlug,publishedDate,academicYear,reference,featured,status,displayOrder,coverImage,expiryDate,const DeepCollectionEquality().hash(_attachments),createdAt,updatedAt]);

@override
String toString() {
  return 'Notice(id: $id, title: $title, slug: $slug, shortDescription: $shortDescription, content: $content, categoryId: $categoryId, category: $category, categorySlug: $categorySlug, publishedDate: $publishedDate, academicYear: $academicYear, reference: $reference, featured: $featured, status: $status, displayOrder: $displayOrder, coverImage: $coverImage, expiryDate: $expiryDate, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NoticeCopyWith<$Res> implements $NoticeCopyWith<$Res> {
  factory _$NoticeCopyWith(_Notice value, $Res Function(_Notice) _then) = __$NoticeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String slug,@JsonKey(name: 'short_description') String? shortDescription, String? content,@JsonKey(name: 'category_id') String categoryId, String category,@JsonKey(name: 'category_slug') String categorySlug,@JsonKey(name: 'published_date') String publishedDate,@JsonKey(name: 'academic_year') String? academicYear, String? reference, bool featured, String status,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'cover_image') String? coverImage,@JsonKey(name: 'expiry_date') String? expiryDate, List<NoticeAttachment> attachments,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$NoticeCopyWithImpl<$Res>
    implements _$NoticeCopyWith<$Res> {
  __$NoticeCopyWithImpl(this._self, this._then);

  final _Notice _self;
  final $Res Function(_Notice) _then;

/// Create a copy of Notice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? shortDescription = freezed,Object? content = freezed,Object? categoryId = null,Object? category = null,Object? categorySlug = null,Object? publishedDate = null,Object? academicYear = freezed,Object? reference = freezed,Object? featured = null,Object? status = null,Object? displayOrder = null,Object? coverImage = freezed,Object? expiryDate = freezed,Object? attachments = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Notice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,publishedDate: null == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String,academicYear: freezed == academicYear ? _self.academicYear : academicYear // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<NoticeAttachment>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
