import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_session.freezed.dart';

@freezed
abstract class PlaySession with _$PlaySession {
  const factory PlaySession({
    required String playUrl,
    @Default({}) Map<String, String> headers,
  }) = _PlaySession;
}
