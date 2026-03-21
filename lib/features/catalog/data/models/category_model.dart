import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    String? iconUrl,
    @Default(0) int parentId,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.fromXtream(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['category_id']?.toString() ?? '',
      name: json['category_name']?.toString() ?? '',
      parentId: int.tryParse(json['parent_id']?.toString() ?? '0') ?? 0,
    );
  }
}
