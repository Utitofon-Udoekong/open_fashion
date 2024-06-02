import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/presentation/core/injections.dart';
import 'package:open_fashion/presentation/pages/cubit/shop_cubit.dart';
import 'package:open_fashion/presentation/router/router.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShopCubit>(),
      child: MaterialApp.router(
        title: 'Open Fashion',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.white, background: AppColors.white),
          textTheme: GoogleFonts.tenorSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
          ),
          scaffoldBackgroundColor: AppColors.white,
          useMaterial3: true,
        ),
      ),
    );
  }
}
