import 'package:taza/taza.dart';

class HomeController extends GetxController {
  final RxList<Map<String, dynamic>> options = <Map<String, dynamic>>[].obs;
  final RxList<String> hints = ['Tenders', 'Burgers', 'Grocery', 'Deals'].obs;
  final RxInt currentHintIndex = 0.obs;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    debugPrint("HomeController onInit");
    loadOptions();
    Timer.periodic(Duration(seconds: 2), (timer) {
      currentHintIndex.value = (currentHintIndex.value + 1) % hints.length;
    });
    super.onInit();
  }

  void onTabSelected(){}

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
