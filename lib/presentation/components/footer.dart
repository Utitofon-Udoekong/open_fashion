import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/presentation/components/socials.dart';
import 'package:open_fashion/constants/style_guides.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        const Socials(),
        const Gap(20),
        Image.asset(AppImages.divider),
        const Gap(20),
        Text(
          'support@openui.design',
          style: AppTextStyle.bodyL(color: AppColors.body),
        ),
        Text(
          '+60 825 876',
          style: AppTextStyle.bodyL(color: AppColors.body),
        ),
        Text(
          '08:00 - 22:00 - Everyday',
          style: AppTextStyle.bodyL(color: AppColors.body),
        ),
        const Gap(20),
        Image.asset(AppImages.divider),
        const Gap(20),
        Row(
          children: [
            Text(
              'About',
              style: AppTextStyle.bodyL(color: AppColors.black),
            ),
            const Gap(30),
            Text(
              'Contact',
              style: AppTextStyle.bodyL(color: AppColors.black),
            ),
            const Gap(30),
            Text(
              'Blog',
              style: AppTextStyle.bodyL(color: AppColors.black),
            ),
          ],
        ),
        const Gap(20),
      ],
    );
  }
}
