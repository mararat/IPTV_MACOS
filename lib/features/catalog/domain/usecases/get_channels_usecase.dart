import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/catalog/domain/entities/channel_entity.dart';
import 'package:iptv_macos/features/catalog/domain/repositories/catalog_repository.dart';

class GetChannelsUseCase
    implements UseCase<List<ChannelEntity>, GetChannelsParams> {
  const GetChannelsUseCase(this._repository);

  final CatalogRepository _repository;

  @override
  ResultFuture<List<ChannelEntity>> call(GetChannelsParams params) {
    return _repository.getLiveStreams(
      categoryId: params.categoryId,
      query: params.query,
    );
  }
}

class GetChannelsParams {
  const GetChannelsParams({
    this.categoryId,
    this.query,
  });

  final String? categoryId;
  final String? query;
}
