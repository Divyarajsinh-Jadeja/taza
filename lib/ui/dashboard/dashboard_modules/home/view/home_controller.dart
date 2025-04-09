import 'package:taza/taza.dart';

class HomeController extends GetxController {
  final List<Map<String, String>> categoryItems = [
    {"title": "Offer Zone", "image": "assets/offer_zone.png"},
    {"title": "Large Order", "image": "assets/large_order.png"},
    {"title": "Gourmet Delights", "image": "assets/gourmet.png"},
    {"title": "Delivery Fast", "image": "assets/delivery.png"},
  ];

  @override
  void onInit() {
    debugPrint("HomeController onInit");
    super.onInit();
  }

  void onTabSelected() {
    debugPrint('HomeController → Tab Init');
  }
}
