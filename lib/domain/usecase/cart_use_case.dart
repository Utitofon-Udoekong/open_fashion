import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:open_fashion/data/cart_repository.dart';

import '../entities/cart_item.dart';

@lazySingleton
class CartUseCase {
  final CartRepository _repository;

  CartUseCase(this._repository);

  Future<Either<String, String>> addToCart(CartItem cartItem) async {
    return await _repository.addToCart(cartItem);
  }

  Future<Either<String, String>> removeFromCart(String id) async {
    return await _repository.removeFromCart(id);
  }

  Future<Either<String, String>> deleteFromCart(int id) async {
    return await _repository.deleteFromCart(id);
  }

  bool isCartEmpty() => _repository.isCartEmpty();
  bool itemExists(String id) => _repository.itemExists(id);
}
