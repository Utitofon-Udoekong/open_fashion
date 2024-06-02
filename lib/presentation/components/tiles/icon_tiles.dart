import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/constants/style_guides.dart';

class IconTile extends StatelessWidget {
  const IconTile({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        const Gap(10),
        Text(
          title,
          style: AppTextStyle.bodyL(color: AppColors.label),
        )
      ],
    );
  }
}
