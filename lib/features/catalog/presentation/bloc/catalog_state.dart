import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/catalog/domain/entities/channel_entity.dart';

part 'catalog_state.freezed.dart';

@freezed
abstract class CatalogState with _$CatalogState {
  const factory CatalogState({
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<ChannelEntity> channels,
    @Default(false) bool isLoadingCategories,
    @Default(false) bool isLoadingChannels,
    String? selectedCategoryId,
    String? searchQuery,
    String? errorMessage,
  }) = _CatalogState;
}
