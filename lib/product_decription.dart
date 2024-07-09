import 'package:flutter/material.dart';
import 'package:timbu_app/networking.dart';
import 'package:timbu_app/product_description_widget.dart';

class ProductDescriptionScreen extends StatelessWidget {
  final Product product;

  const ProductDescriptionScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDescWidget(
        dec: product.description,
        image: product.imageUrl,
        name: product.name,
        price: product.price,
        
      ),
    );
  }
}
