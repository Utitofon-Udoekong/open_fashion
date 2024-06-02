import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.product, this.onTap});

  final Product product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            Hero(
              tag: 'product-${product.id}',
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage("assets/images/loading-image.gif"),
                image: AssetImage(product.image),
                width: 100,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.primary,
                        size: 15,
                      ),
                      const Gap(8),
                      Text(
                        '${product.rating.rate} Ratings',
                        style: AppTextStyle.bodyS(color: AppColors.label),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${product.rating.rate} Ratings',
                        style: AppTextStyle.bodyS(color: AppColors.label),
                      ),
                      const Gap(5),
                      const SizeTag(size: 'S'),
                      const Gap(5),
                      const SizeTag(size: 'M'),
                      const Gap(5),
                      const SizeTag(size: 'L'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SizeTag extends StatelessWidget {
  const SizeTag({super.key, required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.border), shape: BoxShape.circle),
      child: Text(
        size,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 10, color: AppColors.label),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.product, this.onTap});

  final Product product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
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
                      height: 220,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error));
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brand.toUpperCase(),
                    style: AppTextStyle.bodyS(),
                  ),
                  const Gap(5),
                  Text(
                    product.title,
                    style: AppTextStyle.bodyS(color: AppColors.label),
                  ),
                  const Gap(10),
                  Text(
                    '\$${product.price}',
                    style: AppTextStyle.price(color: AppColors.primary),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductHomeView extends StatelessWidget {
  const ProductHomeView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage("assets/images/loading-image.gif"),
                  image: AssetImage(product.image),
                  height: 220,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error));
                  },
                ),
              ),
              const Positioned(
                  bottom: 10,
                  right: 10,
                  child: FaIcon(
                    FontAwesomeIcons.heart,
                    color: AppColors.primary,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  '${product.brand.toUpperCase()} ${product.title}',
                  style: AppTextStyle.bodyS(color: AppColors.body),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(10),
                Text(
                  '\$${product.price}',
                  style: AppTextStyle.price(color: AppColors.primary),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductFullView extends StatelessWidget {
  const ProductFullView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
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
              const Positioned(
                  bottom: 16,
                  right: 16,
                  child: FaIcon(
                    FontAwesomeIcons.heart,
                    color: AppColors.primary,
                  ))
            ],
          ),
          const Gap(15),
          Text(
            product.brand.toUpperCase(),
            style: AppTextStyle.title(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: AppTextStyle.bodyL(color: AppColors.label),
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(30),
              Text(
                '\$${product.price}',
                style: AppTextStyle.title(color: AppColors.primary),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage("assets/images/loading-image.gif"),
            image: AssetImage(product.image),
            width: 100,
            imageErrorBuilder: (context, error, stackTrace) {
              return const Center(child: Icon(Icons.error));
            },
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
                const Gap(5),
                const CartControl(cartCount: "1"),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 15,
                    ),
                    const Gap(8),
                    Text(
                      '${product.rating.rate} Ratings',
                      style: AppTextStyle.bodyS(color: AppColors.label),
                    ),
                  ],
                ),
                const Gap(5),
                Text(
                  '\$${product.price}',
                  style: AppTextStyle.price(color: AppColors.primary),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartControl extends StatelessWidget {
  const CartControl(
      {super.key,
      required this.cartCount,
      this.addToCart,
      this.removeFromCart});

  final String cartCount;
  final void Function()? addToCart;
  final void Function()? removeFromCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton.filled(
          padding: EdgeInsets.zero,
          onPressed: removeFromCart,
          icon: Image.asset(AppImages.minus),
        ),
        const Gap(15),
        Text(
          cartCount,
          style: AppTextStyle.bodyM(),
        ),
        const Gap(15),
        IconButton.filled(
          padding: EdgeInsets.zero,
          onPressed: addToCart,
          icon: Image.asset(AppImages.plus),
        ),
      ],
    );
  }
}
