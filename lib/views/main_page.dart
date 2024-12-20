import 'package:eshop/views/cart/cart_page.dart';
import 'package:eshop/views/explore/explore_page.dart';
import 'package:eshop/views/home/home_page.dart';
import 'package:eshop/views/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var itemSelectedIndex = 0;

  final List<Widget> pages = [
     HomePage(),
    const ExplorePage(),
    const CartPage(),
    const ProfilePage()
  ];

  void setItemSelectedIndex(int index) {
    setState(() {
      itemSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[itemSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: itemSelectedIndex,
        onTap: setItemSelectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
