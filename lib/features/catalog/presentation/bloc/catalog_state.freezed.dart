// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogState {

 List<CategoryEntity> get categories; List<ChannelEntity> get channels; bool get isLoadingCategories; bool get isLoadingChannels; String? get selectedCategoryId; String? get searchQuery; String? get errorMessage;
/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogStateCopyWith<CatalogState> get copyWith => _$CatalogStateCopyWithImpl<CatalogState>(this as CatalogState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.channels, channels)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.isLoadingChannels, isLoadingChannels) || other.isLoadingChannels == isLoadingChannels)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(channels),isLoadingCategories,isLoadingChannels,selectedCategoryId,searchQuery,errorMessage);

@override
String toString() {
  return 'CatalogState(categories: $categories, channels: $channels, isLoadingCategories: $isLoadingCategories, isLoadingChannels: $isLoadingChannels, selectedCategoryId: $selectedCategoryId, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CatalogStateCopyWith<$Res>  {
  factory $CatalogStateCopyWith(CatalogState value, $Res Function(CatalogState) _then) = _$CatalogStateCopyWithImpl;
@useResult
$Res call({
 List<CategoryEntity> categories, List<ChannelEntity> channels, bool isLoadingCategories, bool isLoadingChannels, String? selectedCategoryId, String? searchQuery, String? errorMessage
});




}
/// @nodoc
class _$CatalogStateCopyWithImpl<$Res>
    implements $CatalogStateCopyWith<$Res> {
  _$CatalogStateCopyWithImpl(this._self, this._then);

  final CatalogState _self;
  final $Res Function(CatalogState) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? channels = null,Object? isLoadingCategories = null,Object? isLoadingChannels = null,Object? selectedCategoryId = freezed,Object? searchQuery = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as List<ChannelEntity>,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,isLoadingChannels: null == isLoadingChannels ? _self.isLoadingChannels : isLoadingChannels // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogState].
extension CatalogStatePatterns on CatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogState value)  $default,){
final _that = this;
switch (_that) {
case _CatalogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogState value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryEntity> categories,  List<ChannelEntity> channels,  bool isLoadingCategories,  bool isLoadingChannels,  String? selectedCategoryId,  String? searchQuery,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
return $default(_that.categories,_that.channels,_that.isLoadingCategories,_that.isLoadingChannels,_that.selectedCategoryId,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryEntity> categories,  List<ChannelEntity> channels,  bool isLoadingCategories,  bool isLoadingChannels,  String? selectedCategoryId,  String? searchQuery,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CatalogState():
return $default(_that.categories,_that.channels,_that.isLoadingCategories,_that.isLoadingChannels,_that.selectedCategoryId,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryEntity> categories,  List<ChannelEntity> channels,  bool isLoadingCategories,  bool isLoadingChannels,  String? selectedCategoryId,  String? searchQuery,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
return $default(_that.categories,_that.channels,_that.isLoadingCategories,_that.isLoadingChannels,_that.selectedCategoryId,_that.searchQuery,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogState implements CatalogState {
  const _CatalogState({final  List<CategoryEntity> categories = const [], final  List<ChannelEntity> channels = const [], this.isLoadingCategories = false, this.isLoadingChannels = false, this.selectedCategoryId, this.searchQuery, this.errorMessage}): _categories = categories,_channels = channels;
  

 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<ChannelEntity> _channels;
@override@JsonKey() List<ChannelEntity> get channels {
  if (_channels is EqualUnmodifiableListView) return _channels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_channels);
}

@override@JsonKey() final  bool isLoadingCategories;
@override@JsonKey() final  bool isLoadingChannels;
@override final  String? selectedCategoryId;
@override final  String? searchQuery;
@override final  String? errorMessage;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogStateCopyWith<_CatalogState> get copyWith => __$CatalogStateCopyWithImpl<_CatalogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._channels, _channels)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.isLoadingChannels, isLoadingChannels) || other.isLoadingChannels == isLoadingChannels)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_channels),isLoadingCategories,isLoadingChannels,selectedCategoryId,searchQuery,errorMessage);

@override
String toString() {
  return 'CatalogState(categories: $categories, channels: $channels, isLoadingCategories: $isLoadingCategories, isLoadingChannels: $isLoadingChannels, selectedCategoryId: $selectedCategoryId, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CatalogStateCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory _$CatalogStateCopyWith(_CatalogState value, $Res Function(_CatalogState) _then) = __$CatalogStateCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryEntity> categories, List<ChannelEntity> channels, bool isLoadingCategories, bool isLoadingChannels, String? selectedCategoryId, String? searchQuery, String? errorMessage
});




}
/// @nodoc
class __$CatalogStateCopyWithImpl<$Res>
    implements _$CatalogStateCopyWith<$Res> {
  __$CatalogStateCopyWithImpl(this._self, this._then);

  final _CatalogState _self;
  final $Res Function(_CatalogState) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? channels = null,Object? isLoadingCategories = null,Object? isLoadingChannels = null,Object? selectedCategoryId = freezed,Object? searchQuery = freezed,Object? errorMessage = freezed,}) {
  return _then(_CatalogState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,channels: null == channels ? _self._channels : channels // ignore: cast_nullable_to_non_nullable
as List<ChannelEntity>,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,isLoadingChannels: null == isLoadingChannels ? _self.isLoadingChannels : isLoadingChannels // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
