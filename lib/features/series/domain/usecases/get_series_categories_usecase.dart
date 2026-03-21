import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/series/domain/repositories/series_repository.dart';

class GetSeriesCategoriesUseCase implements UseCaseNoParams<List<CategoryEntity>> {
  const GetSeriesCategoriesUseCase(this._repository);

  final SeriesRepository _repository;

  @override
  ResultFuture<List<CategoryEntity>> call() {
    return _repository.getSeriesCategories();
  }
}
