import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream_live_stream.freezed.dart';
part 'xtream_live_stream.g.dart';

@freezed
abstract class XtreamLiveStream with _$XtreamLiveStream {
  const factory XtreamLiveStream({
    @JsonKey(name: 'num') int? num,
    required String name,
    @JsonKey(name: 'stream_type') String? streamType,
    @JsonKey(name: 'stream_id') required int streamId,
    @JsonKey(name: 'stream_icon') String? streamIcon,
    @JsonKey(name: 'epg_channel_id') String? epgChannelId,
    String? added,
    @JsonKey(name: 'is_adult') String? isAdult,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'custom_sid') String? customSid,
    @JsonKey(name: 'tv_archive') int? tvArchive,
    @JsonKey(name: 'direct_source') String? directSource,
    @JsonKey(name: 'tv_archive_duration') int? tvArchiveDuration,
  }) = _XtreamLiveStream;

  factory XtreamLiveStream.fromJson(Map<String, dynamic> json) =>
      _$XtreamLiveStreamFromJson(json);
}
