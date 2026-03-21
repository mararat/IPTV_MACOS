import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/epg/domain/entities/epg_entry.dart';
import 'package:iptv_macos/features/epg/domain/repositories/epg_repository.dart';

class GetEpgUseCase implements UseCase<List<EpgEntry>, GetEpgParams> {
  const GetEpgUseCase(this._repository);

  final EpgRepository _repository;

  @override
  ResultFuture<List<EpgEntry>> call(GetEpgParams params) {
    if (params.fullEpg) {
      return _repository.getFullEpg(streamId: params.streamId);
    }
    return _repository.getEpg(
      streamId: params.streamId,
      limit: params.limit,
    );
  }
}

class GetEpgParams {
  const GetEpgParams({
    required this.streamId,
    this.limit = 4,
    this.fullEpg = false,
  });

  final int streamId;
  final int limit;
  final bool fullEpg;
}
