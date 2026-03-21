// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xtream_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XtreamCategory {

@JsonKey(name: 'category_id') String get categoryId;@JsonKey(name: 'category_name') String get categoryName;@JsonKey(name: 'parent_id') int get parentId;
/// Create a copy of XtreamCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamCategoryCopyWith<XtreamCategory> get copyWith => _$XtreamCategoryCopyWithImpl<XtreamCategory>(this as XtreamCategory, _$identity);

  /// Serializes this XtreamCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,parentId);

@override
String toString() {
  return 'XtreamCategory(categoryId: $categoryId, categoryName: $categoryName, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $XtreamCategoryCopyWith<$Res>  {
  factory $XtreamCategoryCopyWith(XtreamCategory value, $Res Function(XtreamCategory) _then) = _$XtreamCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'category_id') String categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'parent_id') int parentId
});




}
/// @nodoc
class _$XtreamCategoryCopyWithImpl<$Res>
    implements $XtreamCategoryCopyWith<$Res> {
  _$XtreamCategoryCopyWithImpl(this._self, this._then);

  final XtreamCategory _self;
  final $Res Function(XtreamCategory) _then;

/// Create a copy of XtreamCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categoryName = null,Object? parentId = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamCategory].
extension XtreamCategoryPatterns on XtreamCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamCategory value)  $default,){
final _that = this;
switch (_that) {
case _XtreamCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamCategory value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'parent_id')  int parentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamCategory() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.parentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'parent_id')  int parentId)  $default,) {final _that = this;
switch (_that) {
case _XtreamCategory():
return $default(_that.categoryId,_that.categoryName,_that.parentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'parent_id')  int parentId)?  $default,) {final _that = this;
switch (_that) {
case _XtreamCategory() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.parentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamCategory implements XtreamCategory {
  const _XtreamCategory({@JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'category_name') required this.categoryName, @JsonKey(name: 'parent_id') this.parentId = 0});
  factory _XtreamCategory.fromJson(Map<String, dynamic> json) => _$XtreamCategoryFromJson(json);

@override@JsonKey(name: 'category_id') final  String categoryId;
@override@JsonKey(name: 'category_name') final  String categoryName;
@override@JsonKey(name: 'parent_id') final  int parentId;

/// Create a copy of XtreamCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamCategoryCopyWith<_XtreamCategory> get copyWith => __$XtreamCategoryCopyWithImpl<_XtreamCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,parentId);

@override
String toString() {
  return 'XtreamCategory(categoryId: $categoryId, categoryName: $categoryName, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$XtreamCategoryCopyWith<$Res> implements $XtreamCategoryCopyWith<$Res> {
  factory _$XtreamCategoryCopyWith(_XtreamCategory value, $Res Function(_XtreamCategory) _then) = __$XtreamCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'category_id') String categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'parent_id') int parentId
});




}
/// @nodoc
class __$XtreamCategoryCopyWithImpl<$Res>
    implements _$XtreamCategoryCopyWith<$Res> {
  __$XtreamCategoryCopyWithImpl(this._self, this._then);

  final _XtreamCategory _self;
  final $Res Function(_XtreamCategory) _then;

/// Create a copy of XtreamCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categoryName = null,Object? parentId = null,}) {
  return _then(_XtreamCategory(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
