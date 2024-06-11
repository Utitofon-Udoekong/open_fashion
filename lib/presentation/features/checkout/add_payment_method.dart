import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/constants/helpers/formatters.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/components/app_text_field.dart';
import 'package:open_fashion/presentation/components/app_title.dart';
import 'package:open_fashion/presentation/components/buttons/action_buttons.dart';
import 'package:open_fashion/presentation/components/header.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final expDate = context.select((ShopCubit bloc) => bloc.state.pmExpDate);
    final expMonth = context.select((ShopCubit bloc) => bloc.state.pmExpMonth);
    final cardName = context.select((ShopCubit bloc) => bloc.state.pmCardName);
    final cardNumber =
        context.select((ShopCubit bloc) => bloc.state.pmCardNumber);
    return MultiBlocListener(
      listeners: [
        BlocListener<ShopCubit, ShopState>(
          listenWhen: (p, c) => p.success != c.success &&
              c.success == 'Payment Method added',
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
            const ATitle(title: 'PAYMENT METHOD'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Positioned.fill(
                              child: Image.asset(
                                AppImages.cardBg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Image.asset(AppImages.mastercard),
                          ),
                          Positioned(
                            bottom: 45,
                            right: 10,
                            child: Text(
                              '$expDate/$expMonth',
                              style: AppTextStyle.bodyL(color: AppColors.white),
                            ),
                          ),
                          Positioned(
                            bottom: 45,
                            left: 10,
                            child: Text(
                              cardName,
                              style: AppTextStyle.bodyL(color: AppColors.white),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 10,
                            child: Text(
                              cardNumber,
                              style: AppTextStyle.bodyL(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ApptextField(
                      hint: 'Name on card',
                      onChanged: (value) =>
                          context.read<ShopCubit>().updatepmCardName(value),
                    ),
                    const Gap(10),
                    ApptextField(
                      hint: 'Card number',
                      inputFormatters: [
                        CreditCardFormatter(
                          mask: 'xxxx-xxxx-xxxx-xxxx',
                          separator: '-',
                        ),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          context.read<ShopCubit>().updatepmCardNumber(value),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: ApptextField(
                            hint: 'Exp Date(DD)',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2)
                            ],
                            onChanged: (value) => context
                                .read<ShopCubit>()
                                .updatepmExpDate(value),
                          ),
                        ),
                        const Gap(15),
                        Expanded(
                          child: ApptextField(
                            hint: 'Exp Month (MM)',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2)
                            ],
                            onChanged: (value) => context
                                .read<ShopCubit>()
                                .updatepmExpMonth(value),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    ApptextField(
                      hint: 'CVV',
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      onChanged: (value) =>
                          context.read<ShopCubit>().updatepmCVV(value),
                    ),
                  ],
                ),
              ),
            ),
            ActionButton(
              title: 'ADD CARD',
              onTap: () => context.read<ShopCubit>().addPaymentMethod(),
            )
          ],
        ),
      ),
    );
  }
}
