import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/player/data/datasources/player_remote_datasource.dart';
import 'package:iptv_macos/features/player/domain/entities/content_type.dart';
import 'package:iptv_macos/features/player/domain/entities/play_session.dart';
import 'package:iptv_macos/features/player/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  const PlayerRepositoryImpl(this._remoteDataSource);

  final PlayerRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<PlaySession> getPlaySession({
    required int streamId,
    required ContentType type,
    String containerExtension = 'm3u8',
  }) async {
    try {
      final url = _remoteDataSource.buildStreamUrl(
        streamId: streamId,
        type: type,
        containerExtension: containerExtension,
      );
      return Right(PlaySession(playUrl: url));
    } catch (e) {
      return Right(PlaySession(playUrl: ''));
    }
  }
}
