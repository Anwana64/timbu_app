import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = "f3e220987e9e437fafa246e8e0956a0c20240705202746765812";
const appID = "9J6GBBV601JGPXF";
const organizationId = "a19d2cd65abf4c1791f321adf6c54be9";
const imageBaseUrl = "https://api.timbu.cloud/images/";


class Product {
  final String name;
  final String description;
  final String imageUrl;
  final String price;
  int quantity; // Add this line

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.quantity = 1, // Default quantity to 1
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'] ?? '',
      imageUrl: json['photos'].isNotEmpty ? imageBaseUrl + json['photos'][0]['url'] : '',
      price: json['current_price'].isNotEmpty ? json['current_price'][0]['NGN'][0].toString() : 'N/A',
    );
  }  
}



Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse(
        "https://api.timbu.cloud/products?size=10&organization_id=$organizationId&Appid=$appID&Apikey=$apiKey&page=1"),
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)['items'];
    return data.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
