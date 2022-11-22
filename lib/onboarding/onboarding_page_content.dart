import 'package:ar_mall/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './onboarding_single_page.dart';
import '../utils/app_assets.dart';

class OnBoardingsPageContent extends StatefulWidget {
  const OnBoardingsPageContent({Key? key}) : super(key: key);

  @override
  State<OnBoardingsPageContent> createState() => _OnBoardingsPageContentState();
}

class _OnBoardingsPageContentState extends State<OnBoardingsPageContent> {
  final controller = PageController();

  Future setSeenOnboard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    seenOnboard = await pref.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSeenOnboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PageView(
            controller: controller,
            children: const [
              OnBoardingSinglePage(
                imagePath: AppAssets.onBoarding1,
                title: 'Trade Fashion',
                description:
                    'With the best offer, we have\nconnected to 100 partners',
              ),
              OnBoardingSinglePage(
                imagePath: AppAssets.onBoarding2,
                title: 'Discover Trends',
                description:
                    'We provide search category with\neasy to find and select',
              ),
              OnBoardingSinglePage(
                imagePath: AppAssets.onBoarding3,
                title: 'Find Talents',
                description:
                    'Discover the mind and hands behind\nthe biggest fashion trends',
                isLastPage: true,
              ),
            ],
          ),
          // const NavigationButtons(),
          Positioned(
            bottom: 54,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const SwapEffect(
                activeDotColor: Colors.white,
                dotWidth: 10,
                dotHeight: 10,
                dotColor: Colors.white38,
                type: SwapType.zRotation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
