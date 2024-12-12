import 'package:e_shop/screens/cart/cart_screen.dart';
import 'package:e_shop/screens/products/products_screen.dart';
import 'package:e_shop/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              DiscountBanner(),
              Categories(),
              SpecialOffers(),
              SizedBox(height: 20),
              PopularProducts(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              // Navigate to Home Screen
              Navigator.pushNamed(context, HomeScreen.routeName);
              break;
            case 1:
              // Navigate to Wishlist Screen (ProductsScreen as placeholder)
              Navigator.pushNamed(context, ProductsScreen.routeName);
              break;
            case 2:
              // Navigate to Cart Screen
              Navigator.pushNamed(context, CartScreen.routeName);
              break;
            case 3:
              // Navigate to Profile Screen
              Navigator.pushNamed(context, ProfileScreen.routeName);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
