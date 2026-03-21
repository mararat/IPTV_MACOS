import 'package:freezed_annotation/freezed_annotation.dart';

part 'epg_entry.freezed.dart';

@freezed
abstract class EpgEntry with _$EpgEntry {
  const factory EpgEntry({
    required String id,
    required String channelId,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    String? description,
    String? genre,
    String? posterUrl,
  }) = _EpgEntry;
}
