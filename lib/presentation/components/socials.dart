import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/constants/style_guides.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(AppImages.twitter),
            const Gap(30),
            Image.asset(AppImages.instagram),
            const Gap(30),
            Image.asset(AppImages.youtube),
          ],
        ),
      ],
    );
  }
}
