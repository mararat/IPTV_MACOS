import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/catalog/domain/entities/channel_entity.dart';
import 'package:iptv_macos/features/catalog/domain/entities/vod_entity.dart';

abstract class CatalogRepository {
  ResultFuture<List<CategoryEntity>> getLiveCategories();
  ResultFuture<List<CategoryEntity>> getVodCategories();

  ResultFuture<List<ChannelEntity>> getLiveStreams({
    String? categoryId,
    String? query,
  });

  ResultFuture<List<VodEntity>> getVodStreams({
    String? categoryId,
    String? query,
  });

  ResultFuture<VodEntity> getVodDetail(String id);
}
