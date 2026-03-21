import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/series/domain/entities/series_entity.dart';
import 'package:iptv_macos/features/series/domain/usecases/get_series_categories_usecase.dart';
import 'package:iptv_macos/features/series/domain/usecases/get_series_info_usecase.dart';
import 'package:iptv_macos/features/series/domain/usecases/get_series_usecase.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_event.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc(
    this._getSeriesUseCase,
    this._getSeriesCategoriesUseCase,
    this._getSeriesInfoUseCase,
  ) : super(const SeriesState()) {
    on<SeriesLoadCategories>(_onLoadCategories);
    on<SeriesLoadList>(_onLoadSeries);
    on<SeriesSearch>(_onSearch);
    on<SeriesLoadInfo>(_onLoadSeriesInfo);
  }

  final GetSeriesUseCase _getSeriesUseCase;
  final GetSeriesCategoriesUseCase _getSeriesCategoriesUseCase;
  final GetSeriesInfoUseCase _getSeriesInfoUseCase;

  /// Cached full series list for instant local search
  List<SeriesEntity> _cachedSeriesList = [];

  Future<void> _onLoadCategories(
    SeriesLoadCategories event,
    Emitter<SeriesState> emit,
  ) async {
    emit(state.copyWith(isLoadingCategories: true, errorMessage: null));
    final result = await _getSeriesCategoriesUseCase();
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingCategories: false,
        errorMessage: failure.message,
      )),
      (categories) => emit(state.copyWith(
        isLoadingCategories: false,
        categories: categories,
      )),
    );
  }

  Future<void> _onLoadSeries(
    SeriesLoadList event,
    Emitter<SeriesState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      selectedCategoryId: event.categoryId,
    ));
    final result = await _getSeriesUseCase(GetSeriesParams(
      categoryId: event.categoryId,
    ));
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, errorMessage: f.message)),
      (list) {
        _cachedSeriesList = list;
        emit(state.copyWith(isLoading: false, seriesList: list));
      },
    );
  }

  /// Local instant search — no API call
  void _onSearch(SeriesSearch event, Emitter<SeriesState> emit) {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(seriesList: _cachedSeriesList));
      return;
    }
    final filtered = _cachedSeriesList
        .where((s) => s.name.toLowerCase().contains(query))
        .toList();
    emit(state.copyWith(seriesList: filtered));
  }

  Future<void> _onLoadSeriesInfo(
    SeriesLoadInfo event,
    Emitter<SeriesState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingDetail: true,
      errorMessage: null,
      selectedSeriesDetail: null,
    ));
    final result = await _getSeriesInfoUseCase(event.seriesId);
    result.fold(
      (f) => emit(state.copyWith(isLoadingDetail: false, errorMessage: f.message)),
      (detail) => emit(state.copyWith(isLoadingDetail: false, selectedSeriesDetail: detail)),
    );
  }
}
