import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_session_model.freezed.dart';
part 'play_session_model.g.dart';

@freezed
abstract class PlaySessionModel with _$PlaySessionModel {
  const factory PlaySessionModel({
    required String playUrl,
    required String playToken,
    required String expiresAt,
    @Default({}) Map<String, String> headers,
  }) = _PlaySessionModel;

  factory PlaySessionModel.fromJson(Map<String, dynamic> json) =>
      _$PlaySessionModelFromJson(json);
}
