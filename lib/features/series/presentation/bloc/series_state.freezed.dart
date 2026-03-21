// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeriesState {

 List<CategoryEntity> get categories; List<SeriesEntity> get seriesList; bool get isLoading; bool get isLoadingCategories; bool get isLoadingDetail; String? get selectedCategoryId; SeriesDetailEntity? get selectedSeriesDetail; String? get errorMessage;
/// Create a copy of SeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesStateCopyWith<SeriesState> get copyWith => _$SeriesStateCopyWithImpl<SeriesState>(this as SeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.seriesList, seriesList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.isLoadingDetail, isLoadingDetail) || other.isLoadingDetail == isLoadingDetail)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedSeriesDetail, selectedSeriesDetail) || other.selectedSeriesDetail == selectedSeriesDetail)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(seriesList),isLoading,isLoadingCategories,isLoadingDetail,selectedCategoryId,selectedSeriesDetail,errorMessage);

@override
String toString() {
  return 'SeriesState(categories: $categories, seriesList: $seriesList, isLoading: $isLoading, isLoadingCategories: $isLoadingCategories, isLoadingDetail: $isLoadingDetail, selectedCategoryId: $selectedCategoryId, selectedSeriesDetail: $selectedSeriesDetail, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SeriesStateCopyWith<$Res>  {
  factory $SeriesStateCopyWith(SeriesState value, $Res Function(SeriesState) _then) = _$SeriesStateCopyWithImpl;
@useResult
$Res call({
 List<CategoryEntity> categories, List<SeriesEntity> seriesList, bool isLoading, bool isLoadingCategories, bool isLoadingDetail, String? selectedCategoryId, SeriesDetailEntity? selectedSeriesDetail, String? errorMessage
});


$SeriesDetailEntityCopyWith<$Res>? get selectedSeriesDetail;

}
/// @nodoc
class _$SeriesStateCopyWithImpl<$Res>
    implements $SeriesStateCopyWith<$Res> {
  _$SeriesStateCopyWithImpl(this._self, this._then);

  final SeriesState _self;
  final $Res Function(SeriesState) _then;

/// Create a copy of SeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? seriesList = null,Object? isLoading = null,Object? isLoadingCategories = null,Object? isLoadingDetail = null,Object? selectedCategoryId = freezed,Object? selectedSeriesDetail = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,seriesList: null == seriesList ? _self.seriesList : seriesList // ignore: cast_nullable_to_non_nullable
as List<SeriesEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDetail: null == isLoadingDetail ? _self.isLoadingDetail : isLoadingDetail // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,selectedSeriesDetail: freezed == selectedSeriesDetail ? _self.selectedSeriesDetail : selectedSeriesDetail // ignore: cast_nullable_to_non_nullable
as SeriesDetailEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SeriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesDetailEntityCopyWith<$Res>? get selectedSeriesDetail {
    if (_self.selectedSeriesDetail == null) {
    return null;
  }

  return $SeriesDetailEntityCopyWith<$Res>(_self.selectedSeriesDetail!, (value) {
    return _then(_self.copyWith(selectedSeriesDetail: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeriesState].
extension SeriesStatePatterns on SeriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesState value)  $default,){
final _that = this;
switch (_that) {
case _SeriesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesState value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryEntity> categories,  List<SeriesEntity> seriesList,  bool isLoading,  bool isLoadingCategories,  bool isLoadingDetail,  String? selectedCategoryId,  SeriesDetailEntity? selectedSeriesDetail,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesState() when $default != null:
return $default(_that.categories,_that.seriesList,_that.isLoading,_that.isLoadingCategories,_that.isLoadingDetail,_that.selectedCategoryId,_that.selectedSeriesDetail,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryEntity> categories,  List<SeriesEntity> seriesList,  bool isLoading,  bool isLoadingCategories,  bool isLoadingDetail,  String? selectedCategoryId,  SeriesDetailEntity? selectedSeriesDetail,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SeriesState():
return $default(_that.categories,_that.seriesList,_that.isLoading,_that.isLoadingCategories,_that.isLoadingDetail,_that.selectedCategoryId,_that.selectedSeriesDetail,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryEntity> categories,  List<SeriesEntity> seriesList,  bool isLoading,  bool isLoadingCategories,  bool isLoadingDetail,  String? selectedCategoryId,  SeriesDetailEntity? selectedSeriesDetail,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SeriesState() when $default != null:
return $default(_that.categories,_that.seriesList,_that.isLoading,_that.isLoadingCategories,_that.isLoadingDetail,_that.selectedCategoryId,_that.selectedSeriesDetail,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SeriesState implements SeriesState {
  const _SeriesState({final  List<CategoryEntity> categories = const [], final  List<SeriesEntity> seriesList = const [], this.isLoading = false, this.isLoadingCategories = false, this.isLoadingDetail = false, this.selectedCategoryId, this.selectedSeriesDetail, this.errorMessage}): _categories = categories,_seriesList = seriesList;
  

 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<SeriesEntity> _seriesList;
@override@JsonKey() List<SeriesEntity> get seriesList {
  if (_seriesList is EqualUnmodifiableListView) return _seriesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seriesList);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingCategories;
@override@JsonKey() final  bool isLoadingDetail;
@override final  String? selectedCategoryId;
@override final  SeriesDetailEntity? selectedSeriesDetail;
@override final  String? errorMessage;

/// Create a copy of SeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesStateCopyWith<_SeriesState> get copyWith => __$SeriesStateCopyWithImpl<_SeriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._seriesList, _seriesList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.isLoadingDetail, isLoadingDetail) || other.isLoadingDetail == isLoadingDetail)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedSeriesDetail, selectedSeriesDetail) || other.selectedSeriesDetail == selectedSeriesDetail)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_seriesList),isLoading,isLoadingCategories,isLoadingDetail,selectedCategoryId,selectedSeriesDetail,errorMessage);

@override
String toString() {
  return 'SeriesState(categories: $categories, seriesList: $seriesList, isLoading: $isLoading, isLoadingCategories: $isLoadingCategories, isLoadingDetail: $isLoadingDetail, selectedCategoryId: $selectedCategoryId, selectedSeriesDetail: $selectedSeriesDetail, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SeriesStateCopyWith<$Res> implements $SeriesStateCopyWith<$Res> {
  factory _$SeriesStateCopyWith(_SeriesState value, $Res Function(_SeriesState) _then) = __$SeriesStateCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryEntity> categories, List<SeriesEntity> seriesList, bool isLoading, bool isLoadingCategories, bool isLoadingDetail, String? selectedCategoryId, SeriesDetailEntity? selectedSeriesDetail, String? errorMessage
});


@override $SeriesDetailEntityCopyWith<$Res>? get selectedSeriesDetail;

}
/// @nodoc
class __$SeriesStateCopyWithImpl<$Res>
    implements _$SeriesStateCopyWith<$Res> {
  __$SeriesStateCopyWithImpl(this._self, this._then);

  final _SeriesState _self;
  final $Res Function(_SeriesState) _then;

/// Create a copy of SeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? seriesList = null,Object? isLoading = null,Object? isLoadingCategories = null,Object? isLoadingDetail = null,Object? selectedCategoryId = freezed,Object? selectedSeriesDetail = freezed,Object? errorMessage = freezed,}) {
  return _then(_SeriesState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,seriesList: null == seriesList ? _self._seriesList : seriesList // ignore: cast_nullable_to_non_nullable
as List<SeriesEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDetail: null == isLoadingDetail ? _self.isLoadingDetail : isLoadingDetail // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,selectedSeriesDetail: freezed == selectedSeriesDetail ? _self.selectedSeriesDetail : selectedSeriesDetail // ignore: cast_nullable_to_non_nullable
as SeriesDetailEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SeriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesDetailEntityCopyWith<$Res>? get selectedSeriesDetail {
    if (_self.selectedSeriesDetail == null) {
    return null;
  }

  return $SeriesDetailEntityCopyWith<$Res>(_self.selectedSeriesDetail!, (value) {
    return _then(_self.copyWith(selectedSeriesDetail: value));
  });
}
}

// dart format on
