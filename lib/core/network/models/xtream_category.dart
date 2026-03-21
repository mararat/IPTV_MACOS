import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream_category.freezed.dart';
part 'xtream_category.g.dart';

@freezed
abstract class XtreamCategory with _$XtreamCategory {
  const factory XtreamCategory({
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'parent_id') @Default(0) int parentId,
  }) = _XtreamCategory;

  factory XtreamCategory.fromJson(Map<String, dynamic> json) =>
      _$XtreamCategoryFromJson(json);
}
