import 'package:flutter/material.dart';

// Product class to define the product properties
class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

// Sample products list
List<Product> products = [
  Product(
      name: "Converse All Star",
      imageUrl: "assets/images/canvas_jone.jpg",
      price: 29.99),
  Product(
      name: "Camera Lens", imageUrl: "assets/images/camera.jpg", price: 19.99),
  Product(
      name: "PC Laptop", imageUrl: "assets/images/pc_laptop.jpg", price: 49.99),
];

// ProductGrid widget that displays a grid of product cards
class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 10, // Space between rows
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
            product: product); // Use ProductCard to display each product
      },
    );
  }
}

// ProductCard widget for displaying a product with a name, image, and price
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show a toast with the product name
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(product.name)),
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(product.imageUrl,
                height: 100), // Use Image.asset for local assets
            const SizedBox(height: 10),
            Text(product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold)), // Product name
            Text("\$${product.price.toString()}",
                style: const TextStyle(color: Colors.green)), // Product price
          ],
        ),
      ),
    );
  }
}
