import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickmart/models/product.dart';
import 'package:quickmart/providers/product_provider.dart';

class ProductDetails extends ConsumerWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
              icondata: Icons.arrow_back_ios_new_rounded,
              press: () => Navigator.pop(context))),
      body: Column(children: [
        Image.asset(
          'assets/images/${product.imageName}',
          scale: 0.2,
        ),
        Title(
          color: Colors.black,
          child: Text(
            product.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        DropdownButton<String>(
          value: 'Product Details',
          icon: Icon(Icons.arrow_drop_down),
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String? newValue) {},
          items: [
            DropdownMenuItem(
                value: product.description, child: Text(product.description))
          ],
        ),
      ]),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    required this.icondata,
    required this.press,
  });
  final IconData icondata;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: IconButton(onPressed: press, icon: Icon(icondata)));
  }
}
