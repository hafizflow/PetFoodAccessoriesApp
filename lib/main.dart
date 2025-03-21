import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Food & Accessories App',
      home: const PetFoodAccessoriesApp(),
    );
  }
}

class PetFoodAccessoriesApp extends StatelessWidget {
  const PetFoodAccessoriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
