// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CatalogEvent()';
}


}

/// @nodoc
class $CatalogEventCopyWith<$Res>  {
$CatalogEventCopyWith(CatalogEvent _, $Res Function(CatalogEvent) __);
}


/// Adds pattern-matching-related methods to [CatalogEvent].
extension CatalogEventPatterns on CatalogEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CatalogLoadCategories value)?  loadCategories,TResult Function( CatalogLoadChannels value)?  loadChannels,TResult Function( CatalogSearchChannels value)?  searchChannels,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CatalogLoadCategories() when loadCategories != null:
return loadCategories(_that);case CatalogLoadChannels() when loadChannels != null:
return loadChannels(_that);case CatalogSearchChannels() when searchChannels != null:
return searchChannels(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CatalogLoadCategories value)  loadCategories,required TResult Function( CatalogLoadChannels value)  loadChannels,required TResult Function( CatalogSearchChannels value)  searchChannels,}){
final _that = this;
switch (_that) {
case CatalogLoadCategories():
return loadCategories(_that);case CatalogLoadChannels():
return loadChannels(_that);case CatalogSearchChannels():
return searchChannels(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CatalogLoadCategories value)?  loadCategories,TResult? Function( CatalogLoadChannels value)?  loadChannels,TResult? Function( CatalogSearchChannels value)?  searchChannels,}){
final _that = this;
switch (_that) {
case CatalogLoadCategories() when loadCategories != null:
return loadCategories(_that);case CatalogLoadChannels() when loadChannels != null:
return loadChannels(_that);case CatalogSearchChannels() when searchChannels != null:
return searchChannels(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadCategories,TResult Function( String? categoryId,  String? query)?  loadChannels,TResult Function( String query)?  searchChannels,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CatalogLoadCategories() when loadCategories != null:
return loadCategories();case CatalogLoadChannels() when loadChannels != null:
return loadChannels(_that.categoryId,_that.query);case CatalogSearchChannels() when searchChannels != null:
return searchChannels(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadCategories,required TResult Function( String? categoryId,  String? query)  loadChannels,required TResult Function( String query)  searchChannels,}) {final _that = this;
switch (_that) {
case CatalogLoadCategories():
return loadCategories();case CatalogLoadChannels():
return loadChannels(_that.categoryId,_that.query);case CatalogSearchChannels():
return searchChannels(_that.query);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadCategories,TResult? Function( String? categoryId,  String? query)?  loadChannels,TResult? Function( String query)?  searchChannels,}) {final _that = this;
switch (_that) {
case CatalogLoadCategories() when loadCategories != null:
return loadCategories();case CatalogLoadChannels() when loadChannels != null:
return loadChannels(_that.categoryId,_that.query);case CatalogSearchChannels() when searchChannels != null:
return searchChannels(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class CatalogLoadCategories implements CatalogEvent {
  const CatalogLoadCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLoadCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CatalogEvent.loadCategories()';
}


}




/// @nodoc


class CatalogLoadChannels implements CatalogEvent {
  const CatalogLoadChannels({this.categoryId, this.query});
  

 final  String? categoryId;
 final  String? query;

/// Create a copy of CatalogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLoadChannelsCopyWith<CatalogLoadChannels> get copyWith => _$CatalogLoadChannelsCopyWithImpl<CatalogLoadChannels>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLoadChannels&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,query);

@override
String toString() {
  return 'CatalogEvent.loadChannels(categoryId: $categoryId, query: $query)';
}


}

/// @nodoc
abstract mixin class $CatalogLoadChannelsCopyWith<$Res> implements $CatalogEventCopyWith<$Res> {
  factory $CatalogLoadChannelsCopyWith(CatalogLoadChannels value, $Res Function(CatalogLoadChannels) _then) = _$CatalogLoadChannelsCopyWithImpl;
@useResult
$Res call({
 String? categoryId, String? query
});




}
/// @nodoc
class _$CatalogLoadChannelsCopyWithImpl<$Res>
    implements $CatalogLoadChannelsCopyWith<$Res> {
  _$CatalogLoadChannelsCopyWithImpl(this._self, this._then);

  final CatalogLoadChannels _self;
  final $Res Function(CatalogLoadChannels) _then;

/// Create a copy of CatalogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? query = freezed,}) {
  return _then(CatalogLoadChannels(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CatalogSearchChannels implements CatalogEvent {
  const CatalogSearchChannels({required this.query});
  

 final  String query;

/// Create a copy of CatalogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogSearchChannelsCopyWith<CatalogSearchChannels> get copyWith => _$CatalogSearchChannelsCopyWithImpl<CatalogSearchChannels>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogSearchChannels&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'CatalogEvent.searchChannels(query: $query)';
}


}

/// @nodoc
abstract mixin class $CatalogSearchChannelsCopyWith<$Res> implements $CatalogEventCopyWith<$Res> {
  factory $CatalogSearchChannelsCopyWith(CatalogSearchChannels value, $Res Function(CatalogSearchChannels) _then) = _$CatalogSearchChannelsCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$CatalogSearchChannelsCopyWithImpl<$Res>
    implements $CatalogSearchChannelsCopyWith<$Res> {
  _$CatalogSearchChannelsCopyWithImpl(this._self, this._then);

  final CatalogSearchChannels _self;
  final $Res Function(CatalogSearchChannels) _then;

/// Create a copy of CatalogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(CatalogSearchChannels(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
