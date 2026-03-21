import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/catalog/domain/entities/vod_entity.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_categories_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_vod_detail_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_vod_list_usecase.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_event.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_state.dart';

class VodBloc extends Bloc<VodEvent, VodState> {
  VodBloc(
    this._getVodListUseCase,
    this._getVodDetailUseCase,
    this._getCategoriesUseCase,
  ) : super(const VodState()) {
    on<VodLoadCategories>(_onLoadCategories);
    on<VodLoadList>(_onLoadList);
    on<VodSearch>(_onSearch);
    on<VodLoadDetail>(_onLoadDetail);
  }

  final GetVodListUseCase _getVodListUseCase;
  final GetVodDetailUseCase _getVodDetailUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;

  /// Cached full VOD list for instant local search
  List<VodEntity> _cachedVodList = [];

  Future<void> _onLoadCategories(
    VodLoadCategories event,
    Emitter<VodState> emit,
  ) async {
    emit(state.copyWith(isLoadingCategories: true, errorMessage: null));
    final result = await _getCategoriesUseCase(
      const GetCategoriesParams(type: CategoryType.vod),
    );
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

  Future<void> _onLoadList(VodLoadList event, Emitter<VodState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      selectedCategoryId: event.categoryId,
    ));
    final result = await _getVodListUseCase(GetVodListParams(
      categoryId: event.categoryId,
    ));
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, errorMessage: f.message)),
      (vodList) {
        _cachedVodList = vodList;
        emit(state.copyWith(isLoading: false, vodList: vodList));
      },
    );
  }

  /// Local instant search — no API call
  void _onSearch(VodSearch event, Emitter<VodState> emit) {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(vodList: _cachedVodList));
      return;
    }
    final filtered = _cachedVodList
        .where((v) => v.title.toLowerCase().contains(query))
        .toList();
    emit(state.copyWith(vodList: filtered));
  }

  Future<void> _onLoadDetail(
      VodLoadDetail event, Emitter<VodState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      selectedVod: null,
    ));
    final result = await _getVodDetailUseCase(event.id);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, errorMessage: f.message)),
      (vod) => emit(state.copyWith(isLoading: false, selectedVod: vod)),
    );
  }
}
