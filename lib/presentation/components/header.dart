import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, this.bottom});

  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final cartSize = context.select((ShopCubit bloc) => bloc.state.cartSize);
    return AppBar(
     
      title: Image.asset(AppImages.logo),
      centerTitle: true,
      bottom: bottom,
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => context.push('/cart'),
              padding: EdgeInsets.zero,
              icon: Badge(
                backgroundColor: AppColors.secondary,
                label: Text(
                  cartSize.toString(),
                  style: AppTextStyle.bodyS(color: AppColors.white),
                ),
                child: Image.asset(AppImages.cart),
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
