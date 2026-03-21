import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_model.freezed.dart';
part 'channel_model.g.dart';

@freezed
abstract class ChannelModel with _$ChannelModel {
  const factory ChannelModel({
    required String id,
    required String name,
    String? logoUrl,
    String? categoryId,
    @Default(0) int streamId,
    String? epgChannelId,
    @Default(0) int tvArchive,
    @Default(0) int tvArchiveDuration,
  }) = _ChannelModel;

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  factory ChannelModel.fromXtream(Map<String, dynamic> json) {
    return ChannelModel(
      id: json['stream_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      logoUrl: json['stream_icon']?.toString() ?? json['cover']?.toString(),
      categoryId: json['category_id']?.toString(),
      streamId: json['stream_id'] is int
          ? json['stream_id'] as int
          : int.tryParse(json['stream_id']?.toString() ?? '0') ?? 0,
      epgChannelId: json['epg_channel_id']?.toString(),
      tvArchive: json['tv_archive'] is int
          ? json['tv_archive'] as int
          : int.tryParse(json['tv_archive']?.toString() ?? '0') ?? 0,
      tvArchiveDuration: json['tv_archive_duration'] is int
          ? json['tv_archive_duration'] as int
          : int.tryParse(json['tv_archive_duration']?.toString() ?? '0') ?? 0,
    );
  }
}
