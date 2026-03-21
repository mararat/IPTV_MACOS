import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/epg/domain/entities/epg_entry.dart';

abstract class EpgRepository {
  ResultFuture<List<EpgEntry>> getEpg({
    required int streamId,
    int limit,
  });

  ResultFuture<List<EpgEntry>> getFullEpg({
    required int streamId,
  });
}
