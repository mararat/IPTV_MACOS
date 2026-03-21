import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_model.freezed.dart';
part 'vod_model.g.dart';

@freezed
abstract class VodModel with _$VodModel {
  const factory VodModel({
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
  }) = _VodModel;

  factory VodModel.fromJson(Map<String, dynamic> json) =>
      _$VodModelFromJson(json);

  factory VodModel.fromXtream(Map<String, dynamic> json) {
    return VodModel(
      id: json['stream_id']?.toString() ?? '',
      title: json['name']?.toString() ?? '',
      posterUrl: json['stream_icon']?.toString() ?? json['cover']?.toString() ?? json['movie_image']?.toString(),
      categoryId: json['category_id']?.toString(),
      rating: _parseDouble(json['rating_5based'] ?? json['rating']),
      streamId: json['stream_id'] is int
          ? json['stream_id'] as int
          : int.tryParse(json['stream_id']?.toString() ?? '0') ?? 0,
      containerExtension: json['container_extension']?.toString(),
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString());
  }
}
