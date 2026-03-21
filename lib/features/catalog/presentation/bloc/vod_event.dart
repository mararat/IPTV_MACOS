import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_event.freezed.dart';

@freezed
sealed class VodEvent with _$VodEvent {
  const factory VodEvent.loadCategories() = VodLoadCategories;
  const factory VodEvent.loadVodList({
    String? categoryId,
  }) = VodLoadList;
  const factory VodEvent.searchVod({required String query}) = VodSearch;
  const factory VodEvent.loadVodDetail({required String id}) = VodLoadDetail;
}
