import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_fashion/data/product_repository.dart';

import '../entities/product.dart';

@lazySingleton
class ProductUseCase {
  final ProductRepository _repository;

  ProductUseCase(this._repository);

  Future<Either<String, List<Product>>> getProducts() async {
    return await _repository.getProducts();
  }
}
