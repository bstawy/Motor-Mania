import 'product_model.dart';

class AllProductsResponseModel {
  final bool success;
  final String message;
  final List<ProductModel> products;

  AllProductsResponseModel({
    required this.success,
    required this.message,
    required this.products,
  });

  factory AllProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return AllProductsResponseModel(
      success: json['success'],
      message: json['message'],
      products: List<ProductModel>.from(
        json['data'].map((category) => ProductModel.fromJson(category)),
      ),
    );
  }
}
