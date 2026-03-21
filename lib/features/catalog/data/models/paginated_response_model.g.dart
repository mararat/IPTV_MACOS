// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedResponseModel _$PaginatedResponseModelFromJson(
  Map<String, dynamic> json,
) => _PaginatedResponseModel(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  page: (json['page'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalItems: (json['totalItems'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedResponseModelToJson(
  _PaginatedResponseModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'page': instance.page,
  'totalPages': instance.totalPages,
  'totalItems': instance.totalItems,
};
