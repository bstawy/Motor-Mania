import 'package:equatable/equatable.dart';

class CarBrandEntity extends Equatable {
  final int? id;
  final String? name;
  final String? logoUrl;

  const CarBrandEntity({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  @override
  List<Object?> get props => [id, name, logoUrl];
}
