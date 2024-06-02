import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        fixedSize: Size(double.maxFinite, 56),
        side: BorderSide.none,
        shape: RoundedRectangleBorder()
      ),
      child: Text(
        title,
        style: AppTextStyle.bodyL(color: AppColors.white),
      ),
    );
    // InkWell(
    //   onTap: onTap,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    //     height: 56,
    //     width: double.maxFinite,
    //     color: AppColors.black,
    //     child: Row(
    //       children: [
    // Text(
    //   title,
    //   style: AppTextStyle.bodyL(color: AppColors.white),
    // ),
    //         const Gap(20),
    //         icon!
    //       ],
    //     ),
    //   ),
    // );
  }
}

class AppSubmitButton extends StatelessWidget {
  const AppSubmitButton({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        height: 56,
        width: double.maxFinite,
        color: AppColors.black,
        child: Row(
          children: [
            Text(
              'SUBMIT',
              style: AppTextStyle.bodyL(color: AppColors.white),
            ),
            const Gap(20),
            FaIcon(
              FontAwesomeIcons.forward,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}

class AppBasketButton extends StatelessWidget {
  const AppBasketButton({
    super.key,
    this.onTap,
    required this.added,
    required this.cartCount,
  });

  final void Function()? onTap;
  final bool added;
  final String cartCount;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        height: 56,
        width: double.maxFinite,
        color: AppColors.black,
        child: added
            ? CartControl(cartCount: cartCount)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                      const Gap(16),
                      Text(
                        'ADD TO BASKET',
                        style: AppTextStyle.bodyL(color: AppColors.white),
                      ),
                    ],
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidHeart,
                    color: AppColors.white,
                  ),
                ],
              ),
      ),
    );
  }
}

class AppCartButton extends StatelessWidget {
  const AppCartButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        height: 56,
        width: double.maxFinite,
        color: AppColors.black,
        child: Row(
          children: [
            Image.asset(AppImages.cart),
            Text(
              title,
              style: AppTextStyle.bodyL(color: AppColors.white),
            ),
          ],
        ),
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
