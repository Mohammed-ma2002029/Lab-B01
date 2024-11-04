import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickmart/models/product.dart';
import 'package:flutter/services.dart';

final productProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    // Simulate loading from JSON (replace with actual file loading if needed)
    final String response =
        await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> data = json.decode(response);
    state = data.map((json) => Product.fromJson(json)).toList();
  }

  List<Product> filterByName(String name) {
    return state.where((product) => product.title.contains(name)).toList();
  }

  List<Product> filterByCategory(String category) {
    return state.where((product) => product.category == category).toList();
  }
}
