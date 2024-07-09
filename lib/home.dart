import 'package:flutter/material.dart';
import 'package:timbu_app/banners.dart';
import 'package:timbu_app/constant.dart';
import 'package:timbu_app/networking.dart';
import 'package:timbu_app/prodcut_screen.dart';
import 'package:timbu_app/product_decription.dart';
import 'package:timbu_app/product_item_widget.dart';
import 'package:timbu_app/search_field.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timbu Shopping App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: kLighAsh,
            child: Icon(Icons.person_2_outlined),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: kLighAsh,
            child: Icon(Icons.notifications_none_outlined),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTextField(),
            const SizedBox(
              height: 15,
            ),
            const BannerWidget(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Special for You',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const ProductScreen()),
                    );
                  },
                  child: const Text("See more"),
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found'));
                  } else {
                    final products = snapshot.data!;
                    final displayedProducts =
                        products.length > 6 ? products.sublist(0, 6) : products;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final product = displayedProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDescriptionScreen(
                                            product: product)));
                          },
                          child: ProductItemsWidget(
                            image: product.imageUrl,
                            name: product.name,
                            price: product.price,
                          ),
                        );
                      },
                      itemCount: displayedProducts.length,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
