import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/presentation/features/product/product_page.dart';
import 'package:open_fashion/presentation/features/checkout/cart_page.dart';
import 'package:open_fashion/presentation/pages/home_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouter page configuration
final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: '/product',
      builder: (_, __) => const ProductPage(),
    ),
    GoRoute(
      path: '/cart',
      builder: (_, __) => const CartPage(),
    ),
  ],
  debugLogDiagnostics: true,
);
