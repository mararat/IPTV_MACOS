import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_event.freezed.dart';

@freezed
sealed class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent.loadCategories() = CatalogLoadCategories;
  const factory CatalogEvent.loadChannels({
    String? categoryId,
    String? query,
  }) = CatalogLoadChannels;
  const factory CatalogEvent.searchChannels({required String query}) =
      CatalogSearchChannels;
}
