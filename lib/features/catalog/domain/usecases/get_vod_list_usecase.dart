import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/catalog/domain/entities/vod_entity.dart';
import 'package:iptv_macos/features/catalog/domain/repositories/catalog_repository.dart';

class GetVodListUseCase
    implements UseCase<List<VodEntity>, GetVodListParams> {
  const GetVodListUseCase(this._repository);

  final CatalogRepository _repository;

  @override
  ResultFuture<List<VodEntity>> call(GetVodListParams params) {
    return _repository.getVodStreams(
      categoryId: params.categoryId,
      query: params.query,
    );
  }
}

class GetVodListParams {
  const GetVodListParams({
    this.categoryId,
    this.query,
  });

  final String? categoryId;
  final String? query;
}
