import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream_auth_response.freezed.dart';
part 'xtream_auth_response.g.dart';

@freezed
abstract class XtreamAuthResponse with _$XtreamAuthResponse {
  const factory XtreamAuthResponse({
    @JsonKey(name: 'user_info') required XtreamUserInfo userInfo,
    @JsonKey(name: 'server_info') required XtreamServerInfo serverInfo,
  }) = _XtreamAuthResponse;

  factory XtreamAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$XtreamAuthResponseFromJson(json);
}

@freezed
abstract class XtreamUserInfo with _$XtreamUserInfo {
  const factory XtreamUserInfo({
    required String username,
    required String password,
    String? message,
    int? auth,
    String? status,
    @JsonKey(name: 'exp_date') String? expDate,
    @JsonKey(name: 'is_trial') String? isTrial,
    @JsonKey(name: 'active_cons') String? activeCons,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'max_connections') String? maxConnections,
    @JsonKey(name: 'allowed_output_formats') List<String>? allowedOutputFormats,
  }) = _XtreamUserInfo;

  factory XtreamUserInfo.fromJson(Map<String, dynamic> json) =>
      _$XtreamUserInfoFromJson(json);
}

@freezed
abstract class XtreamServerInfo with _$XtreamServerInfo {
  const factory XtreamServerInfo({
    String? url,
    String? port,
    @JsonKey(name: 'https_port') String? httpsPort,
    @JsonKey(name: 'server_protocol') String? serverProtocol,
    @JsonKey(name: 'rtmp_port') String? rtmpPort,
    String? timezone,
    @JsonKey(name: 'timestamp_now') int? timestampNow,
    @JsonKey(name: 'time_now') String? timeNow,
    bool? process,
  }) = _XtreamServerInfo;

  factory XtreamServerInfo.fromJson(Map<String, dynamic> json) =>
      _$XtreamServerInfoFromJson(json);
}
