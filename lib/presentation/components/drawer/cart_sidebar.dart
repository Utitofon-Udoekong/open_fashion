import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/cards/product_cards.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isCartEmpty =
        context.select((ShopCubit bloc) => bloc.state.isCartEmpty);
    final cart = context.select((ShopCubit bloc) => bloc.state.cart);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.close),
                ),
                Text(
                  'CART',
                  style: AppTextStyle.bodyM(color: AppColors.body),
                ),
              ],
            ),
          ),
          Expanded(
            child: isCartEmpty
                ? Text(
                    'You have no items in your Shopping Bag.',
                    style: AppTextStyle.bodyL(color: AppColors.placeholder),
                  )
                : Column(
                    children: cart.map((item) {
                      return ProductCart(cartItem: item);
                    }).toList(),
                  ),
          ),
          isCartEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Divider(
                        color: AppColors.black.withOpacity(0.2),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SUB TOTAL',
                            style: AppTextStyle.bodyL(color: AppColors.label),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Gap(30),
                          Text(
                            '\$240',
                            style: AppTextStyle.title(color: AppColors.primary),
                          )
                        ],
                      ),
                      const Gap(20),
                      Text(
                        '*shipping charges, taxes and discount codes are calculated at the time of accounting. ',
                        style: AppTextStyle.bodyM(color: AppColors.placeholder),
                      ),
                      const Gap(20),
                    ],
                  ),
                )
              : const Gap(0),
          AppCartButton(title: isCartEmpty ? 'CONTINUE SHOPPING' : 'BUY NOW')
        ],
      ),
    );
  }
}
