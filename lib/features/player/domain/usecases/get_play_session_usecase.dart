import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/player/domain/entities/content_type.dart';
import 'package:iptv_macos/features/player/domain/entities/play_session.dart';
import 'package:iptv_macos/features/player/domain/repositories/player_repository.dart';

class GetPlaySessionUseCase
    implements UseCase<PlaySession, PlaySessionParams> {
  const GetPlaySessionUseCase(this._repository);

  final PlayerRepository _repository;

  @override
  ResultFuture<PlaySession> call(PlaySessionParams params) {
    return _repository.getPlaySession(
      streamId: params.streamId,
      type: params.type,
      containerExtension: params.containerExtension,
    );
  }
}

class PlaySessionParams {
  const PlaySessionParams({
    required this.streamId,
    required this.type,
    this.containerExtension = 'm3u8',
  });

  final int streamId;
  final ContentType type;
  final String containerExtension;
}
