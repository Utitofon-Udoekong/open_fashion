import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/payment_method.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard(
      {super.key, required this.method, required this.selected, this.onTap});

  final PaymentMethod method;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border: selected ? Border.all(color: AppColors.primary) : null,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Image.asset(AppImages.mastercard),
            const Gap(20),
            Text(
              'Mater Card ending in ***${method.cardNumber.substring(method.cardNumber.length - 2, method.cardNumber.length)}',
              style: AppTextStyle.bodyM(),
            )
          ],
        ),
      ),
    );
  }
}
