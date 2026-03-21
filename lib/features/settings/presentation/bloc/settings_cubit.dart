import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void toggleTheme() {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }

  void setLocale(String locale) {
    emit(state.copyWith(locale: locale));
  }

  void setStreamQuality(String quality) {
    emit(state.copyWith(streamQuality: quality));
  }

  void setBufferDuration(int ms) {
    emit(state.copyWith(bufferDuration: ms));
  }

  void setUserAgent(String agent) {
    emit(state.copyWith(userAgent: agent));
  }

  void toggleAutoPlay() {
    emit(state.copyWith(autoPlay: !state.autoPlay));
  }

  void toggleShowEpgInfo() {
    emit(state.copyWith(showEpgInfo: !state.showEpgInfo));
  }
}
