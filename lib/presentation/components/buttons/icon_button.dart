import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/constants/style_guides.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      required this.isLeft,
      required this.title,
      required this.icon,
      this.isTransparent = false});

  final bool isLeft;
  final String title;
  final String icon;
  final bool? isTransparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        height: 48,
        width: 172,
        decoration: BoxDecoration(
          color: isTransparent! ? Colors.transparent : AppColors.black,
          border: isTransparent!
              ? Border.all(color: AppColors.border)
              : const Border.fromBorderSide(BorderSide.none),
        ),
        child: Row(
          children: [
            if (isLeft)
              Image.asset(icon),
            const Gap(16),
            Text(
              title,
              style: AppTextStyle.bodyL(
                  color: isTransparent! ? AppColors.black : AppColors.offWhite),
            ),
            if (!isLeft) const Gap(16),
            Image.asset(icon),
          ],
        ),
      ),
    );
  }
}
