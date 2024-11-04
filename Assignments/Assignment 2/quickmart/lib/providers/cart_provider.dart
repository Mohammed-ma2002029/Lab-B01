import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickmart/models/cart_item.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem item) {
    state = [...state, item];
  }

  void updateQuantity(String productId, int quantity) {
    state = state.map((item) {
      if (item.productId == productId) {
        return CartItem(
          productId: item.productId,
          productName: item.productName,
          quantity: quantity,
          unitPrice: item.unitPrice,
        );
      }
      return item;
    }).toList();
  }

  double calculateTotalPrice() {
    return state.fold(0, (total, item) => total + item.calculateTotalPrice());
  }

  void removeFromCart(String productId) {
    state = state.where((item) => item.productId != productId).toList();
  }
}
