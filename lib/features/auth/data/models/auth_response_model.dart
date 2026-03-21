import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    @JsonKey(name: 'user_info') required UserInfoModel userInfo,
    @JsonKey(name: 'server_info') required ServerInfoModel serverInfo,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

@freezed
abstract class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
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
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}

@freezed
abstract class ServerInfoModel with _$ServerInfoModel {
  const factory ServerInfoModel({
    String? url,
    String? port,
    @JsonKey(name: 'https_port') String? httpsPort,
    @JsonKey(name: 'server_protocol') String? serverProtocol,
    @JsonKey(name: 'rtmp_port') String? rtmpPort,
    String? timezone,
    @JsonKey(name: 'timestamp_now') int? timestampNow,
    @JsonKey(name: 'time_now') String? timeNow,
    bool? process,
  }) = _ServerInfoModel;

  factory ServerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ServerInfoModelFromJson(json);
}
