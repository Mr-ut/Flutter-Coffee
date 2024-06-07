import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/components/bottom_nav_bar.dart';
import 'package:flutter_test_application_1/const.dart';
import 'package:flutter_test_application_1/pages/cart_page.dart';
import 'package:flutter_test_application_1/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate to bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final user = FirebaseAuth.instance.currentUser;
  // pages
  final List<Widget> _pages = [
    // shop page
    ShopPage(),

    // cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
