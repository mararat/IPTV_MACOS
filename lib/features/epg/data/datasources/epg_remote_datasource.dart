import 'package:iptv_macos/core/error/exceptions.dart';
import 'package:iptv_macos/core/network/models/xtream_epg_listing.dart';
import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/features/epg/data/models/epg_entry_model.dart';

abstract class EpgRemoteDataSource {
  Future<List<EpgEntryModel>> getEpg({
    required int streamId,
    int limit,
  });

  Future<List<EpgEntryModel>> getFullEpg({
    required int streamId,
  });
}

class EpgRemoteDataSourceImpl implements EpgRemoteDataSource {
  const EpgRemoteDataSourceImpl(this._xtreamApi);

  final XtreamApiService _xtreamApi;

  @override
  Future<List<EpgEntryModel>> getEpg({
    required int streamId,
    int limit = 4,
  }) async {
    try {
      final data = await _xtreamApi.getShortEpg(streamId, limit: limit);
      final listings = data['epg_listings'] as List<dynamic>? ?? [];
      return listings.map((e) {
        final listing = XtreamEpgListing.fromJson(e as Map<String, dynamic>);
        return EpgEntryModel(
          id: listing.id ?? listing.epgId ?? '',
          channelId: listing.channelId ?? streamId.toString(),
          title: listing.decodedTitle,
          startTime: listing.start ?? '',
          endTime: listing.end ?? '',
          description: listing.decodedDescription,
        );
      }).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch EPG: $e');
    }
  }

  @override
  Future<List<EpgEntryModel>> getFullEpg({
    required int streamId,
  }) async {
    try {
      final data = await _xtreamApi.getSimpleDataTable(streamId);
      final listings = data['epg_listings'] as List<dynamic>? ?? [];
      return listings.map((e) {
        final listing = XtreamEpgListing.fromJson(e as Map<String, dynamic>);
        return EpgEntryModel(
          id: listing.id ?? listing.epgId ?? '',
          channelId: listing.channelId ?? streamId.toString(),
          title: listing.decodedTitle,
          startTime: listing.start ?? '',
          endTime: listing.end ?? '',
          description: listing.decodedDescription,
        );
      }).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch full EPG: $e');
    }
  }
}
