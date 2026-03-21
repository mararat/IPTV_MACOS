import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/epg/domain/usecases/get_epg_usecase.dart';
import 'package:iptv_macos/features/epg/presentation/bloc/epg_event.dart';
import 'package:iptv_macos/features/epg/presentation/bloc/epg_state.dart';

class EpgBloc extends Bloc<EpgEvent, EpgState> {
  EpgBloc(this._getEpgUseCase) : super(const EpgState()) {
    on<EpgLoad>(_onLoad);
  }

  final GetEpgUseCase _getEpgUseCase;

  Future<void> _onLoad(EpgLoad event, Emitter<EpgState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      selectedStreamId: event.streamId,
    ));
    final result = await _getEpgUseCase(GetEpgParams(
      streamId: event.streamId,
      fullEpg: event.fullEpg,
    ));
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, errorMessage: f.message)),
      (entries) => emit(state.copyWith(isLoading: false, entries: entries)),
    );
  }
}
