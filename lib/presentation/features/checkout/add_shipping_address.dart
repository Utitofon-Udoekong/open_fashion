import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/components/app_text_field.dart';
import 'package:open_fashion/presentation/components/app_title.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/header.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class AddShippingAddress extends StatelessWidget {
  const AddShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ShopCubit, ShopState>(
          listenWhen: (p, c) => p.success != c.success &&
              c.success == 'Shipping address added',
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.success,
                  style: AppTextStyle.bodyS(color: AppColors.white),
                ),
                backgroundColor: Colors.greenAccent,
              ),
            );
            context.pop();
          },
        ),
        BlocListener<ShopCubit, ShopState>(
          listenWhen: (previous, current) => current.failure.isNotEmpty,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failure,
                  style: AppTextStyle.bodyS(color: AppColors.white),
                ),
                backgroundColor: Colors.redAccent,
              ),
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: Column(
          children: [
            const Gap(20),
            const ATitle(title: 'ADD SHIPPING ADDRESS'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ApptextField(
                            hint: 'First name',
                            onChanged: (value) => context
                                .read<ShopCubit>()
                                .updatesaFirstName(value),
                          ),
                        ),
                        const Gap(15),
                        Expanded(
                          child: ApptextField(
                            hint: 'Last name',
                            onChanged: (value) => context
                                .read<ShopCubit>()
                                .updatesaLastName(value),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    ApptextField(
                      hint: 'Address',
                      onChanged: (value) =>
                          context.read<ShopCubit>().updatesaAddress(value),
                    ),
                    const Gap(10),
                    ApptextField(
                      hint: 'City',
                      onChanged: (value) =>
                          context.read<ShopCubit>().updatesaCity(value),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: ApptextField(
                            hint: 'State',
                            onChanged: (value) =>
                                context.read<ShopCubit>().updatesaState(value),
                          ),
                        ),
                        const Gap(15),
                        Expanded(
                          child: ApptextField(
                            hint: 'Zip Code',
                            onChanged: (value) => context
                                .read<ShopCubit>()
                                .updatesaZipCode(value),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    ApptextField(
                      hint: 'Phone Number',
                      onChanged: (value) =>
                          context.read<ShopCubit>().updatesaPhone(value),
                    ),
                  ],
                ),
              ),
            ),
            ActionButton(
              title: 'ADD NOW',
              onTap: () => context.read<ShopCubit>().addShippingAddress(),
            )
          ],
        ),
      ),
    );
  }
}
