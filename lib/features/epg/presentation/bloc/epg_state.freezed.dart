// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epg_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EpgState {

 List<EpgEntry> get entries; bool get isLoading; int? get selectedStreamId; String? get errorMessage;
/// Create a copy of EpgState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpgStateCopyWith<EpgState> get copyWith => _$EpgStateCopyWithImpl<EpgState>(this as EpgState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpgState&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedStreamId, selectedStreamId) || other.selectedStreamId == selectedStreamId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries),isLoading,selectedStreamId,errorMessage);

@override
String toString() {
  return 'EpgState(entries: $entries, isLoading: $isLoading, selectedStreamId: $selectedStreamId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EpgStateCopyWith<$Res>  {
  factory $EpgStateCopyWith(EpgState value, $Res Function(EpgState) _then) = _$EpgStateCopyWithImpl;
@useResult
$Res call({
 List<EpgEntry> entries, bool isLoading, int? selectedStreamId, String? errorMessage
});




}
/// @nodoc
class _$EpgStateCopyWithImpl<$Res>
    implements $EpgStateCopyWith<$Res> {
  _$EpgStateCopyWithImpl(this._self, this._then);

  final EpgState _self;
  final $Res Function(EpgState) _then;

/// Create a copy of EpgState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? isLoading = null,Object? selectedStreamId = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<EpgEntry>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedStreamId: freezed == selectedStreamId ? _self.selectedStreamId : selectedStreamId // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpgState].
extension EpgStatePatterns on EpgState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpgState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpgState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpgState value)  $default,){
final _that = this;
switch (_that) {
case _EpgState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpgState value)?  $default,){
final _that = this;
switch (_that) {
case _EpgState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EpgEntry> entries,  bool isLoading,  int? selectedStreamId,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpgState() when $default != null:
return $default(_that.entries,_that.isLoading,_that.selectedStreamId,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EpgEntry> entries,  bool isLoading,  int? selectedStreamId,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EpgState():
return $default(_that.entries,_that.isLoading,_that.selectedStreamId,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EpgEntry> entries,  bool isLoading,  int? selectedStreamId,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EpgState() when $default != null:
return $default(_that.entries,_that.isLoading,_that.selectedStreamId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EpgState implements EpgState {
  const _EpgState({final  List<EpgEntry> entries = const [], this.isLoading = false, this.selectedStreamId, this.errorMessage}): _entries = entries;
  

 final  List<EpgEntry> _entries;
@override@JsonKey() List<EpgEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  bool isLoading;
@override final  int? selectedStreamId;
@override final  String? errorMessage;

/// Create a copy of EpgState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpgStateCopyWith<_EpgState> get copyWith => __$EpgStateCopyWithImpl<_EpgState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpgState&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedStreamId, selectedStreamId) || other.selectedStreamId == selectedStreamId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),isLoading,selectedStreamId,errorMessage);

@override
String toString() {
  return 'EpgState(entries: $entries, isLoading: $isLoading, selectedStreamId: $selectedStreamId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EpgStateCopyWith<$Res> implements $EpgStateCopyWith<$Res> {
  factory _$EpgStateCopyWith(_EpgState value, $Res Function(_EpgState) _then) = __$EpgStateCopyWithImpl;
@override @useResult
$Res call({
 List<EpgEntry> entries, bool isLoading, int? selectedStreamId, String? errorMessage
});




}
/// @nodoc
class __$EpgStateCopyWithImpl<$Res>
    implements _$EpgStateCopyWith<$Res> {
  __$EpgStateCopyWithImpl(this._self, this._then);

  final _EpgState _self;
  final $Res Function(_EpgState) _then;

/// Create a copy of EpgState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? isLoading = null,Object? selectedStreamId = freezed,Object? errorMessage = freezed,}) {
  return _then(_EpgState(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<EpgEntry>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedStreamId: freezed == selectedStreamId ? _self.selectedStreamId : selectedStreamId // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
