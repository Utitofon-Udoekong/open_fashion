import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/presentation/components/app_title.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/cards/product_cards.dart';
import 'package:open_fashion/presentation/components/header.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<CartItem>(AppStrings.cartBox).listenable(),
        builder: (context, box, widget) {
          final cart = box.values;
          final total = cart
              .map((e) => e.product.price * e.quantity)
              .reduce((value, element) => value + element);
          return Scaffold(
            appBar: const Header(),
            body: Column(
              children: [
                const Gap(20),
                const ATitle(title: 'CHECKOUT'),
                Expanded(
                  child: GridView.count(
                          padding: const EdgeInsets.all(20.0),
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          childAspectRatio: 2.1,
                          children: cart
                              .map(
                                (cartItem) => ProductCart(
                                    cartItem: cartItem,
                                    addToCart: () => context
                                        .read<ShopCubit>()
                                        .addToCart(cartItem),
                                    removeFromCart: () => context
                                        .read<ShopCubit>()
                                        .removeFromCart(cartItem.product.id)),
                              )
                              .toList(),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Est. Total'.toUpperCase(),
                        style: AppTextStyle.bodyM(color: AppColors.body),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: AppTextStyle.bodyL(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                ActionButton(
                  title: 'CHECKOUT',
                  onTap: () => context.push('/cart/place-order'),
                )
              ],
            ),
          );
        });
  }
}
