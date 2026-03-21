import 'package:iptv_macos/core/error/error_handler.dart';
import 'package:iptv_macos/core/error/failures.dart';
import 'package:iptv_macos/core/network/network_info.dart';
import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:iptv_macos/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:iptv_macos/features/auth/data/models/auth_response_model.dart';
import 'package:iptv_macos/features/auth/domain/entities/auth_tokens.dart';
import 'package:iptv_macos/features/auth/domain/entities/user_entity.dart';
import 'package:iptv_macos/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
    this._xtreamApi,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final XtreamApiService _xtreamApi;

  @override
  ResultFuture<({UserEntity user, XtreamCredentials credentials})> login({
    required String serverUrl,
    required String username,
    required String password,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final response = await _remoteDataSource.login(
        serverUrl: serverUrl,
        username: username,
        password: password,
      );

      // Save the resolved URL (after redirect resolution)
      final resolvedUrl = _xtreamApi.serverUrl;

      // Persist credentials — non-fatal if storage fails
      try {
        await _localDataSource.saveCredentials(
          serverUrl: resolvedUrl,
          username: username,
          password: password,
        );
      } catch (_) {}

      final userInfo = response.userInfo;
      try {
        await _localDataSource.saveUser({
          'username': userInfo.username,
          'status': userInfo.status ?? 'Active',
          'expDate': userInfo.expDate ?? '',
          'maxConnections': userInfo.maxConnections ?? '',
          'activeCons': userInfo.activeCons ?? '',
          'createdAt': userInfo.createdAt ?? '',
          'isTrial': userInfo.isTrial ?? '0',
        });
      } catch (_) {}

      final user = UserEntity(
        username: userInfo.username,
        status: userInfo.status ?? 'Active',
        expDate: userInfo.expDate,
        isTrial: userInfo.isTrial,
        activeCons: userInfo.activeCons,
        createdAt: userInfo.createdAt,
        maxConnections: userInfo.maxConnections,
        allowedOutputFormats: userInfo.allowedOutputFormats ?? [],
      );

      final credentials = XtreamCredentials(
        serverUrl: resolvedUrl,
        username: username,
        password: password,
      );

      return Right((user: user, credentials: credentials));
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<void> logout() async {
    try {
      _xtreamApi.clearCredentials();
      await _localDataSource.clearAll();
      return const Right(null);
    } catch (e) {
      _xtreamApi.clearCredentials();
      await _localDataSource.clearAll();
      return const Right(null);
    }
  }

  @override
  ResultFuture<bool> isAuthenticated() async {
    try {
      final hasCredentials = await _localDataSource.hasCredentials();
      if (hasCredentials) {
        final serverUrl = await _localDataSource.getServerUrl();
        final username = await _localDataSource.getUsername();
        final password = await _localDataSource.getPassword();
        if (serverUrl != null && username != null && password != null) {
          _xtreamApi.setCredentials(
            serverUrl: serverUrl,
            username: username,
            password: password,
          );
        }
      }
      return Right(hasCredentials);
    } catch (e) {
      return const Right(false);
    }
  }

  @override
  ResultFuture<UserEntity?> getCachedUser() async {
    try {
      final data = await _localDataSource.getCachedUser();
      if (data == null) return const Right(null);
      return Right(UserEntity(
        username: data['username']?.toString() ?? '',
        status: data['status']?.toString() ?? 'Active',
        expDate: data['expDate']?.toString(),
        maxConnections: data['maxConnections']?.toString(),
        activeCons: data['activeCons']?.toString(),
        createdAt: data['createdAt']?.toString(),
        isTrial: data['isTrial']?.toString(),
      ));
    } catch (e) {
      return const Right(null);
    }
  }

  @override
  ResultFuture<UserEntity> refreshUser() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final data = await _xtreamApi.authenticate();
      final response = AuthResponseModel.fromJson(data);
      final userInfo = response.userInfo;

      await _localDataSource.saveUser({
        'username': userInfo.username,
        'status': userInfo.status ?? 'Active',
        'expDate': userInfo.expDate ?? '',
        'maxConnections': userInfo.maxConnections ?? '',
        'activeCons': userInfo.activeCons ?? '',
        'createdAt': userInfo.createdAt ?? '',
        'isTrial': userInfo.isTrial ?? '0',
      });

      return Right(UserEntity(
        username: userInfo.username,
        status: userInfo.status ?? 'Active',
        expDate: userInfo.expDate,
        isTrial: userInfo.isTrial,
        activeCons: userInfo.activeCons,
        createdAt: userInfo.createdAt,
        maxConnections: userInfo.maxConnections,
        allowedOutputFormats: userInfo.allowedOutputFormats ?? [],
      ));
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<XtreamCredentials?> getSavedCredentials() async {
    try {
      final serverUrl = await _localDataSource.getServerUrl();
      final username = await _localDataSource.getUsername();
      final password = await _localDataSource.getPassword();
      if (serverUrl == null || username == null || password == null) {
        return const Right(null);
      }
      return Right(XtreamCredentials(
        serverUrl: serverUrl,
        username: username,
        password: password,
      ));
    } catch (e) {
      return const Right(null);
    }
  }
}
