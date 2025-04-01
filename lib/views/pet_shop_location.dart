import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PetShopLocation extends StatefulWidget {
  const PetShopLocation({super.key});

  @override
  State<PetShopLocation> createState() => _PetShopLocationState();
}

class _PetShopLocationState extends State<PetShopLocation> {
  final customInfoWindowController = CustomInfoWindowController();
  late GoogleMapController mapController;
  Map<String, Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(23.8084, 90.3682),
              zoom: 15,
            ),
            onTap: (position) {
              customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              customInfoWindowController.googleMapController = controller;
              mapController = controller;
              addMarker(
                'hafiz',
                LatLng(23.8044, 90.3699),
                "https://github.com/hafizflow/PetFoodAccessoriesApp/blob/main/host_images/hafiz.png?raw=true",
                title: "Hafiz Pet Shop",
                snippet: "Best Pet Accessories",
              );

              addMarker(
                'riyad',
                LatLng(23.8000, 90.3660),
                "https://github.com/hafizflow/PetFoodAccessoriesApp/blob/main/host_images/riyad.png?raw=true",
                title: "Riyad Pet Shop",
                snippet: "Cat Food & Accessories",
              );

              addMarker(
                'tanaz',
                LatLng(23.8161, 90.3740),
                "https://github.com/hafizflow/PetFoodAccessoriesApp/blob/main/host_images/tanaz.png?raw=true",
                title: "Tanaz Pet Shop",
                snippet: "Dog Food & Accessories",
              );

              addMarker(
                'tanjil',
                LatLng(23.8191, 90.3680),
                "https://github.com/hafizflow/PetFoodAccessoriesApp/blob/main/host_images/Tanjil.png?raw=true",
                title: "Tanjil Pet Shop",
                snippet: "Fish Food & Accessories",
              );

              addMarker(
                'suzana',
                LatLng(23.8111, 90.3630),
                "https://github.com/hafizflow/PetFoodAccessoriesApp/blob/main/host_images/suzana.png?raw=true",
                title: "Suzana Pet Shop",
                snippet: "Bird Food & Accessories",
              );
            },
            markers: markers.values.toSet(),
          ),
          CustomInfoWindow(
            controller: customInfoWindowController,
            height: 150,
            width: 200,
            offset: 70,
          ),
        ],
      ),
    );
  }

  addMarker(
    String id,
    LatLng position,
    String url, {
    String? title,
    String? snippet,
  }) async {
    try {
      var bytes =
          (await NetworkAssetBundle(
            Uri.parse(url),
          ).load(url)).buffer.asUint8List();

      var marker = Marker(
        markerId: MarkerId(id),
        position: position,
        infoWindow:
            (title != null || snippet != null)
                ? InfoWindow(title: title ?? '', snippet: snippet ?? '')
                : InfoWindow.noText,
        icon: BitmapDescriptor.bytes(bytes),
        onTap: () {
          if (id == 'hafiz') {
            customInfoWindowController.addInfoWindow!(
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://github.com/hafizflow/PetFoodAccessoriesApp/blob/main/host_images/pet_banner.png?raw=true",
                      height: 100,
                      width: 180,
                      fit: BoxFit.contain,
                      placeholder:
                          (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: Colors.teal,
                            ),
                          ),
                      errorWidget:
                          (context, url, error) =>
                              Icon(Icons.error, size: 50, color: Colors.red),
                    ),
                    Text(
                      title ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(snippet ?? "", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              position,
            );
          }
        },
      );

      markers[id] = marker;
      setState(() {});
    } catch (e) {
      debugPrint("Error loading marker: $e");
    }
  }
}
