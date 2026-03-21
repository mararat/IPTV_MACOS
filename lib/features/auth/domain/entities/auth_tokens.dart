import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';

@freezed
abstract class XtreamCredentials with _$XtreamCredentials {
  const factory XtreamCredentials({
    required String serverUrl,
    required String username,
    required String password,
  }) = _XtreamCredentials;
}
