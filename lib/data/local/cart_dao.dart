// import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';

@lazySingleton
class CartDao {
  Future<void> addToCart(CartItem cartItem) async {
    final cartBox = await Hive.openBox<CartItem>(AppStrings.cartBox);
    if (cartBox.containsKey(cartItem.product.id)) {
      return incrementItemInCart(cartItem.product.id);
    }
    cartItem.quantity += 1;
    return await cartBox.put(cartItem.product.id, cartItem);
  }

  Future<void> incrementItemInCart(int id) async {
    final box = Hive.box<CartItem>(AppStrings.cartBox);
    final item = box.get(id);
    item!.quantity += 1;
    return await item.save();
  }

  Future<void> deleteFromCart(int id) async {
    final cartBox = Hive.box<CartItem>(AppStrings.cartBox);
    return cartBox.delete(id);
  }

  Future<void> removeFromCart(int id) async {
    final box = Hive.box<CartItem>(AppStrings.cartBox);
    final item = box.get(id);
    if (item!.quantity > 1) {
      item.quantity -= 1;
    } else {
      deleteFromCart(item.product.id);
    }
    return await item.save();
  }

  bool itemExists(String id) {
    final cartBox = Hive.box<CartItem>(AppStrings.cartBox);
    return cartBox.containsKey(id);
  }

  bool get isCartEmpty => Hive.box<CartItem>(AppStrings.cartBox).isNotEmpty;

  // ValueListenable<Box<CartItem>> getCartItems() => Hive.box<CartItem>(AppStrings.cartBox).listenable();
}
