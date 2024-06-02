import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/constants/style_guides.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key, required this.title, this.isTransparent = false});

  final String title;
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
        child: Text(
          title,
          style: AppTextStyle.bodyL(
              color: isTransparent! ? AppColors.black : AppColors.offWhite),
        ),
      ),
    );
  }
}
