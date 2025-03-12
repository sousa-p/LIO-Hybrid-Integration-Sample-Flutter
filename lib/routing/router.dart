import 'package:flutter/material.dart';
import 'package:flutter_lio_integration/features/products/model/product.dart';
import 'package:flutter_lio_integration/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_lio_integration/features/payment_checkout/payment_checkout_screen.dart';
import 'package:flutter_lio_integration/features/products/product_list.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => ProductList(),
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) {
        final product = state.extra as Product;
        return PaymentCheckoutScreen(product: product);
      },
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text('Sem nenhum ${state.path} por aqui!'),
      ),
    ),
  ),
);
