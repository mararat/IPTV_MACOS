import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/catalog/domain/entities/vod_entity.dart';
import 'package:iptv_macos/features/catalog/domain/repositories/catalog_repository.dart';

class GetVodDetailUseCase implements UseCase<VodEntity, String> {
  const GetVodDetailUseCase(this._repository);

  final CatalogRepository _repository;

  @override
  ResultFuture<VodEntity> call(String id) {
    return _repository.getVodDetail(id);
  }
}
