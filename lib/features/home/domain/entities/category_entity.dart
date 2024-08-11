import 'package:equatable/equatable.dart';

class HomeCategoryEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  const HomeCategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  HomeCategoryEntity copyWith({
    String? name,
    String? imageUrl,
  }) {
    return HomeCategoryEntity(
      id: id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, imageUrl];
}
