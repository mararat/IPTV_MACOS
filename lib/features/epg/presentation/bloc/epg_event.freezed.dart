// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epg_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EpgEvent {

 int get streamId; bool get fullEpg;
/// Create a copy of EpgEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpgEventCopyWith<EpgEvent> get copyWith => _$EpgEventCopyWithImpl<EpgEvent>(this as EpgEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpgEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.fullEpg, fullEpg) || other.fullEpg == fullEpg));
}


@override
int get hashCode => Object.hash(runtimeType,streamId,fullEpg);

@override
String toString() {
  return 'EpgEvent(streamId: $streamId, fullEpg: $fullEpg)';
}


}

/// @nodoc
abstract mixin class $EpgEventCopyWith<$Res>  {
  factory $EpgEventCopyWith(EpgEvent value, $Res Function(EpgEvent) _then) = _$EpgEventCopyWithImpl;
@useResult
$Res call({
 int streamId, bool fullEpg
});




}
/// @nodoc
class _$EpgEventCopyWithImpl<$Res>
    implements $EpgEventCopyWith<$Res> {
  _$EpgEventCopyWithImpl(this._self, this._then);

  final EpgEvent _self;
  final $Res Function(EpgEvent) _then;

/// Create a copy of EpgEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streamId = null,Object? fullEpg = null,}) {
  return _then(_self.copyWith(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,fullEpg: null == fullEpg ? _self.fullEpg : fullEpg // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EpgEvent].
extension EpgEventPatterns on EpgEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EpgLoad value)?  loadEpg,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EpgLoad() when loadEpg != null:
return loadEpg(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EpgLoad value)  loadEpg,}){
final _that = this;
switch (_that) {
case EpgLoad():
return loadEpg(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EpgLoad value)?  loadEpg,}){
final _that = this;
switch (_that) {
case EpgLoad() when loadEpg != null:
return loadEpg(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int streamId,  bool fullEpg)?  loadEpg,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EpgLoad() when loadEpg != null:
return loadEpg(_that.streamId,_that.fullEpg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int streamId,  bool fullEpg)  loadEpg,}) {final _that = this;
switch (_that) {
case EpgLoad():
return loadEpg(_that.streamId,_that.fullEpg);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int streamId,  bool fullEpg)?  loadEpg,}) {final _that = this;
switch (_that) {
case EpgLoad() when loadEpg != null:
return loadEpg(_that.streamId,_that.fullEpg);case _:
  return null;

}
}

}

/// @nodoc


class EpgLoad implements EpgEvent {
  const EpgLoad({required this.streamId, this.fullEpg = false});
  

@override final  int streamId;
@override@JsonKey() final  bool fullEpg;

/// Create a copy of EpgEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpgLoadCopyWith<EpgLoad> get copyWith => _$EpgLoadCopyWithImpl<EpgLoad>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpgLoad&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.fullEpg, fullEpg) || other.fullEpg == fullEpg));
}


@override
int get hashCode => Object.hash(runtimeType,streamId,fullEpg);

@override
String toString() {
  return 'EpgEvent.loadEpg(streamId: $streamId, fullEpg: $fullEpg)';
}


}

/// @nodoc
abstract mixin class $EpgLoadCopyWith<$Res> implements $EpgEventCopyWith<$Res> {
  factory $EpgLoadCopyWith(EpgLoad value, $Res Function(EpgLoad) _then) = _$EpgLoadCopyWithImpl;
@override @useResult
$Res call({
 int streamId, bool fullEpg
});




}
/// @nodoc
class _$EpgLoadCopyWithImpl<$Res>
    implements $EpgLoadCopyWith<$Res> {
  _$EpgLoadCopyWithImpl(this._self, this._then);

  final EpgLoad _self;
  final $Res Function(EpgLoad) _then;

/// Create a copy of EpgEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? fullEpg = null,}) {
  return _then(EpgLoad(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,fullEpg: null == fullEpg ? _self.fullEpg : fullEpg // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
