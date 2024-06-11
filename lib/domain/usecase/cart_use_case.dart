import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:open_fashion/data/cart_repository.dart';
import 'package:open_fashion/domain/entities/payment_method.dart';
import 'package:open_fashion/domain/entities/shipping_address.dart';

import '../entities/cart_item.dart';

@lazySingleton
class CartUseCase {
  final CartRepository _repository;

  CartUseCase(this._repository);

  Future<Either<String, String>> addToCart(CartItem cartItem) async {
    return await _repository.addToCart(cartItem);
  }

  Future<Either<String, String>> removeFromCart(int id) async {
    return await _repository.removeFromCart(id);
  }

  Future<Either<String, String>> deleteFromCart(int id) async {
    return await _repository.deleteFromCart(id);
  }

  Future<Either<String, String>> addShippingAddress(ShippingAddress shippingAddress) async {
    return await _repository.addShippingAddress(shippingAddress);
  }

  Future<Either<String, String>> addPaymentMethod(PaymentMethod paymentMethod) async {
    return await _repository.addPaymentMethod(paymentMethod);
  }
  void clearCart() => _repository.clearCart();

  bool isCartEmpty() => _repository.isCartEmpty();
}
