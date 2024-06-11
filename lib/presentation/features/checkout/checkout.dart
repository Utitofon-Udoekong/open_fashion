import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/presentation/components/app_title.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/cards/payment_method_card.dart';
import 'package:open_fashion/presentation/components/cards/product_cards.dart';
import 'package:open_fashion/presentation/components/cards/shipping_address_card.dart';
import 'package:open_fashion/presentation/components/header.dart';
import 'package:open_fashion/presentation/components/modals/success_modal.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final selectedMethod =
        context.select((ShopCubit bloc) => bloc.state.selectedPaymentMethod);
    final selectedAddress =
        context.select((ShopCubit bloc) => bloc.state.selectedShippingAddress);
    final cart = Hive.box<CartItem>(AppStrings.cartBox).values;
    final total = cart
        .map((e) => e.product.price * e.quantity)
        .reduce((value, element) => value + element);
    return Scaffold(
      appBar: const Header(),
      body: Column(
        children: [
          const Gap(20),
          const ATitle(title: 'CHECKOUT'),
          const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ShippingAddressCard(
                      address: selectedAddress, selected: false, onTap: null),
                  const Divider(),
                  PaymentMethodCard(
                    method: selectedMethod,
                    selected: false,
                    onTap: null,
                  ),
                  const Divider(),
                  ...cart.map(
                    (cartItem) => Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: ProductCart(
                        cartItem: cartItem,
                        addToCart: () =>
                            context.read<ShopCubit>().addToCart(cartItem),
                        removeFromCart: () => context
                            .read<ShopCubit>()
                            .removeFromCart(cartItem.product.id),
                      ),
                    ),
                  )
                ],
              ),
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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SuccessModal();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
