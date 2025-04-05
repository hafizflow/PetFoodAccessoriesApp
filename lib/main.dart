import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_food_accessories_app/app.dart';
import 'package:pet_food_accessories_app/providers/bottom_nav_provider.dart';
import 'package:pet_food_accessories_app/providers/login_provider.dart';
import 'package:pet_food_accessories_app/providers/product_detail_provider.dart';
import 'package:pet_food_accessories_app/providers/signup_provider.dart';
import 'package:pet_food_accessories_app/routers/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],

      child: DevicePreview(
        enabled: true,
        storage: DevicePreviewStorage.none(),
        defaultDevice: Devices.ios.iPhone12ProMax,
        builder: (context) {
          return const MyApp();
        },
      ),

      // child: const MyApp(),
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
