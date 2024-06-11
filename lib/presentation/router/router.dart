import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/presentation/features/checkout/add_payment_method.dart';
import 'package:open_fashion/presentation/features/checkout/add_shipping_address.dart';
import 'package:open_fashion/presentation/features/checkout/checkout.dart';
import 'package:open_fashion/presentation/features/checkout/place_order.dart';
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
      routes: [
        GoRoute(
          path: 'add-shipping-address',
          builder: (_, __) => const AddShippingAddress(),
        ),
        GoRoute(
          path: 'add-payment-method',
          builder: (_, __) => const AddPaymentMethod(),
        ),
        GoRoute(
          path: 'place-order',
          builder: (_, __) => const PlaceOrderPage(),
        ),
        GoRoute(
          path: 'checkout',
          builder: (_, __) => const CheckoutPage(),
        ),
      ]
    ),
  ],
  debugLogDiagnostics: true,
);
