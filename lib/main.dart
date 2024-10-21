import 'package:flutter/material.dart';
import 'package:store_app/Features/categories/presentation/views/category-products_screen.dart';
import 'package:store_app/home_page.dart';
import 'package:store_app/Features/products/presentation/views/update_product_page.dart';


void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'homePage':(context) => const HomePage(),
        'updatePage':(context) =>  UpdateProductPage(),
      },
      initialRoute: 'homePage',
    );
  }
}


