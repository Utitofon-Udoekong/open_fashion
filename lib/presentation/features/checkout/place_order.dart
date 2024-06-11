import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/domain/entities/payment_method.dart';
import 'package:open_fashion/domain/entities/shipping_address.dart';
import 'package:open_fashion/presentation/components/app_title.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/cards/payment_method_card.dart';
import 'package:open_fashion/presentation/components/cards/shipping_address_card.dart';
import 'package:open_fashion/presentation/components/header.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping adress',
                    style: AppTextStyle.bodyM(color: AppColors.placeholder),
                  ),
                  const Gap(8),
                  ValueListenableBuilder(
                    valueListenable:
                        Hive.box<ShippingAddress>(AppStrings.shippingAddressBox)
                            .listenable(),
                    builder: (context, box, widget) {
                      final addresses = box.values;
                      return Column(
                        children: addresses
                            .map((address) => ShippingAddressCard(
                                address: address,
                                selected: selectedAddress.id == address.id,
                                onTap: () => context
                                    .read<ShopCubit>()
                                    .selectShippingAddress(address)))
                            .toList(),
                      );
                    },
                  ),
                  const Gap(10),
                  AddButton(
                    title: 'Add shipping address',
                    onTap: () => context.push('/cart/add-shipping-address'),
                  ),
                  const Gap(20),
                  Text(
                    'Payment method',
                    style: AppTextStyle.bodyM(color: AppColors.placeholder),
                  ),
                  const Gap(8),
                  ValueListenableBuilder(
                    valueListenable:
                        Hive.box<PaymentMethod>(AppStrings.paymentMethodBox)
                            .listenable(),
                    builder: (context, box, widget) {
                      final methods = box.values;
                      return Column(
                        children: methods
                            .map((method) => PaymentMethodCard(
                                  method: method,
                                  selected: selectedMethod.id == method.id,
                                  onTap: () => context
                                      .read<ShopCubit>()
                                      .selectPaymentMethod(method),
                                ))
                            .toList(),
                      );
                    },
                  ),
                  const Gap(10),
                  AddButton(
                    title: 'Add payment method',
                    onTap: () => context.push('/cart/add-payment-method'),
                  ),
                  const Gap(20),
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
            title: 'PLACE ORDER',
            onTap: () {
              if (selectedAddress.id != 0 && selectedMethod.id != 0) {
                context.push('/cart/checkout');
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Select a shipping address and payment method',
                      style: AppTextStyle.bodyS(color: AppColors.white),
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44), color: AppColors.inputBg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyle.bodyL(color: AppColors.label)),
            const Icon(
              Icons.add,
              color: AppColors.label,
            )
          ],
        ),
      ),
    );
  }
}
