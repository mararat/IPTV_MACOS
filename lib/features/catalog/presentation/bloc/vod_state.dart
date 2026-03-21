import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/catalog/domain/entities/vod_entity.dart';

part 'vod_state.freezed.dart';

@freezed
abstract class VodState with _$VodState {
  const factory VodState({
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<VodEntity> vodList,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingCategories,
    String? selectedCategoryId,
    VodEntity? selectedVod,
    String? errorMessage,
  }) = _VodState;
}
