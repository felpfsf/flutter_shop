import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/product.dart';
import 'package:flutter_shop/src/screens/product_detail.dart';
import 'package:flutter_shop/src/widgets/product_list_item.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;
  const ProductsList({
    super.key,
    required this.products,
  });

  void _selectedProduct(BuildContext context, Product product) {
    debugPrint('Selected product: ${product.title}');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ProductDetail(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductListItem(
          onSelectedProduct: (product) {
            _selectedProduct(context, product);
          },
          product: products[index]),
    );
  }
}
