import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart'; // GetMaterialApp
import 'theme.dart'; // Import the theme file
import 'product.dart'; // Import the product file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _themeMode,
      home: CatalogPage(toggleTheme: _toggleTheme),
    );
  }
}

class CatalogPage extends StatelessWidget {
  final VoidCallback toggleTheme;

  const CatalogPage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Store"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme, // Toggle theme button
          ),
        ],
      ),
      body: const ProductGrid(), // Display product grid
    );
  }
}
