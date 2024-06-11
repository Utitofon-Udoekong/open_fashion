import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/presentation/components/cards/product_cards.dart';
import 'package:open_fashion/constants/style_guides.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<CartItem>(AppStrings.cartBox).listenable(),
        builder: (context, box, widget) {
          final cart = box.values;
          final isCartEmpty = cart.isEmpty;
        return Drawer(
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CART',
                        style: AppTextStyle.bodyM(color: AppColors.body),
                      ),
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: const Icon(Icons.close),
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
                      : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                            children: cart.map((item) {
                              return ProductCart(cartItem: item);
                            }).toList(),
                          ),
                      ),
                ),
                isCartEmpty
                    ? const Gap(0) : Padding(
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
                      ),
                // AppCartButton(title: isCartEmpty ? 'CONTINUE SHOPPING' : 'BUY NOW')
              ],
            ),
          ),
        );
      }
    );
  }
}
