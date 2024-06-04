import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/header.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product =
        context.select((ShopCubit bloc) => bloc.state.selectedProduct);
    return Scaffold(
      appBar: const Header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'product-${product.id}',
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage("assets/images/loading-image.gif"),
                        image: AssetImage(product.image),
                        height: 450,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                    const Gap(5),
                    Text(
                      product.brand.toUpperCase(),
                      style: AppTextStyle.subTitleS(),
                    ),
                    const Gap(5),
                    Text(
                      product.title,
                      style: AppTextStyle.bodyM(color: AppColors.label),
                    ),
                    const Gap(10),
                    Text(
                      '\$${product.price}',
                      style: AppTextStyle.price(color: AppColors.primary),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Color',
                              style: AppTextStyle.bodyS(color: AppColors.label),
                            ),
                            const Gap(10),
                            const ColorRing(
                                color: AppColors.black, isSelected: true),
                            const Gap(10),
                            const ColorRing(color: AppColors.primary),
                            const Gap(10),
                            const ColorRing(color: AppColors.ringBg),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Size',
                              style: AppTextStyle.bodyS(color: AppColors.label),
                            ),
                            const Gap(10),
                            const SizeRing(size: 'S', isSelected: true),
                            const Gap(10),
                            const SizeRing(size: 'M'),
                            const Gap(10),
                            const SizeRing(size: 'L'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              ValueListenableBuilder(
                  valueListenable:
                      Hive.box<CartItem>(AppStrings.cartBox).listenable(),
                  builder: (context, box, widget) {
                    final item = box.get(product.id) ?? CartItem.empty();
                    final itemExists = item.quantity > 0;
                    return AppBasketButton(
                      added: itemExists,
                      cartCount: item.quantity.toString(),
                      addToCart: () {
                        final cartItem =
                            CartItem(product: product, quantity: 0);
                        context.read<ShopCubit>().addToCart(cartItem);
                      },
                      removeFromCart: () {
                        context.read<ShopCubit>().removeFromCart(product.id);
                      }, isDark: true,
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MATERIALS',
                      style: AppTextStyle.subTitleS(),
                    ),
                    const Gap(8),
                    Text(
                      'We work with monitoring programmes to ensure compliance with safety, health and quality standards for our products.',
                      style: AppTextStyle.bodyM(color: AppColors.label),
                    ),
                    const Gap(20),
                    Text(
                      'CARE',
                      style: AppTextStyle.subTitleS(),
                    ),
                    const Gap(8),
                    Text(
                      'To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment, look for a dry cleaner that uses technologies that are respectful of the environment.',
                      style: AppTextStyle.bodyM(color: AppColors.label),
                    ),
                    const Gap(20),
                    const TabText(
                        image: AppImages.bleach, title: 'Do not use bleach'),
                    const Gap(8),
                    const TabText(
                        image: AppImages.dry, title: 'Do not tumble dry'),
                    const Gap(8),
                    const TabText(
                        image: AppImages.wash,
                        title: 'Dry clean with tetrachloroethylene'),
                    const Gap(8),
                    const TabText(
                        image: AppImages.iron,
                        title: 'Iron at a maximum of 110ºC/230ºF'),
                    const Gap(20),
                    Text(
                      'DELIVERY',
                      style: AppTextStyle.subTitleS(),
                    ),
                    const Gap(10),
                    const TabText(
                        image: AppImages.shipping,
                        title: 'Free Flat Rate Shipping'),
                    const Gap(8),
                    const TabText(image: AppImages.tag, title: 'COD Policy'),
                    const Gap(8),
                    const TabText(
                        image: AppImages.refresh, title: 'Return Policy'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabText extends StatelessWidget {
  const TabText({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
        ),
        const Gap(10),
        Text(title, style: AppTextStyle.bodyM(color: AppColors.label))
      ],
    );
  }
}

class ColorRing extends StatelessWidget {
  const ColorRing({super.key, required this.color, this.isSelected = false});

  final Color color;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23,
      height: 23,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            isSelected! ? Border.all(color: AppColors.black, width: 0.5) : null,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class SizeRing extends StatelessWidget {
  const SizeRing({super.key, required this.size, this.isSelected = false});

  final String size;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23,
      height: 23,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected! ? AppColors.label : AppColors.white,
      ),
      alignment: Alignment.center,
      child: Text(
        size,
        style: AppTextStyle.bodyS(
            color: isSelected! ? AppColors.white : AppColors.label),
      ),
    );
  }
}
