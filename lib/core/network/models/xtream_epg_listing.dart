import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream_epg_listing.freezed.dart';
part 'xtream_epg_listing.g.dart';

@freezed
abstract class XtreamEpgListing with _$XtreamEpgListing {
  const XtreamEpgListing._();

  const factory XtreamEpgListing({
    String? id,
    @JsonKey(name: 'epg_id') String? epgId,
    String? title,
    @JsonKey(name: 'lang') String? lang,
    String? start,
    String? end,
    String? description,
    @JsonKey(name: 'channel_id') String? channelId,
    @JsonKey(name: 'start_timestamp') String? startTimestamp,
    @JsonKey(name: 'stop_timestamp') String? stopTimestamp,
    @JsonKey(name: 'now_playing') int? nowPlaying,
    @JsonKey(name: 'has_archive') int? hasArchive,
  }) = _XtreamEpgListing;

  factory XtreamEpgListing.fromJson(Map<String, dynamic> json) =>
      _$XtreamEpgListingFromJson(json);

  String get decodedTitle {
    if (title == null || title!.isEmpty) return '';
    try {
      return utf8.decode(base64Decode(title!));
    } catch (_) {
      return title!;
    }
  }

  String get decodedDescription {
    if (description == null || description!.isEmpty) return '';
    try {
      return utf8.decode(base64Decode(description!));
    } catch (_) {
      return description!;
    }
  }
}
