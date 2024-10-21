import 'package:flutter/material.dart';
import 'package:store_app/Features/categories/presentation/views/categories_screen.dart';
import 'package:store_app/Features/products/presentation/views/products_screen.dart';
import 'package:store_app/Features/products/presentation/views/add_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Move _selectedIndex and _pages here as instance variables
  int _selectedIndex = 0;

  // Define the pages
  final List<Widget> _pages = <Widget>[
    ProductsScreen(),
    CategoriesScreen(),
  ];

  // Handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
        ],
        currentIndex: _selectedIndex, 
        selectedItemColor: Color.fromARGB(255, 197, 115, 15),
        onTap: _onItemTapped, 
      ),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.add),onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductPage()));
        }),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Explore',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _pages[_selectedIndex],  // Display the selected page
    );
  }
}
