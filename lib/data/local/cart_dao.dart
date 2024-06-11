// import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/domain/entities/payment_method.dart';
import 'package:open_fashion/domain/entities/shipping_address.dart';

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

  Future<bool> addShippingAddress(ShippingAddress shippingAddress) async {
    final shippingAddressBox =
        await Hive.openBox<ShippingAddress>(AppStrings.shippingAddressBox);
    if (shippingAddressBox.containsKey(shippingAddress.id)) {
      return false;
    }
    await shippingAddressBox.put(shippingAddress.id, shippingAddress);
    return true;
  }

  Future<bool> addPaymentMethod(PaymentMethod paymentMethod) async {
    final paymentMethodBox =
        await Hive.openBox<PaymentMethod>(AppStrings.paymentMethodBox);
    if (paymentMethodBox.containsKey(paymentMethod.id)) {
      return false;
    }
    await paymentMethodBox.put(paymentMethod.id, paymentMethod);
    return true;
  }

  bool itemExists(String id) {
    final cartBox = Hive.box<CartItem>(AppStrings.cartBox);
    return cartBox.containsKey(id);
  }

  void clearCart() async {
    final cartBox = Hive.box<CartItem>(AppStrings.cartBox);
    await cartBox.clear();
  }

  bool get isCartEmpty => Hive.box<CartItem>(AppStrings.cartBox).isNotEmpty;

  // ValueListenable<Box<CartItem>> getCartItems() => Hive.box<CartItem>(AppStrings.cartBox).listenable();
}
