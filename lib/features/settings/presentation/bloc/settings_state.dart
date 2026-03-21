import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default('en') String locale,
    @Default(false) bool isDarkMode,
    @Default('auto') String streamQuality,
    @Default(5000) int bufferDuration,
    @Default('default') String userAgent,
    @Default(true) bool autoPlay,
    @Default(true) bool showEpgInfo,
  }) = _SettingsState;
}
