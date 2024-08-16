import '../../domain/entities/category_entity.dart';

class HomeCategoryModel extends HomeCategoryEntity {
  const HomeCategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}
