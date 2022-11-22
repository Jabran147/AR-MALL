import 'package:flutter/material.dart';
import '../widgets/homebody.dart';
import '../widgets/bottomnavbar.dart';
import '../utils/menu_enum.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static const namedRoute = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeBody()),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
