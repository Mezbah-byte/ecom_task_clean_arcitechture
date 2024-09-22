import 'package:ecom_task/core/utils/appColor.dart';
import 'package:ecom_task/features/cart/pesentation/page/cartPage.dart';
import 'package:ecom_task/features/category/pesentation/page/categoryPage.dart';
import 'package:ecom_task/features/home/presentation/pages/home_page.dart';
import 'package:ecom_task/features/profile/pesentation/page/profilePage.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pageOptions = [
    HomePage(),
    // CategoryScreen(),
    CategoryPage(),
    CartPage(),
    // FavoritesScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home,
              label: 'Home',
              index: 0,
            ),
            _buildNavItem(
              icon: Icons.category,
              label: 'Category',
              index: 1,
            ),
            _buildNavItem(
              icon: Icons.shopping_cart,
              label: 'Cart',
              index: 2,
            ),
            _buildNavItem(
              icon: Icons.person,
              label: 'Profile',
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorResources.newBg : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: 18,
            ),
            // const SizedBox(height: 4),
            // Text(
            //   label,
            //   style: TextStyle(
            //     color: isSelected ? Colors.white : Colors.grey,
            //     fontSize: 11,
            //     fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
