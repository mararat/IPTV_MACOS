import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iptv_macos/features/epg/domain/entities/epg_entry.dart';

part 'epg_state.freezed.dart';

@freezed
abstract class EpgState with _$EpgState {
  const factory EpgState({
    @Default([]) List<EpgEntry> entries,
    @Default(false) bool isLoading,
    int? selectedStreamId,
    String? errorMessage,
  }) = _EpgState;
}
