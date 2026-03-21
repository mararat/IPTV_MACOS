import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/player/domain/entities/content_type.dart';
import 'package:iptv_macos/features/player/domain/entities/play_session.dart';

abstract class PlayerRepository {
  ResultFuture<PlaySession> getPlaySession({
    required int streamId,
    required ContentType type,
    String containerExtension,
  });
}
