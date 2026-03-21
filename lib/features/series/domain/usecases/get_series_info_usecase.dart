import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/series/domain/entities/series_detail_entity.dart';
import 'package:iptv_macos/features/series/domain/repositories/series_repository.dart';

class GetSeriesInfoUseCase implements UseCase<SeriesDetailEntity, int> {
  const GetSeriesInfoUseCase(this._repository);

  final SeriesRepository _repository;

  @override
  ResultFuture<SeriesDetailEntity> call(int seriesId) {
    return _repository.getSeriesInfo(seriesId);
  }
}
