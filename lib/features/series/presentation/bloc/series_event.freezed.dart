// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeriesEvent()';
}


}

/// @nodoc
class $SeriesEventCopyWith<$Res>  {
$SeriesEventCopyWith(SeriesEvent _, $Res Function(SeriesEvent) __);
}


/// Adds pattern-matching-related methods to [SeriesEvent].
extension SeriesEventPatterns on SeriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SeriesLoadCategories value)?  loadCategories,TResult Function( SeriesLoadList value)?  loadSeries,TResult Function( SeriesSearch value)?  searchSeries,TResult Function( SeriesLoadInfo value)?  loadSeriesInfo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SeriesLoadCategories() when loadCategories != null:
return loadCategories(_that);case SeriesLoadList() when loadSeries != null:
return loadSeries(_that);case SeriesSearch() when searchSeries != null:
return searchSeries(_that);case SeriesLoadInfo() when loadSeriesInfo != null:
return loadSeriesInfo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SeriesLoadCategories value)  loadCategories,required TResult Function( SeriesLoadList value)  loadSeries,required TResult Function( SeriesSearch value)  searchSeries,required TResult Function( SeriesLoadInfo value)  loadSeriesInfo,}){
final _that = this;
switch (_that) {
case SeriesLoadCategories():
return loadCategories(_that);case SeriesLoadList():
return loadSeries(_that);case SeriesSearch():
return searchSeries(_that);case SeriesLoadInfo():
return loadSeriesInfo(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SeriesLoadCategories value)?  loadCategories,TResult? Function( SeriesLoadList value)?  loadSeries,TResult? Function( SeriesSearch value)?  searchSeries,TResult? Function( SeriesLoadInfo value)?  loadSeriesInfo,}){
final _that = this;
switch (_that) {
case SeriesLoadCategories() when loadCategories != null:
return loadCategories(_that);case SeriesLoadList() when loadSeries != null:
return loadSeries(_that);case SeriesSearch() when searchSeries != null:
return searchSeries(_that);case SeriesLoadInfo() when loadSeriesInfo != null:
return loadSeriesInfo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadCategories,TResult Function( String? categoryId)?  loadSeries,TResult Function( String query)?  searchSeries,TResult Function( int seriesId)?  loadSeriesInfo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SeriesLoadCategories() when loadCategories != null:
return loadCategories();case SeriesLoadList() when loadSeries != null:
return loadSeries(_that.categoryId);case SeriesSearch() when searchSeries != null:
return searchSeries(_that.query);case SeriesLoadInfo() when loadSeriesInfo != null:
return loadSeriesInfo(_that.seriesId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadCategories,required TResult Function( String? categoryId)  loadSeries,required TResult Function( String query)  searchSeries,required TResult Function( int seriesId)  loadSeriesInfo,}) {final _that = this;
switch (_that) {
case SeriesLoadCategories():
return loadCategories();case SeriesLoadList():
return loadSeries(_that.categoryId);case SeriesSearch():
return searchSeries(_that.query);case SeriesLoadInfo():
return loadSeriesInfo(_that.seriesId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadCategories,TResult? Function( String? categoryId)?  loadSeries,TResult? Function( String query)?  searchSeries,TResult? Function( int seriesId)?  loadSeriesInfo,}) {final _that = this;
switch (_that) {
case SeriesLoadCategories() when loadCategories != null:
return loadCategories();case SeriesLoadList() when loadSeries != null:
return loadSeries(_that.categoryId);case SeriesSearch() when searchSeries != null:
return searchSeries(_that.query);case SeriesLoadInfo() when loadSeriesInfo != null:
return loadSeriesInfo(_that.seriesId);case _:
  return null;

}
}

}

/// @nodoc


class SeriesLoadCategories implements SeriesEvent {
  const SeriesLoadCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesLoadCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeriesEvent.loadCategories()';
}


}




/// @nodoc


class SeriesLoadList implements SeriesEvent {
  const SeriesLoadList({this.categoryId});
  

 final  String? categoryId;

/// Create a copy of SeriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesLoadListCopyWith<SeriesLoadList> get copyWith => _$SeriesLoadListCopyWithImpl<SeriesLoadList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesLoadList&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'SeriesEvent.loadSeries(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $SeriesLoadListCopyWith<$Res> implements $SeriesEventCopyWith<$Res> {
  factory $SeriesLoadListCopyWith(SeriesLoadList value, $Res Function(SeriesLoadList) _then) = _$SeriesLoadListCopyWithImpl;
@useResult
$Res call({
 String? categoryId
});




}
/// @nodoc
class _$SeriesLoadListCopyWithImpl<$Res>
    implements $SeriesLoadListCopyWith<$Res> {
  _$SeriesLoadListCopyWithImpl(this._self, this._then);

  final SeriesLoadList _self;
  final $Res Function(SeriesLoadList) _then;

/// Create a copy of SeriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(SeriesLoadList(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SeriesSearch implements SeriesEvent {
  const SeriesSearch({required this.query});
  

 final  String query;

/// Create a copy of SeriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesSearchCopyWith<SeriesSearch> get copyWith => _$SeriesSearchCopyWithImpl<SeriesSearch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesSearch&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SeriesEvent.searchSeries(query: $query)';
}


}

/// @nodoc
abstract mixin class $SeriesSearchCopyWith<$Res> implements $SeriesEventCopyWith<$Res> {
  factory $SeriesSearchCopyWith(SeriesSearch value, $Res Function(SeriesSearch) _then) = _$SeriesSearchCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SeriesSearchCopyWithImpl<$Res>
    implements $SeriesSearchCopyWith<$Res> {
  _$SeriesSearchCopyWithImpl(this._self, this._then);

  final SeriesSearch _self;
  final $Res Function(SeriesSearch) _then;

/// Create a copy of SeriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SeriesSearch(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SeriesLoadInfo implements SeriesEvent {
  const SeriesLoadInfo({required this.seriesId});
  

 final  int seriesId;

/// Create a copy of SeriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesLoadInfoCopyWith<SeriesLoadInfo> get copyWith => _$SeriesLoadInfoCopyWithImpl<SeriesLoadInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesLoadInfo&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId));
}


@override
int get hashCode => Object.hash(runtimeType,seriesId);

@override
String toString() {
  return 'SeriesEvent.loadSeriesInfo(seriesId: $seriesId)';
}


}

/// @nodoc
abstract mixin class $SeriesLoadInfoCopyWith<$Res> implements $SeriesEventCopyWith<$Res> {
  factory $SeriesLoadInfoCopyWith(SeriesLoadInfo value, $Res Function(SeriesLoadInfo) _then) = _$SeriesLoadInfoCopyWithImpl;
@useResult
$Res call({
 int seriesId
});




}
/// @nodoc
class _$SeriesLoadInfoCopyWithImpl<$Res>
    implements $SeriesLoadInfoCopyWith<$Res> {
  _$SeriesLoadInfoCopyWithImpl(this._self, this._then);

  final SeriesLoadInfo _self;
  final $Res Function(SeriesLoadInfo) _then;

/// Create a copy of SeriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seriesId = null,}) {
  return _then(SeriesLoadInfo(
seriesId: null == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
