import 'package:eshop/views/cart/cart_page.dart';
import 'package:eshop/views/favourite/favourite_page.dart';
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
    const HomePage(),
     CartPage(),
     FavouritePage(),
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
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
