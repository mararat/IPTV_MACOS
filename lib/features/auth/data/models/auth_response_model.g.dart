// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    _AuthResponseModel(
      userInfo: UserInfoModel.fromJson(
        json['user_info'] as Map<String, dynamic>,
      ),
      serverInfo: ServerInfoModel.fromJson(
        json['server_info'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$AuthResponseModelToJson(_AuthResponseModel instance) =>
    <String, dynamic>{
      'user_info': instance.userInfo,
      'server_info': instance.serverInfo,
    };

_UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    _UserInfoModel(
      username: json['username'] as String,
      password: json['password'] as String,
      message: json['message'] as String?,
      auth: (json['auth'] as num?)?.toInt(),
      status: json['status'] as String?,
      expDate: json['exp_date'] as String?,
      isTrial: json['is_trial'] as String?,
      activeCons: json['active_cons'] as String?,
      createdAt: json['created_at'] as String?,
      maxConnections: json['max_connections'] as String?,
      allowedOutputFormats: (json['allowed_output_formats'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserInfoModelToJson(_UserInfoModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'message': instance.message,
      'auth': instance.auth,
      'status': instance.status,
      'exp_date': instance.expDate,
      'is_trial': instance.isTrial,
      'active_cons': instance.activeCons,
      'created_at': instance.createdAt,
      'max_connections': instance.maxConnections,
      'allowed_output_formats': instance.allowedOutputFormats,
    };

_ServerInfoModel _$ServerInfoModelFromJson(Map<String, dynamic> json) =>
    _ServerInfoModel(
      url: json['url'] as String?,
      port: json['port'] as String?,
      httpsPort: json['https_port'] as String?,
      serverProtocol: json['server_protocol'] as String?,
      rtmpPort: json['rtmp_port'] as String?,
      timezone: json['timezone'] as String?,
      timestampNow: (json['timestamp_now'] as num?)?.toInt(),
      timeNow: json['time_now'] as String?,
      process: json['process'] as bool?,
    );

Map<String, dynamic> _$ServerInfoModelToJson(_ServerInfoModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'port': instance.port,
      'https_port': instance.httpsPort,
      'server_protocol': instance.serverProtocol,
      'rtmp_port': instance.rtmpPort,
      'timezone': instance.timezone,
      'timestamp_now': instance.timestampNow,
      'time_now': instance.timeNow,
      'process': instance.process,
    };
