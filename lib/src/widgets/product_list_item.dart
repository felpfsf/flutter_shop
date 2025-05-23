import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/src/models/product.dart';
import 'package:flutter_shop/src/providers/favorite_product.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductListItem extends ConsumerWidget {
  final Product product;
  final void Function(Product product) onSelectedProduct;

  const ProductListItem({
    super.key,
    required this.product,
    required this.onSelectedProduct,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProductsList = ref.watch(favoriteProductsProvider);
    final isFavorited = favoriteProductsList.contains(product);
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectedProduct(product);
        },
        child: Stack(
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
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () {
                  ref
                      .read(favoriteProductsProvider.notifier)
                      .toggleFavoriteProductStatus(product);
                },
                icon: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.amber,
                  size: 32,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                color: Colors.black54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
