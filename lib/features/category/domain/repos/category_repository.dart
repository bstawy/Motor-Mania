import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/failures.dart';
import '../../../home/domain/entities/home_product_entity.dart';

abstract class CategoryRepository {
  Future<Either<ServerFailure, List<HomeProductEntity>>> getCategoryProducts(
      int categoryId);
}
