import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/src/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetail extends ConsumerWidget {
  final Product product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(product.images[0]),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
