import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_food_accessories_app/app.dart';
import 'package:pet_food_accessories_app/firebase_options.dart';
import 'package:pet_food_accessories_app/providers/all_product_provider.dart';
import 'package:pet_food_accessories_app/providers/bottom_nav_provider.dart';
import 'package:pet_food_accessories_app/providers/carousel_provider.dart';
import 'package:pet_food_accessories_app/providers/cart_provider.dart';
import 'package:pet_food_accessories_app/providers/category_product_provider.dart';
import 'package:pet_food_accessories_app/providers/login_provider.dart';
import 'package:pet_food_accessories_app/providers/product_detail_provider.dart';
import 'package:pet_food_accessories_app/providers/product_provider.dart';
import 'package:pet_food_accessories_app/providers/signup_provider.dart';
import 'package:pet_food_accessories_app/routers/route_generator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'PawMartHafiz',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CarouselProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProductProvider()),
        ChangeNotifierProvider(create: (_) => AllProductProvider()),
      ],

      // child: DevicePreview(
      //   enabled: true,
      //   storage: DevicePreviewStorage.none(),
      //   defaultDevice: Devices.ios.iPhone12ProMax,
      //   builder: (context) {
      //     return const MyApp();
      //   },
      // ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Food & Accessories App',
      home: const PetFoodAccessoriesApp(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
