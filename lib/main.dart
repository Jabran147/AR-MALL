import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/product_provider.dart';
import './constants/app_theme.dart';
import './screens/homepage.dart';
import './screens/favourite.dart';
import './screens/shopping_cart.dart';
import './screens/user.dart';
import './screens/product_detail.dart';
import './screens/splash_screen.dart';
import './provider/quantity_provider.dart';

bool? seenOnboard;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuantityProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        title: 'AR Mall',
        home: const SplashScreen(),
        routes: {
          HomePage.namedRoute: (context) => HomePage(),
          Favourite.namedRoute: (context) => Favourite(),
          Cart.namedRoute: (context) => Cart(),
          UserProfile.namedRoute: (context) => UserProfile(),
          ProductDetail.namedRoute: (context) => ProductDetail(),
        },
      ),
    );
  }
}
