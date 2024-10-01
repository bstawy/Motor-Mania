import 'package:equatable/equatable.dart';

class CarBrandModelEntity extends Equatable {
  final int? id;
  final String? name;
  final int? year;

  const CarBrandModelEntity({
    required this.id,
    required this.name,
    required this.year,
  });

  @override
  List<Object?> get props => [id, name, year];
}
