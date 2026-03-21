import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/features/player/domain/entities/content_type.dart';

abstract class PlayerRemoteDataSource {
  String buildStreamUrl({
    required int streamId,
    required ContentType type,
    String containerExtension,
  });
}

class PlayerRemoteDataSourceImpl implements PlayerRemoteDataSource {
  const PlayerRemoteDataSourceImpl(this._xtreamApi);

  final XtreamApiService _xtreamApi;

  @override
  String buildStreamUrl({
    required int streamId,
    required ContentType type,
    String containerExtension = 'm3u8',
  }) {
    switch (type) {
      case ContentType.live:
        return _xtreamApi.liveStreamUrl(streamId);
      case ContentType.vod:
        return _xtreamApi.vodStreamUrl(streamId, containerExtension);
      case ContentType.series:
        return _xtreamApi.seriesStreamUrl(streamId, containerExtension);
    }
  }
}
