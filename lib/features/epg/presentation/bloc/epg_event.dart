import 'package:freezed_annotation/freezed_annotation.dart';

part 'epg_event.freezed.dart';

@freezed
sealed class EpgEvent with _$EpgEvent {
  const factory EpgEvent.loadEpg({
    required int streamId,
    @Default(false) bool fullEpg,
  }) = EpgLoad;
}
