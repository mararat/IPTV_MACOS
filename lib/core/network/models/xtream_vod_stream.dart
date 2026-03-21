import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream_vod_stream.freezed.dart';
part 'xtream_vod_stream.g.dart';

@freezed
abstract class XtreamVodStream with _$XtreamVodStream {
  const factory XtreamVodStream({
    @JsonKey(name: 'num') int? num,
    required String name,
    @JsonKey(name: 'stream_type') String? streamType,
    @JsonKey(name: 'stream_id') required int streamId,
    @JsonKey(name: 'stream_icon') String? streamIcon,
    double? rating,
    @JsonKey(name: 'rating_5based') double? rating5based,
    String? added,
    @JsonKey(name: 'is_adult') String? isAdult,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'container_extension') String? containerExtension,
    @JsonKey(name: 'custom_sid') String? customSid,
    @JsonKey(name: 'direct_source') String? directSource,
  }) = _XtreamVodStream;

  factory XtreamVodStream.fromJson(Map<String, dynamic> json) =>
      _$XtreamVodStreamFromJson(json);
}
