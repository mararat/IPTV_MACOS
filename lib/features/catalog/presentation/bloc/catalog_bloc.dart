import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/catalog/domain/entities/channel_entity.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_categories_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_channels_usecase.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_event.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(
    this._getCategoriesUseCase,
    this._getChannelsUseCase,
  ) : super(const CatalogState()) {
    on<CatalogLoadCategories>(_onLoadCategories);
    on<CatalogLoadChannels>(_onLoadChannels);
    on<CatalogSearchChannels>(_onSearchChannels);
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetChannelsUseCase _getChannelsUseCase;

  /// Cached full channel list for instant local search
  List<ChannelEntity> _cachedChannels = [];

  Future<void> _onLoadCategories(
    CatalogLoadCategories event,
    Emitter<CatalogState> emit,
  ) async {
    emit(state.copyWith(isLoadingCategories: true, errorMessage: null));
    final result = await _getCategoriesUseCase(
      const GetCategoriesParams(type: CategoryType.live),
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

  Future<void> _onLoadChannels(
    CatalogLoadChannels event,
    Emitter<CatalogState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingChannels: true,
      errorMessage: null,
      selectedCategoryId: event.categoryId,
      searchQuery: null,
    ));
    final result = await _getChannelsUseCase(GetChannelsParams(
      categoryId: event.categoryId,
    ));
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingChannels: false,
        errorMessage: failure.message,
      )),
      (channels) {
        _cachedChannels = channels;
        emit(state.copyWith(
          isLoadingChannels: false,
          channels: channels,
        ));
      },
    );
  }

  /// Local instant search — no API call
  void _onSearchChannels(
    CatalogSearchChannels event,
    Emitter<CatalogState> emit,
  ) {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(
        channels: _cachedChannels,
        searchQuery: null,
      ));
      return;
    }
    final filtered = _cachedChannels
        .where((c) => c.name.toLowerCase().contains(query))
        .toList();
    emit(state.copyWith(
      channels: filtered,
      searchQuery: event.query,
    ));
  }
}
