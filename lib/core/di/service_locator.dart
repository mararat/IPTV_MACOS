import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iptv_macos/core/logging/app_logger.dart';
import 'package:iptv_macos/core/logging/analytics_service.dart';
import 'package:iptv_macos/core/network/dio_client.dart';
import 'package:iptv_macos/core/network/interceptors/auth_interceptor.dart';
import 'package:iptv_macos/core/network/interceptors/correlation_id_interceptor.dart';
import 'package:iptv_macos/core/network/interceptors/retry_interceptor.dart';
import 'package:iptv_macos/core/network/network_info.dart';
import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/core/services/watch_history_service.dart';
import 'package:iptv_macos/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:iptv_macos/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:iptv_macos/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:iptv_macos/features/auth/domain/repositories/auth_repository.dart';
import 'package:iptv_macos/features/auth/domain/usecases/check_auth_usecase.dart';
import 'package:iptv_macos/features/auth/domain/usecases/login_usecase.dart';
import 'package:iptv_macos/features/auth/domain/usecases/logout_usecase.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/catalog/data/datasources/catalog_remote_datasource.dart';
import 'package:iptv_macos/features/catalog/data/repositories/catalog_repository_impl.dart';
import 'package:iptv_macos/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_categories_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_channels_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_vod_detail_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_vod_list_usecase.dart';
import 'package:iptv_macos/features/player/data/datasources/player_remote_datasource.dart';
import 'package:iptv_macos/features/player/data/repositories/player_repository_impl.dart';
import 'package:iptv_macos/features/player/domain/repositories/player_repository.dart';
import 'package:iptv_macos/features/player/domain/usecases/get_play_session_usecase.dart';
import 'package:iptv_macos/features/series/data/datasources/series_remote_datasource.dart';
import 'package:iptv_macos/features/series/data/repositories/series_repository_impl.dart';
import 'package:iptv_macos/features/series/domain/repositories/series_repository.dart';
import 'package:iptv_macos/features/series/domain/usecases/get_series_categories_usecase.dart';
import 'package:iptv_macos/features/series/domain/usecases/get_series_info_usecase.dart';
import 'package:iptv_macos/features/series/domain/usecases/get_series_usecase.dart';
import 'package:talker/talker.dart';

class ServiceLocator {
  ServiceLocator._();
  static final instance = ServiceLocator._();

  late final Talker talker;
  late final Dio dio;
  late final FlutterSecureStorage secureStorage;
  late final AppLogger logger;
  late final AnalyticsService analyticsService;
  late final NetworkInfo networkInfo;
  late final XtreamApiService xtreamApi;
  late final WatchHistoryService watchHistoryService;
  late final DioClient dioClient;

  // Auth
  late final AuthLocalDataSource authLocalDataSource;
  late final AuthRemoteDataSource authRemoteDataSource;
  late final AuthRepository authRepository;
  late final LoginUseCase loginUseCase;
  late final LogoutUseCase logoutUseCase;
  late final CheckAuthUseCase checkAuthUseCase;

  // Catalog
  late final CatalogRemoteDataSource catalogRemoteDataSource;
  late final CatalogRepository catalogRepository;
  late final GetCategoriesUseCase getCategoriesUseCase;
  late final GetChannelsUseCase getChannelsUseCase;
  late final GetVodListUseCase getVodListUseCase;
  late final GetVodDetailUseCase getVodDetailUseCase;

  // Series
  late final SeriesRemoteDataSource seriesRemoteDataSource;
  late final SeriesRepository seriesRepository;
  late final GetSeriesCategoriesUseCase getSeriesCategoriesUseCase;
  late final GetSeriesUseCase getSeriesUseCase;
  late final GetSeriesInfoUseCase getSeriesInfoUseCase;

  // Player
  late final PlayerRemoteDataSource playerRemoteDataSource;
  late final PlayerRepository playerRepository;
  late final GetPlaySessionUseCase getPlaySessionUseCase;

  void init() {
    // Core
    talker = Talker(settings: TalkerSettings(enabled: true, useConsoleLogs: true));
    secureStorage = const FlutterSecureStorage();
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 15),
      headers: {'Accept': 'application/json'},
    ));
    logger = AppLogger(talker);
    analyticsService = AnalyticsService(logger);
    networkInfo = NetworkInfoImpl(Connectivity());
    xtreamApi = XtreamApiService(dio);
    watchHistoryService = WatchHistoryService(secureStorage);

    final authInterceptor = AuthInterceptor();
    final correlationIdInterceptor = CorrelationIdInterceptor();
    final retryInterceptor = RetryInterceptor(dio);
    dioClient = DioClient(dio, talker, authInterceptor, correlationIdInterceptor, retryInterceptor);

    // Auth
    authLocalDataSource = AuthLocalDataSourceImpl(secureStorage);
    authRemoteDataSource = AuthRemoteDataSourceImpl(xtreamApi);
    authRepository = AuthRepositoryImpl(authRemoteDataSource, authLocalDataSource, networkInfo, xtreamApi);
    loginUseCase = LoginUseCase(authRepository);
    logoutUseCase = LogoutUseCase(authRepository);
    checkAuthUseCase = CheckAuthUseCase(authRepository);

    // Catalog
    catalogRemoteDataSource = CatalogRemoteDataSourceImpl(xtreamApi);
    catalogRepository = CatalogRepositoryMacImpl(catalogRemoteDataSource, networkInfo);
    getCategoriesUseCase = GetCategoriesUseCase(catalogRepository);
    getChannelsUseCase = GetChannelsUseCase(catalogRepository);
    getVodListUseCase = GetVodListUseCase(catalogRepository);
    getVodDetailUseCase = GetVodDetailUseCase(catalogRepository);

    // Series
    seriesRemoteDataSource = SeriesRemoteDataSourceImpl(xtreamApi);
    seriesRepository = SeriesRepositoryImpl(seriesRemoteDataSource, networkInfo, logger);
    getSeriesCategoriesUseCase = GetSeriesCategoriesUseCase(seriesRepository);
    getSeriesUseCase = GetSeriesUseCase(seriesRepository);
    getSeriesInfoUseCase = GetSeriesInfoUseCase(seriesRepository);

    // Player
    playerRemoteDataSource = PlayerRemoteDataSourceImpl(xtreamApi);
    playerRepository = PlayerRepositoryImpl(playerRemoteDataSource);
    getPlaySessionUseCase = GetPlaySessionUseCase(playerRepository);
  }

  AuthBloc createAuthBloc() => AuthBloc(
    loginUseCase, logoutUseCase, checkAuthUseCase,
    authRepository, xtreamApi, analyticsService, null, logger,
  );

  /// Clean up all resources on app exit.
  void dispose() {
    xtreamApi.clearCredentials();
    dio.close(force: true);
  }
}

final sl = ServiceLocator.instance;
