import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavbar.dart';
import '../utils/menu_enum.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  static const namedRoute = '/Favourite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Appbar(
            title: 'Favourite',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.favourite,
      ),
    );
  }
}
