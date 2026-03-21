import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_entity.freezed.dart';

@freezed
abstract class VodEntity with _$VodEntity {
  const factory VodEntity({
    required String id,
    required String title,
    String? description,
    String? posterUrl,
    String? backdropUrl,
    String? categoryId,
    String? duration,
    double? rating,
    String? releaseYear,
    String? genre,
    @Default(0) int streamId,
    String? containerExtension,
  }) = _VodEntity;
}
