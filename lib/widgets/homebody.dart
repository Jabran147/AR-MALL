import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/searchbar.dart';
import '../widgets/slider.dart';
import '../widgets/products_grid.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Appbar(
                title: 'AR MALL',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SearchBar(),
            SizedBox(
              height: 20,
            ),
            MainSlider(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Trending',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'New In',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(height: 350, child: ProductGrid()),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
