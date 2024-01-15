import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/src/models/product.dart';

class FavoriteProductNotifier extends StateNotifier<List<Product>> {
  FavoriteProductNotifier() : super([]);

  bool toggleFavoriteProductStatus(Product product) {
    final isFavorited = state.contains(product);

    if (isFavorited) {
      state = state.where((element) => element.id != product.id).toList();
      return false;
    } else {
      state = [...state, product];
      return true;
    }
  }
}

final favoriteProductsProvider =
    StateNotifierProvider<FavoriteProductNotifier, List<Product>>(
  (ref) {
    return FavoriteProductNotifier();
  },
);
