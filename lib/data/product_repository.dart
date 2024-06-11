import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_fashion/constants/helpers/methods.dart';
import 'package:open_fashion/domain/entities/product.dart';

@singleton
class ProductRepository {

  ProductRepository();

  Future<Either<String, List<Product>>> getProducts() async {
    try {
      final products = <Product>[];
      final productList = await readJsonFile('assets/data.json');

      for (var i = 0; i < productList.length; i++) {
        products.add(Product.fromMap(productList[i]));
      }

      return right(products);
    } on DioException catch (e) {
      return left(e.message!);
    }
  }
}
