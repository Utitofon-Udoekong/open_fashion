import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:open_fashion/domain/entities/product.dart';
part 'cart_item.g.dart';

@HiveType(typeId: 2)
class CartItem extends HiveObject {
  @HiveField(0)
  final Product product;
  @HiveField(1)
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  factory CartItem.empty() => CartItem(product: Product.empty(), quantity: 0);

  CartItem copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source));

  @override
  String toString() => 'CartItem(product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
