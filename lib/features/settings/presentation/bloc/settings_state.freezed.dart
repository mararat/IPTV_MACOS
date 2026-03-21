// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsState {

 String get locale; bool get isDarkMode; String get streamQuality; int get bufferDuration; String get userAgent; bool get autoPlay; bool get showEpgInfo;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode)&&(identical(other.streamQuality, streamQuality) || other.streamQuality == streamQuality)&&(identical(other.bufferDuration, bufferDuration) || other.bufferDuration == bufferDuration)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.autoPlay, autoPlay) || other.autoPlay == autoPlay)&&(identical(other.showEpgInfo, showEpgInfo) || other.showEpgInfo == showEpgInfo));
}


@override
int get hashCode => Object.hash(runtimeType,locale,isDarkMode,streamQuality,bufferDuration,userAgent,autoPlay,showEpgInfo);

@override
String toString() {
  return 'SettingsState(locale: $locale, isDarkMode: $isDarkMode, streamQuality: $streamQuality, bufferDuration: $bufferDuration, userAgent: $userAgent, autoPlay: $autoPlay, showEpgInfo: $showEpgInfo)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 String locale, bool isDarkMode, String streamQuality, int bufferDuration, String userAgent, bool autoPlay, bool showEpgInfo
});




}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? isDarkMode = null,Object? streamQuality = null,Object? bufferDuration = null,Object? userAgent = null,Object? autoPlay = null,Object? showEpgInfo = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,streamQuality: null == streamQuality ? _self.streamQuality : streamQuality // ignore: cast_nullable_to_non_nullable
as String,bufferDuration: null == bufferDuration ? _self.bufferDuration : bufferDuration // ignore: cast_nullable_to_non_nullable
as int,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,autoPlay: null == autoPlay ? _self.autoPlay : autoPlay // ignore: cast_nullable_to_non_nullable
as bool,showEpgInfo: null == showEpgInfo ? _self.showEpgInfo : showEpgInfo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String locale,  bool isDarkMode,  String streamQuality,  int bufferDuration,  String userAgent,  bool autoPlay,  bool showEpgInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.locale,_that.isDarkMode,_that.streamQuality,_that.bufferDuration,_that.userAgent,_that.autoPlay,_that.showEpgInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String locale,  bool isDarkMode,  String streamQuality,  int bufferDuration,  String userAgent,  bool autoPlay,  bool showEpgInfo)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.locale,_that.isDarkMode,_that.streamQuality,_that.bufferDuration,_that.userAgent,_that.autoPlay,_that.showEpgInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String locale,  bool isDarkMode,  String streamQuality,  int bufferDuration,  String userAgent,  bool autoPlay,  bool showEpgInfo)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.locale,_that.isDarkMode,_that.streamQuality,_that.bufferDuration,_that.userAgent,_that.autoPlay,_that.showEpgInfo);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsState implements SettingsState {
  const _SettingsState({this.locale = 'en', this.isDarkMode = false, this.streamQuality = 'auto', this.bufferDuration = 5000, this.userAgent = 'default', this.autoPlay = true, this.showEpgInfo = true});
  

@override@JsonKey() final  String locale;
@override@JsonKey() final  bool isDarkMode;
@override@JsonKey() final  String streamQuality;
@override@JsonKey() final  int bufferDuration;
@override@JsonKey() final  String userAgent;
@override@JsonKey() final  bool autoPlay;
@override@JsonKey() final  bool showEpgInfo;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode)&&(identical(other.streamQuality, streamQuality) || other.streamQuality == streamQuality)&&(identical(other.bufferDuration, bufferDuration) || other.bufferDuration == bufferDuration)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.autoPlay, autoPlay) || other.autoPlay == autoPlay)&&(identical(other.showEpgInfo, showEpgInfo) || other.showEpgInfo == showEpgInfo));
}


@override
int get hashCode => Object.hash(runtimeType,locale,isDarkMode,streamQuality,bufferDuration,userAgent,autoPlay,showEpgInfo);

@override
String toString() {
  return 'SettingsState(locale: $locale, isDarkMode: $isDarkMode, streamQuality: $streamQuality, bufferDuration: $bufferDuration, userAgent: $userAgent, autoPlay: $autoPlay, showEpgInfo: $showEpgInfo)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 String locale, bool isDarkMode, String streamQuality, int bufferDuration, String userAgent, bool autoPlay, bool showEpgInfo
});




}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? isDarkMode = null,Object? streamQuality = null,Object? bufferDuration = null,Object? userAgent = null,Object? autoPlay = null,Object? showEpgInfo = null,}) {
  return _then(_SettingsState(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,streamQuality: null == streamQuality ? _self.streamQuality : streamQuality // ignore: cast_nullable_to_non_nullable
as String,bufferDuration: null == bufferDuration ? _self.bufferDuration : bufferDuration // ignore: cast_nullable_to_non_nullable
as int,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,autoPlay: null == autoPlay ? _self.autoPlay : autoPlay // ignore: cast_nullable_to_non_nullable
as bool,showEpgInfo: null == showEpgInfo ? _self.showEpgInfo : showEpgInfo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
