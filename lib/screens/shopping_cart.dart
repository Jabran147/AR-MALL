import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavbar.dart';
import '../utils/menu_enum.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  static const namedRoute = '/Cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Appbar(
            title: 'Cart',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.cart,
      ),
    );
  }
}
