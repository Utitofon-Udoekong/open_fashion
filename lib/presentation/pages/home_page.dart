import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/cards/product_cards.dart';
import 'package:open_fashion/presentation/components/drawer/cart_sidebar.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = false;

  @override
  void initState() {
    super.initState();
    context.read<ShopCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = context.select((ShopCubit bloc) => bloc.state.products);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.logo),
      centerTitle: true,
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
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            );
          },
        )
      ],
      bottom: FilterTab(
          productCount: products.length,
          isGrid: isGrid,
          onTap: () {
            if (isGrid) {
              setState(() {
                isGrid = false;
              });
            } else {
              setState(() {
                isGrid = true;
              });
            }
          },
        ),
      ),
    
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.count(
            crossAxisCount: isGrid ? 2 : 1,
            childAspectRatio: isGrid ? 9 / 18.12 : 16 / 7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: products.map((product) {
              return isGrid
                  ? ProductGridView(
                      product: product,
                      onTap: () {
                        context.read<ShopCubit>().selectProduct(product);
                        context.push("/product");
                        
                      },
                    )
                  : ProductListView(
                      product: product,
                      onTap: () {
                        context.read<ShopCubit>().selectProduct(product);
                        context.push("/product");
                      },
                    );
            }).toList(),
          ),
        ),
      ),
      endDrawer: const CartDrawer(),
    );
  }
}

class FilterTab extends StatelessWidget implements PreferredSizeWidget {
  const FilterTab(
      {super.key,
      required this.productCount,
      required this.isGrid,
      this.onTap});

  final int productCount;
  final bool isGrid;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$productCount APPAREL(S)'),
              const Gap(10),
              Row(
                children: [
                  Container(
                    height: 36,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'New',
                          style: AppTextStyle.bodyS(color: AppColors.label),
                        ),
                        const Gap(10),
                        const Icon(Icons.arrow_drop_down, color: AppColors.label)
                      ],
                    ),
                  ),
                  const Gap(10),
                  ActionIconButtons(
                      onTap: onTap,
                      image: isGrid ? AppImages.listview : AppImages.grid),
                  const Gap(10),
                  const ActionIconButtons(image: AppImages.filter),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Women',
                      style: AppTextStyle.bodyS(color: AppColors.label),
                    ),
                    const Gap(10),
                    const Icon(Icons.close)
                  ],
                ),
              ),
              const Gap(10),
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Text(
                      'All apparel',
                      style: AppTextStyle.bodyS(color: AppColors.label),
                    ),
                    const Gap(10),
                    const Icon(Icons.close)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
