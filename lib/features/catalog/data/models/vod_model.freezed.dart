// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodModel {

 String get id; String get title; String? get description; String? get posterUrl; String? get backdropUrl; String? get categoryId; String? get duration; double? get rating; String? get releaseYear; String? get genre; int get streamId; String? get containerExtension;
/// Create a copy of VodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VodModelCopyWith<VodModel> get copyWith => _$VodModelCopyWithImpl<VodModel>(this as VodModel, _$identity);

  /// Serializes this VodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl)&&(identical(other.backdropUrl, backdropUrl) || other.backdropUrl == backdropUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,posterUrl,backdropUrl,categoryId,duration,rating,releaseYear,genre,streamId,containerExtension);

@override
String toString() {
  return 'VodModel(id: $id, title: $title, description: $description, posterUrl: $posterUrl, backdropUrl: $backdropUrl, categoryId: $categoryId, duration: $duration, rating: $rating, releaseYear: $releaseYear, genre: $genre, streamId: $streamId, containerExtension: $containerExtension)';
}


}

/// @nodoc
abstract mixin class $VodModelCopyWith<$Res>  {
  factory $VodModelCopyWith(VodModel value, $Res Function(VodModel) _then) = _$VodModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, String? posterUrl, String? backdropUrl, String? categoryId, String? duration, double? rating, String? releaseYear, String? genre, int streamId, String? containerExtension
});




}
/// @nodoc
class _$VodModelCopyWithImpl<$Res>
    implements $VodModelCopyWith<$Res> {
  _$VodModelCopyWithImpl(this._self, this._then);

  final VodModel _self;
  final $Res Function(VodModel) _then;

/// Create a copy of VodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? posterUrl = freezed,Object? backdropUrl = freezed,Object? categoryId = freezed,Object? duration = freezed,Object? rating = freezed,Object? releaseYear = freezed,Object? genre = freezed,Object? streamId = null,Object? containerExtension = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,backdropUrl: freezed == backdropUrl ? _self.backdropUrl : backdropUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,releaseYear: freezed == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VodModel].
extension VodModelPatterns on VodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VodModel value)  $default,){
final _that = this;
switch (_that) {
case _VodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VodModel value)?  $default,){
final _that = this;
switch (_that) {
case _VodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String? posterUrl,  String? backdropUrl,  String? categoryId,  String? duration,  double? rating,  String? releaseYear,  String? genre,  int streamId,  String? containerExtension)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VodModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.posterUrl,_that.backdropUrl,_that.categoryId,_that.duration,_that.rating,_that.releaseYear,_that.genre,_that.streamId,_that.containerExtension);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String? posterUrl,  String? backdropUrl,  String? categoryId,  String? duration,  double? rating,  String? releaseYear,  String? genre,  int streamId,  String? containerExtension)  $default,) {final _that = this;
switch (_that) {
case _VodModel():
return $default(_that.id,_that.title,_that.description,_that.posterUrl,_that.backdropUrl,_that.categoryId,_that.duration,_that.rating,_that.releaseYear,_that.genre,_that.streamId,_that.containerExtension);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  String? posterUrl,  String? backdropUrl,  String? categoryId,  String? duration,  double? rating,  String? releaseYear,  String? genre,  int streamId,  String? containerExtension)?  $default,) {final _that = this;
switch (_that) {
case _VodModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.posterUrl,_that.backdropUrl,_that.categoryId,_that.duration,_that.rating,_that.releaseYear,_that.genre,_that.streamId,_that.containerExtension);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VodModel implements VodModel {
  const _VodModel({required this.id, required this.title, this.description, this.posterUrl, this.backdropUrl, this.categoryId, this.duration, this.rating, this.releaseYear, this.genre, this.streamId = 0, this.containerExtension});
  factory _VodModel.fromJson(Map<String, dynamic> json) => _$VodModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  String? posterUrl;
@override final  String? backdropUrl;
@override final  String? categoryId;
@override final  String? duration;
@override final  double? rating;
@override final  String? releaseYear;
@override final  String? genre;
@override@JsonKey() final  int streamId;
@override final  String? containerExtension;

/// Create a copy of VodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VodModelCopyWith<_VodModel> get copyWith => __$VodModelCopyWithImpl<_VodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VodModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl)&&(identical(other.backdropUrl, backdropUrl) || other.backdropUrl == backdropUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,posterUrl,backdropUrl,categoryId,duration,rating,releaseYear,genre,streamId,containerExtension);

@override
String toString() {
  return 'VodModel(id: $id, title: $title, description: $description, posterUrl: $posterUrl, backdropUrl: $backdropUrl, categoryId: $categoryId, duration: $duration, rating: $rating, releaseYear: $releaseYear, genre: $genre, streamId: $streamId, containerExtension: $containerExtension)';
}


}

/// @nodoc
abstract mixin class _$VodModelCopyWith<$Res> implements $VodModelCopyWith<$Res> {
  factory _$VodModelCopyWith(_VodModel value, $Res Function(_VodModel) _then) = __$VodModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, String? posterUrl, String? backdropUrl, String? categoryId, String? duration, double? rating, String? releaseYear, String? genre, int streamId, String? containerExtension
});




}
/// @nodoc
class __$VodModelCopyWithImpl<$Res>
    implements _$VodModelCopyWith<$Res> {
  __$VodModelCopyWithImpl(this._self, this._then);

  final _VodModel _self;
  final $Res Function(_VodModel) _then;

/// Create a copy of VodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? posterUrl = freezed,Object? backdropUrl = freezed,Object? categoryId = freezed,Object? duration = freezed,Object? rating = freezed,Object? releaseYear = freezed,Object? genre = freezed,Object? streamId = null,Object? containerExtension = freezed,}) {
  return _then(_VodModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,backdropUrl: freezed == backdropUrl ? _self.backdropUrl : backdropUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,releaseYear: freezed == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
