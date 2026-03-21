// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VodEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VodEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VodEvent()';
}


}

/// @nodoc
class $VodEventCopyWith<$Res>  {
$VodEventCopyWith(VodEvent _, $Res Function(VodEvent) __);
}


/// Adds pattern-matching-related methods to [VodEvent].
extension VodEventPatterns on VodEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VodLoadCategories value)?  loadCategories,TResult Function( VodLoadList value)?  loadVodList,TResult Function( VodSearch value)?  searchVod,TResult Function( VodLoadDetail value)?  loadVodDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VodLoadCategories() when loadCategories != null:
return loadCategories(_that);case VodLoadList() when loadVodList != null:
return loadVodList(_that);case VodSearch() when searchVod != null:
return searchVod(_that);case VodLoadDetail() when loadVodDetail != null:
return loadVodDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VodLoadCategories value)  loadCategories,required TResult Function( VodLoadList value)  loadVodList,required TResult Function( VodSearch value)  searchVod,required TResult Function( VodLoadDetail value)  loadVodDetail,}){
final _that = this;
switch (_that) {
case VodLoadCategories():
return loadCategories(_that);case VodLoadList():
return loadVodList(_that);case VodSearch():
return searchVod(_that);case VodLoadDetail():
return loadVodDetail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VodLoadCategories value)?  loadCategories,TResult? Function( VodLoadList value)?  loadVodList,TResult? Function( VodSearch value)?  searchVod,TResult? Function( VodLoadDetail value)?  loadVodDetail,}){
final _that = this;
switch (_that) {
case VodLoadCategories() when loadCategories != null:
return loadCategories(_that);case VodLoadList() when loadVodList != null:
return loadVodList(_that);case VodSearch() when searchVod != null:
return searchVod(_that);case VodLoadDetail() when loadVodDetail != null:
return loadVodDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadCategories,TResult Function( String? categoryId)?  loadVodList,TResult Function( String query)?  searchVod,TResult Function( String id)?  loadVodDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VodLoadCategories() when loadCategories != null:
return loadCategories();case VodLoadList() when loadVodList != null:
return loadVodList(_that.categoryId);case VodSearch() when searchVod != null:
return searchVod(_that.query);case VodLoadDetail() when loadVodDetail != null:
return loadVodDetail(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadCategories,required TResult Function( String? categoryId)  loadVodList,required TResult Function( String query)  searchVod,required TResult Function( String id)  loadVodDetail,}) {final _that = this;
switch (_that) {
case VodLoadCategories():
return loadCategories();case VodLoadList():
return loadVodList(_that.categoryId);case VodSearch():
return searchVod(_that.query);case VodLoadDetail():
return loadVodDetail(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadCategories,TResult? Function( String? categoryId)?  loadVodList,TResult? Function( String query)?  searchVod,TResult? Function( String id)?  loadVodDetail,}) {final _that = this;
switch (_that) {
case VodLoadCategories() when loadCategories != null:
return loadCategories();case VodLoadList() when loadVodList != null:
return loadVodList(_that.categoryId);case VodSearch() when searchVod != null:
return searchVod(_that.query);case VodLoadDetail() when loadVodDetail != null:
return loadVodDetail(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class VodLoadCategories implements VodEvent {
  const VodLoadCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VodLoadCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VodEvent.loadCategories()';
}


}




/// @nodoc


class VodLoadList implements VodEvent {
  const VodLoadList({this.categoryId});
  

 final  String? categoryId;

/// Create a copy of VodEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VodLoadListCopyWith<VodLoadList> get copyWith => _$VodLoadListCopyWithImpl<VodLoadList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VodLoadList&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'VodEvent.loadVodList(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $VodLoadListCopyWith<$Res> implements $VodEventCopyWith<$Res> {
  factory $VodLoadListCopyWith(VodLoadList value, $Res Function(VodLoadList) _then) = _$VodLoadListCopyWithImpl;
@useResult
$Res call({
 String? categoryId
});




}
/// @nodoc
class _$VodLoadListCopyWithImpl<$Res>
    implements $VodLoadListCopyWith<$Res> {
  _$VodLoadListCopyWithImpl(this._self, this._then);

  final VodLoadList _self;
  final $Res Function(VodLoadList) _then;

/// Create a copy of VodEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(VodLoadList(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class VodSearch implements VodEvent {
  const VodSearch({required this.query});
  

 final  String query;

/// Create a copy of VodEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VodSearchCopyWith<VodSearch> get copyWith => _$VodSearchCopyWithImpl<VodSearch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VodSearch&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'VodEvent.searchVod(query: $query)';
}


}

/// @nodoc
abstract mixin class $VodSearchCopyWith<$Res> implements $VodEventCopyWith<$Res> {
  factory $VodSearchCopyWith(VodSearch value, $Res Function(VodSearch) _then) = _$VodSearchCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$VodSearchCopyWithImpl<$Res>
    implements $VodSearchCopyWith<$Res> {
  _$VodSearchCopyWithImpl(this._self, this._then);

  final VodSearch _self;
  final $Res Function(VodSearch) _then;

/// Create a copy of VodEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(VodSearch(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VodLoadDetail implements VodEvent {
  const VodLoadDetail({required this.id});
  

 final  String id;

/// Create a copy of VodEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VodLoadDetailCopyWith<VodLoadDetail> get copyWith => _$VodLoadDetailCopyWithImpl<VodLoadDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VodLoadDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'VodEvent.loadVodDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class $VodLoadDetailCopyWith<$Res> implements $VodEventCopyWith<$Res> {
  factory $VodLoadDetailCopyWith(VodLoadDetail value, $Res Function(VodLoadDetail) _then) = _$VodLoadDetailCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$VodLoadDetailCopyWithImpl<$Res>
    implements $VodLoadDetailCopyWith<$Res> {
  _$VodLoadDetailCopyWithImpl(this._self, this._then);

  final VodLoadDetail _self;
  final $Res Function(VodLoadDetail) _then;

/// Create a copy of VodEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(VodLoadDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
