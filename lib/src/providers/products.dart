import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/src/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super(const []);

  Future<void> getProducts() async {
    const String baseUrl = 'http://dummyjson.com';

    final response = await http.get(Uri.parse('$baseUrl/products?limit=10'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      final List<Product> productList = (responseData['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList();

      debugPrint('🚀 ~ ProductsNotifier ~ : $productList');

      state = productList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}

final productsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>(
  (ref) {
    return ProductsNotifier();
  },
);
