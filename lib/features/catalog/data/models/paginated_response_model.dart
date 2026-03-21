import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response_model.freezed.dart';
part 'paginated_response_model.g.dart';

@freezed
abstract class PaginatedResponseModel with _$PaginatedResponseModel {
  const factory PaginatedResponseModel({
    required List<Map<String, dynamic>> items,
    required int page,
    required int totalPages,
    required int totalItems,
  }) = _PaginatedResponseModel;

  factory PaginatedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedResponseModelFromJson(json);
}
