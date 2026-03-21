import 'package:freezed_annotation/freezed_annotation.dart';

part 'epg_entry_model.freezed.dart';
part 'epg_entry_model.g.dart';

@freezed
abstract class EpgEntryModel with _$EpgEntryModel {
  const factory EpgEntryModel({
    required String id,
    required String channelId,
    required String title,
    required String startTime,
    required String endTime,
    String? description,
    String? genre,
    String? posterUrl,
  }) = _EpgEntryModel;

  factory EpgEntryModel.fromJson(Map<String, dynamic> json) =>
      _$EpgEntryModelFromJson(json);
}
