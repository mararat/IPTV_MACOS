import 'package:iptv_macos/core/error/error_handler.dart';
import 'package:iptv_macos/core/error/failures.dart';
import 'package:iptv_macos/core/network/network_info.dart';
import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/epg/data/datasources/epg_remote_datasource.dart';
import 'package:iptv_macos/features/epg/data/models/epg_entry_model.dart';
import 'package:iptv_macos/features/epg/domain/entities/epg_entry.dart';
import 'package:iptv_macos/features/epg/domain/repositories/epg_repository.dart';

class EpgRepositoryImpl implements EpgRepository {
  const EpgRepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );

  final EpgRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  ResultFuture<List<EpgEntry>> getEpg({
    required int streamId,
    int limit = 4,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final models = await _remoteDataSource.getEpg(
        streamId: streamId,
        limit: limit,
      );
      return Right(models.map(_mapEpgModel).toList());
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<List<EpgEntry>> getFullEpg({
    required int streamId,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final models = await _remoteDataSource.getFullEpg(streamId: streamId);
      return Right(models.map(_mapEpgModel).toList());
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  static EpgEntry _mapEpgModel(EpgEntryModel m) {
    DateTime? startTime;
    DateTime? endTime;
    try {
      startTime = DateTime.parse(m.startTime);
      endTime = DateTime.parse(m.endTime);
    } on FormatException catch (_) {
      // Invalid date format — use defaults
    }
    return EpgEntry(
      id: m.id,
      channelId: m.channelId,
      title: m.title,
      startTime: startTime ?? DateTime.now(),
      endTime: endTime ?? DateTime.now(),
      description: m.description,
      genre: m.genre,
      posterUrl: m.posterUrl,
    );
  }
}
