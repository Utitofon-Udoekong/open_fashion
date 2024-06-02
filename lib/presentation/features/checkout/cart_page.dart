import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/components/app_title.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/header.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ATitle(title: 'CHECKOUT')
              ],
            ),
          ),
          ],
        ),
      ),
      bottomNavigationBar: ActionButton(title: 'CHECKOUT', onTap: (){},),
    );
  }
}