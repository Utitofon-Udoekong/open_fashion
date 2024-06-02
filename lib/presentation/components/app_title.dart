import 'package:flutter/material.dart';
import 'package:open_fashion/constants/style_guides.dart';

class ATitle extends StatelessWidget {
  const ATitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.title(),
          textAlign: TextAlign.center,
        ),
        Center(
            child: Image.asset(
          AppImages.dividerPlain,
          width: 125,
        ))
      ],
    );
  }
}
