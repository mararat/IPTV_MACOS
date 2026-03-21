import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String username,
    required String status,
    String? expDate,
    String? isTrial,
    String? activeCons,
    String? createdAt,
    String? maxConnections,
    @Default([]) List<String> allowedOutputFormats,
  }) = _UserEntity;
}
