import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('Hello World'),
            SizedBox(
              height: 240,
              child: CarouselView(
                itemExtent: MediaQuery.sizeOf(context).width,
                itemSnapping: true,
                children: List.generate(10, (int index) {
                  return Container(
                    color: Colors.grey,
                    child: Image.network(
                      'https://picsum.photos/400?random=$index',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
