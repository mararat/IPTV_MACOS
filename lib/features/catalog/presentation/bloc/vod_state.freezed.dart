// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VodState {

 List<CategoryEntity> get categories; List<VodEntity> get vodList; bool get isLoading; bool get isLoadingCategories; String? get selectedCategoryId; VodEntity? get selectedVod; String? get errorMessage;
/// Create a copy of VodState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VodStateCopyWith<VodState> get copyWith => _$VodStateCopyWithImpl<VodState>(this as VodState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VodState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.vodList, vodList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedVod, selectedVod) || other.selectedVod == selectedVod)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(vodList),isLoading,isLoadingCategories,selectedCategoryId,selectedVod,errorMessage);

@override
String toString() {
  return 'VodState(categories: $categories, vodList: $vodList, isLoading: $isLoading, isLoadingCategories: $isLoadingCategories, selectedCategoryId: $selectedCategoryId, selectedVod: $selectedVod, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VodStateCopyWith<$Res>  {
  factory $VodStateCopyWith(VodState value, $Res Function(VodState) _then) = _$VodStateCopyWithImpl;
@useResult
$Res call({
 List<CategoryEntity> categories, List<VodEntity> vodList, bool isLoading, bool isLoadingCategories, String? selectedCategoryId, VodEntity? selectedVod, String? errorMessage
});


$VodEntityCopyWith<$Res>? get selectedVod;

}
/// @nodoc
class _$VodStateCopyWithImpl<$Res>
    implements $VodStateCopyWith<$Res> {
  _$VodStateCopyWithImpl(this._self, this._then);

  final VodState _self;
  final $Res Function(VodState) _then;

/// Create a copy of VodState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? vodList = null,Object? isLoading = null,Object? isLoadingCategories = null,Object? selectedCategoryId = freezed,Object? selectedVod = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,vodList: null == vodList ? _self.vodList : vodList // ignore: cast_nullable_to_non_nullable
as List<VodEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,selectedVod: freezed == selectedVod ? _self.selectedVod : selectedVod // ignore: cast_nullable_to_non_nullable
as VodEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VodState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VodEntityCopyWith<$Res>? get selectedVod {
    if (_self.selectedVod == null) {
    return null;
  }

  return $VodEntityCopyWith<$Res>(_self.selectedVod!, (value) {
    return _then(_self.copyWith(selectedVod: value));
  });
}
}


/// Adds pattern-matching-related methods to [VodState].
extension VodStatePatterns on VodState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VodState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VodState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VodState value)  $default,){
final _that = this;
switch (_that) {
case _VodState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VodState value)?  $default,){
final _that = this;
switch (_that) {
case _VodState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryEntity> categories,  List<VodEntity> vodList,  bool isLoading,  bool isLoadingCategories,  String? selectedCategoryId,  VodEntity? selectedVod,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VodState() when $default != null:
return $default(_that.categories,_that.vodList,_that.isLoading,_that.isLoadingCategories,_that.selectedCategoryId,_that.selectedVod,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryEntity> categories,  List<VodEntity> vodList,  bool isLoading,  bool isLoadingCategories,  String? selectedCategoryId,  VodEntity? selectedVod,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VodState():
return $default(_that.categories,_that.vodList,_that.isLoading,_that.isLoadingCategories,_that.selectedCategoryId,_that.selectedVod,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryEntity> categories,  List<VodEntity> vodList,  bool isLoading,  bool isLoadingCategories,  String? selectedCategoryId,  VodEntity? selectedVod,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VodState() when $default != null:
return $default(_that.categories,_that.vodList,_that.isLoading,_that.isLoadingCategories,_that.selectedCategoryId,_that.selectedVod,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VodState implements VodState {
  const _VodState({final  List<CategoryEntity> categories = const [], final  List<VodEntity> vodList = const [], this.isLoading = false, this.isLoadingCategories = false, this.selectedCategoryId, this.selectedVod, this.errorMessage}): _categories = categories,_vodList = vodList;
  

 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<VodEntity> _vodList;
@override@JsonKey() List<VodEntity> get vodList {
  if (_vodList is EqualUnmodifiableListView) return _vodList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vodList);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingCategories;
@override final  String? selectedCategoryId;
@override final  VodEntity? selectedVod;
@override final  String? errorMessage;

/// Create a copy of VodState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VodStateCopyWith<_VodState> get copyWith => __$VodStateCopyWithImpl<_VodState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VodState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._vodList, _vodList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedVod, selectedVod) || other.selectedVod == selectedVod)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_vodList),isLoading,isLoadingCategories,selectedCategoryId,selectedVod,errorMessage);

@override
String toString() {
  return 'VodState(categories: $categories, vodList: $vodList, isLoading: $isLoading, isLoadingCategories: $isLoadingCategories, selectedCategoryId: $selectedCategoryId, selectedVod: $selectedVod, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VodStateCopyWith<$Res> implements $VodStateCopyWith<$Res> {
  factory _$VodStateCopyWith(_VodState value, $Res Function(_VodState) _then) = __$VodStateCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryEntity> categories, List<VodEntity> vodList, bool isLoading, bool isLoadingCategories, String? selectedCategoryId, VodEntity? selectedVod, String? errorMessage
});


@override $VodEntityCopyWith<$Res>? get selectedVod;

}
/// @nodoc
class __$VodStateCopyWithImpl<$Res>
    implements _$VodStateCopyWith<$Res> {
  __$VodStateCopyWithImpl(this._self, this._then);

  final _VodState _self;
  final $Res Function(_VodState) _then;

/// Create a copy of VodState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? vodList = null,Object? isLoading = null,Object? isLoadingCategories = null,Object? selectedCategoryId = freezed,Object? selectedVod = freezed,Object? errorMessage = freezed,}) {
  return _then(_VodState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,vodList: null == vodList ? _self._vodList : vodList // ignore: cast_nullable_to_non_nullable
as List<VodEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,selectedVod: freezed == selectedVod ? _self.selectedVod : selectedVod // ignore: cast_nullable_to_non_nullable
as VodEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VodState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VodEntityCopyWith<$Res>? get selectedVod {
    if (_self.selectedVod == null) {
    return null;
  }

  return $VodEntityCopyWith<$Res>(_self.selectedVod!, (value) {
    return _then(_self.copyWith(selectedVod: value));
  });
}
}

// dart format on
