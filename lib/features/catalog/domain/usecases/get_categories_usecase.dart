import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/catalog/domain/repositories/catalog_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, GetCategoriesParams> {
  const GetCategoriesUseCase(this._repository);

  final CatalogRepository _repository;

  @override
  ResultFuture<List<CategoryEntity>> call(GetCategoriesParams params) {
    if (params.type == CategoryType.vod) {
      return _repository.getVodCategories();
    }
    return _repository.getLiveCategories();
  }
}

enum CategoryType { live, vod }

class GetCategoriesParams {
  const GetCategoriesParams({this.type = CategoryType.live});
  final CategoryType type;
}
