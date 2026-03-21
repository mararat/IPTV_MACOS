import 'package:iptv_macos/core/error/exceptions.dart';
import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/features/auth/data/models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login({
    required String serverUrl,
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._xtreamApi);

  final XtreamApiService _xtreamApi;

  @override
  Future<AuthResponseModel> login({
    required String serverUrl,
    required String username,
    required String password,
  }) async {
    try {
      _xtreamApi.setCredentials(
        serverUrl: serverUrl,
        username: username,
        password: password,
      );

      await _xtreamApi.resolveServerUrl();

      final data = await _xtreamApi.authenticate();
      return AuthResponseModel.fromJson(data);
    } on AuthException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'Giriş başarısız: $e',
      );
    }
  }
}
