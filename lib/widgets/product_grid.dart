import 'package:flutter/material.dart';
import 'package:shopeasy/models/product.dart';
import 'package:shopeasy/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // The list of products now points to your local asset images.
    final List<Product> products = [
      Product(name: 'Premium Basmati Rice', sku: 'RICE001', price: 499.00, imageUrl: 'assets/images/premium basmati.jpg'),
      Product(name: 'Sona Masoori Rice', sku: 'RICE002', price: 599.00, imageUrl: 'assets/images/sona masoori.jpg'),
      Product(name: 'Idli Rice', sku: 'RICE003', price: 399.00, imageUrl: 'assets/images/idli rice.jpg'),
      Product(name: 'Parboiled Rice', sku: 'RICE004', price: 449.00, imageUrl: 'assets/images/parboiled.jpg'),
      Product(name: 'Brown Rice', sku: 'RICE005', price: 699.00, imageUrl: 'assets/images/brown rice.jpg'),
      Product(name: 'Broken Rice', sku: 'RICE006', price: 299.00, imageUrl: 'assets/images/broken rice.jpg'),
    ];

    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
