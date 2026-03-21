import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_entity.freezed.dart';

@freezed
abstract class ChannelEntity with _$ChannelEntity {
  const factory ChannelEntity({
    required String id,
    required String name,
    String? logoUrl,
    String? categoryId,
    @Default(0) int streamId,
    String? epgChannelId,
    @Default(false) bool isFavorite,
    String? currentProgram,
    @Default(0) int tvArchive,
    @Default(0) int tvArchiveDuration,
  }) = _ChannelEntity;
}
