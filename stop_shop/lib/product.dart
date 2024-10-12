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
      name: "Product 1",
      imageUrl: "https://via.placeholder.com/150",
      price: 29.99),
  Product(
      name: "Product 2",
      imageUrl: "https://via.placeholder.com/150",
      price: 19.99),
  Product(
      name: "Product 3",
      imageUrl: "https://via.placeholder.com/150",
      price: 49.99),
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
class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double _opacity = 1.0;

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.5 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show a toast with the product name
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.product.name)),
        );
        _toggleOpacity(); // Toggle the opacity when the card is tapped
      },
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: _opacity,
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(widget.product.imageUrl,
                  height: 100), // Product image
              const SizedBox(height: 10),
              Text(widget.product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold)), // Product name
              Text("\$${widget.product.price.toString()}",
                  style: const TextStyle(color: Colors.green)), // Product price
            ],
          ),
        ),
      ),
    );
  }
}
