import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/favourite.dart';
import '../screens/shopping_cart.dart';
import '../screens/user.dart';
import '../screens/homepage.dart';
import '../utils/menu_enum.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    this.selectedMenu,
    Key? key,
  }) : super(key: key);

  final MenuState? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, -2),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomePage.namedRoute);
              },
              icon: SvgPicture.asset(
                'assets/svgs/home.svg',
                color: MenuState.home == selectedMenu
                    ? Color(0xFFFB9ED2)
                    : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Favourite.namedRoute);
              },
              icon: SvgPicture.asset(
                'assets/svgs/heart.svg',
                width: 27,
                color: MenuState.favourite == selectedMenu
                    ? Color(0xFFFB9ED2)
                    : Colors.black,
              ),
            ),
            Badge(
              position: BadgePosition.topEnd(top: -1, end: 4),
              badgeColor: Theme.of(context).indicatorColor,
              badgeContent: Text(
                '0',
                style: TextStyle(color: Colors.black),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Cart.namedRoute);
                },
                icon: SvgPicture.asset(
                  'assets/svgs/cart.svg',
                  width: 27,
                  color: MenuState.cart == selectedMenu
                      ? Color(0xFFFB9ED2)
                      : Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UserProfile.namedRoute);
              },
              icon: SvgPicture.asset(
                'assets/svgs/user.svg',
                width: 27,
                color: MenuState.user == selectedMenu
                    ? Color(0xFFFB9ED2)
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
