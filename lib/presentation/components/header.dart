import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, this.bottom});

  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      title: Image.asset(AppImages.logo),
      centerTitle: true,
      bottom: bottom,
      actions: [
        ValueListenableBuilder(
          valueListenable: Hive.box<CartItem>(AppStrings.cartBox).listenable(),
          builder: (context, box, widget) {
            var cartSize = box.length;
            return IconButton(
              onPressed: () => context.push('/cart'),
              padding: EdgeInsets.zero,
              icon: Badge(
                backgroundColor: AppColors.secondary,
                label: Text(
                  cartSize.toString(),
                  style: AppTextStyle.bodyS(color: AppColors.white),
                ),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            );
          },
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
