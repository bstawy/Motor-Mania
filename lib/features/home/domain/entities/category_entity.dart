import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String darkImageUrl;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.darkImageUrl,
  });

  CategoryEntity copyWith({
    String? name,
    String? imageUrl,
    String? darkImageUrl,
  }) {
    return CategoryEntity(
      id: id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      darkImageUrl: darkImageUrl ?? this.darkImageUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, imageUrl, darkImageUrl];
}
