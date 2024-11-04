import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickmart/models/product.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<String>> {
  FavoritesNotifier() : super([]);

  void addToFavorites(String productId) {
    state = [...state, productId];
  }

  void removeFromFavorites(String productId) {
    state = state.where((id) => id != productId).toList();
  }

  bool isFavorite(String productId) {
    return state.contains(productId);
  }
}
