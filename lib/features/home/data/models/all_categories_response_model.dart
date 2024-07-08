import 'category_model.dart';

class AllCategoriesResponseModel {
  final bool success;
  final String message;
  final List<CategoryModel> categories;

  AllCategoriesResponseModel({
    required this.success,
    required this.message,
    required this.categories,
  });

  factory AllCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return AllCategoriesResponseModel(
      success: json['success'],
      message: json['message'],
      categories: List<CategoryModel>.from(
        json['data'].map((category) => CategoryModel.fromJson(category)),
      ),
    );
  }
}
