import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/series/domain/entities/series_entity.dart';
import 'package:iptv_macos/features/series/domain/repositories/series_repository.dart';

class GetSeriesUseCase implements UseCase<List<SeriesEntity>, GetSeriesParams> {
  const GetSeriesUseCase(this._repository);

  final SeriesRepository _repository;

  @override
  ResultFuture<List<SeriesEntity>> call(GetSeriesParams params) {
    return _repository.getSeries(
      categoryId: params.categoryId,
      query: params.query,
    );
  }
}

class GetSeriesParams {
  const GetSeriesParams({this.categoryId, this.query});
  final String? categoryId;
  final String? query;
}
