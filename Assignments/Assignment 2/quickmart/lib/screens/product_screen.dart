import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickmart/models/product.dart';
import 'package:quickmart/providers/product_provider.dart';
import 'package:quickmart/screens/product_details_screen.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> products = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100, blurRadius: 40, spreadRadius: 0.0)
          ]),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
        ),
        actions: [
          Icon(
            Icons.filter_alt,
            color: Colors.green,
            size: 50,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 9 / 16),
            itemCount: products.length,
            itemBuilder: (context, int i) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: Offset(3, 3))
                    ]),
                child: Column(
                  children: [
                    IconButton(
                      icon:
                          Image.asset('assets/images/${products[i].imageName}'),
                      onPressed: () {
                        _navigateToDetailsScreen(context, products[i]);
                      },
                    ),
                    Text(
                      products[i].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      'QR ${products[i].price}',
                    ),
                    IconButton(
                      icon: Icon(Icons.add_box_rounded),
                      color: Colors.green,
                      iconSize: 30,
                      onPressed: () {},
                    )
                  ],
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined), label: 'shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favourites'),
        ],
        onTap: (int index) {},
        selectedItemColor: Colors.green,
      ),
    );
  }

  void _navigateToDetailsScreen(BuildContext context, Product product) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductDetails(product: product)));
  }
}
