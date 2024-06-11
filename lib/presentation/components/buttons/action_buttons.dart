import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/components/cards/product_cards.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.black,
          fixedSize: const Size(double.maxFinite, 56),
          side: BorderSide.none,
          shape: const RoundedRectangleBorder()),
      child: Text(
        title,
        style: AppTextStyle.bodyL(color: AppColors.white),
      ),
    );
  }
}
class ActionButtonLight extends StatelessWidget {
  const ActionButtonLight({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          fixedSize: const Size(double.maxFinite, 56),
          side: const BorderSide(color: AppColors.border),
          shape: const RoundedRectangleBorder()),
      child: Text(
        title,
        style: AppTextStyle.bodyL(color: AppColors.black),
      ),
    );
  }
}



class AppBasketButton extends StatelessWidget {
  const AppBasketButton({
    super.key,
    required this.added,
    required this.cartCount,
    this.addToCart,
    this.removeFromCart, required this.isDark,
  });

  final bool added;
  final bool isDark;
  final String cartCount;
  final void Function()? addToCart;
  final void Function()? removeFromCart;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      height: 56,
      width: double.maxFinite,
      color: AppColors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ADD TO BASKET',
            style: AppTextStyle.bodyL(color: AppColors.white),
          ),
          const Gap(16),
          added ? CartControl(cartCount: cartCount, addToCart: addToCart, removeFromCart: removeFromCart, isDark: isDark,) : 
          GestureDetector(
            onTap: addToCart,
            child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
          ),
        ],
      ),
    );
  }
}

class ActionIconButtons extends StatelessWidget {
  const ActionIconButtons({super.key, required this.image, this.onTap});

  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: AppColors.iconBg,
          shape: BoxShape.circle,
        ),
        child: Image.asset(image),
      ),
    );
  }
}
