import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/restaurant_details_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/order_tracking_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/restaurant/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return RestaurantDetailsScreen(restaurantId: id);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/order-tracking/:orderId',
      builder: (context, state) {
        final orderId = state.pathParameters['orderId']!;
        return OrderTrackingScreen(orderId: orderId);
      },
    ),
  ],
);
