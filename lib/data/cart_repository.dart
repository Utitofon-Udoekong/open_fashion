import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'package:open_fashion/data/local/cart_dao.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';

@singleton
class CartRepository {
  final CartDao _cartDao;

  CartRepository(this._cartDao);

  Future<Either<String, String>> addToCart(CartItem cartItem) async {
    try {
      await _cartDao.addToCart(cartItem);
      return right('Product added to cart');
    } on DioException catch (e) {
      return left(e.message!);
    }
  }

  Future<Either<String, String>> removeFromCart(int id) async {
    try {
      await _cartDao.removeFromCart(id);
      return right('Product removed from cart');
    } on DioException catch (e) {
      return left(e.message!);
    }
  }

  Future<Either<String, String>> deleteFromCart(int id) async {
    try {
      await _cartDao.deleteFromCart(id);
      return right('Product removed from cart');
    } on DioException catch (e) {
      return left(e.message!);
    }
  }

  bool isCartEmpty() => _cartDao.isCartEmpty;
}
