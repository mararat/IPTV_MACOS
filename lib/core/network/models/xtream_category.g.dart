// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xtream_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XtreamCategory _$XtreamCategoryFromJson(Map<String, dynamic> json) =>
    _XtreamCategory(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      parentId: (json['parent_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$XtreamCategoryToJson(_XtreamCategory instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'parent_id': instance.parentId,
    };
