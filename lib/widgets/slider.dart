import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';

class MainSlider extends StatelessWidget {
  const MainSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BannerCarousel(
      banners: BannerImages.listbanners,
      height: 200,
      activeColor: Color(0xFFFB9ED2),
      disableColor: Colors.white,
      animation: true,
      borderRadius: 10,
      indicatorBottom: false,
    );
  }
}

class BannerImages {
  static const String img1 =
      'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
  static const String img2 =
      'https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
  static const String img3 =
      'https://images.unsplash.com/photo-1516478177764-9fe5bd7e9717?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
  static const String img4 =
      'https://images.unsplash.com/photo-1514989940723-e8e51635b782?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
  static List<BannerModel> listbanners = [
    BannerModel(
      imagePath: img1,
      id: '1',
    ),
    BannerModel(
      imagePath: img2,
      id: '2',
    ),
    BannerModel(
      imagePath: img3,
      id: '3',
    ),
    BannerModel(
      imagePath: img4,
      id: '4',
    ),
  ];
}
