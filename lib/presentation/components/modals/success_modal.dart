import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';

class SuccessModal extends StatelessWidget {
  const SuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context..pop()..go('/'),
              child: const Icon(Icons.close),
            ),
          ),
          Text(
            'Payment success',
            style: AppTextStyle.title(),
          ),
          const Gap(30),
          Image.asset(AppImages.success),
          const Gap(30),
          Text(
            'Your payment was success',
            style: AppTextStyle.bodyL(),
          ),
          Text(
            'Payment ID 15263541',
            style: AppTextStyle.bodyL(),
          ),
          const Gap(20),
          Image.asset(AppImages.dividerPlain),
          const Gap(20),
          Text(
            'Rate your purchase',
            style: AppTextStyle.subTitleM(),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.sad),
              const Gap(10),
              Image.asset(AppImages.happy),
              const Gap(10),
              Image.asset(AppImages.love),
            ],
          ),
          const Gap(30),
          Row(
            children: [
              Expanded(
                child: ModalButton(
                  title: 'SUBMIT',
                  onTap: (){
                    context..pop()..go('/');
                    context.read<ShopCubit>().clearCart();
                  },
                  isLight: false,
                ),
              ),
              const Gap(10),
              Expanded(
                child: ModalButton(
                  title: 'BACK TO HOME',
                  onTap: (){
                    context..pop()..go('/');
                    context.read<ShopCubit>().clearCart();
                  },
                  isLight: true,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class ModalButton extends StatelessWidget {
  const ModalButton({
    super.key,
    required this.title,
    this.onTap,
    required this.isLight,
  });

  final String title;
  final void Function()? onTap;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: isLight ? AppColors.white : AppColors.black,
          // foregroundColor: isLight ? AppColors.white : AppColors.black,
          fixedSize: const Size(double.maxFinite, 48),
          side: const BorderSide(color: AppColors.black),
          shape: const RoundedRectangleBorder()),
      child: Text(
        title,
        style: AppTextStyle.bodyS(
            color: isLight ? AppColors.black : AppColors.white),
      ),
    );
  }
}
