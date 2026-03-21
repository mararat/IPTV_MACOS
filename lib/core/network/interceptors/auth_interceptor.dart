import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  // Xtream Codes uses query parameter authentication (username/password in URL),
  // so this interceptor is kept as a no-op placeholder.
  // Auth is handled by XtreamApiService URL building.
}
