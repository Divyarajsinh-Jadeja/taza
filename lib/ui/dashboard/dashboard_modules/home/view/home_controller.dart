import 'package:taza/taza.dart';

class HomeController extends GetxController {
  final RxList<Map<String, dynamic>> options = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    debugPrint("HomeController onInit");
    loadOptions(); // Load data when the controller is initialized
    super.onInit();
  }

  void loadOptions() {
    options.assignAll([
      {
        'title': 'Food Delivery',
        'subtitle': 'Christmas Offer',
        'tag': 'Free Delivery',
        'time': '6',
        'duration': 'Min',
        'image': 'https://i.ibb.co/4wfmxWh0/food-delivery-image.png',
      },
      {
        'title': 'Dine In',
        'subtitle': 'Savor the moment',
        'tag': 'Buy 1 Get 1 Free',
        'image': 'https://i.ibb.co/ZRDYBYTc/image-dine-in.png',
      },
      {
        'title': 'Take Away',
        'subtitle': 'Grab and go',
        'tag': 'Buy 1 Get 1 Free',
        'image': 'https://i.ibb.co/ZRDYBYTc/image-dine-in.png',
      },
    ]);
  }
}
