import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavbar.dart';
import '../utils/menu_enum.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  static const namedRoute = '/userprofile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Appbar(
            title: 'User Profile',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.user,
      ),
    );
  }
}
