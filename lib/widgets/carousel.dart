import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/providers/carousel_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class HCarousel extends StatefulWidget {
  const HCarousel({super.key});

  @override
  State<HCarousel> createState() => _HCarouselState();
}

class _HCarouselState extends State<HCarousel> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CarouselProvider>(
        context,
        listen: false,
      ).fetchCarouselImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    final carouselProvider = Provider.of<CarouselProvider>(context);

    if (carouselProvider.isLoading) {
      return const SizedBox(
        height: 180,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (carouselProvider.error != null) {
      return SizedBox(
        height: 180,
        child: Center(child: Text(carouselProvider.error!)),
      );
    }

    final imageUrls = carouselProvider.imageUrls;

    if (imageUrls.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text('No carousel items found.')),
      );
    }

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageUrls.length,
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
            viewportFraction: 1,
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
                placeholder:
                    (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        color: Colors.white,
                      ),
                    ),
                errorWidget:
                    (context, url, error) =>
                        const Icon(Icons.error, size: 50, color: Colors.red),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imageUrls.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 20 : 9,
              height: 9,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.teal : Colors.grey[400],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
