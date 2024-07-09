import 'package:flutter/material.dart';

class ProductItemsWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductItemsWidget({super.key, required this.image, required this.name, required this.price, });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'NGN $price',
                  style: const TextStyle(fontSize: 14,),
                ),
                const SizedBox(height: 4),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
