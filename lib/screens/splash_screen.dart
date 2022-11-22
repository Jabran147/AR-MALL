import 'dart:async';

import 'package:ar_mall/main.dart';
import 'package:ar_mall/onboarding/onboarding_page_content.dart';
import 'package:ar_mall/onboarding/onboarding_single_page.dart';
import 'package:ar_mall/screens/homepage.dart';
import 'package:flutter/material.dart';
import '../utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), openOnboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppAssets.bgLogoPng),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('AR MALL',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white)),
                      Text('Discover Your Style',
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void openOnboardingScreen() {
    if (seenOnboard == false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingsPageContent(),
        ),
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.namedRoute, (route) => false);
    }
  }
}
