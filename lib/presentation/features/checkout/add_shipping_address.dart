import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/cart_item.dart';
import 'package:open_fashion/presentation/components/app_title.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/cards/product_cards.dart';
import 'package:open_fashion/presentation/components/header.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';


class AddShippingAddress extends StatelessWidget {
  const AddShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: const Header(),
            body: Column(
              children: [
                const Gap(20),
                const ATitle(title: 'ADD SHIPPING ADDRESS'),
                Row(
                  children: [
                    TextField(),
                  ],
                ),
                ActionButton(
                  title: 'CHECKOUT',
                  onTap: () {},
                )
              ],
            ),
          );
  }
}
