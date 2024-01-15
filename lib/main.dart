import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/src/screens/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: FlutterShopApp(),
    ),
  );
}

class FlutterShopApp extends StatelessWidget {
  const FlutterShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FlutterShop',
      home: HomeScreen(),
    );
  }
}
