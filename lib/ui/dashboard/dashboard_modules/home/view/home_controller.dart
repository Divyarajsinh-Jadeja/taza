import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:taza/taza.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> options = <Map<String, dynamic>>[];
  final List<Map<String, dynamic>> addresses = <Map<String, dynamic>>[];
  final RxList<String> hints = ['Tenders', 'Burgers', 'Grocery', 'Deals'].obs;
  final RxInt currentHintIndex = 0.obs;
  final searchController = TextEditingController().obs;
  bool isInitialLogin = false;
  ScrollController scrollController = ScrollController();
  late stt.SpeechToText speech;
  bool isListening = false;
  RxString spokenText = "".obs;

  @override
  void onInit() {
    debugPrint("HomeController onInit");
    isInitialLogin = StorageManager.instance.isLoginDone();
    loadOptions();
    loadAddresses();
    speech = stt.SpeechToText();
    initSpeech();
    Timer.periodic(Duration(seconds: 2), (timer) {
      currentHintIndex.value = (currentHintIndex.value + 1) % hints.length;
    });
    super.onInit();
  }

  Future<void> initSpeech() async {
    bool available = await speech.initialize(
      onStatus: (status) => debugPrint('Speech status: $status'),
      onError: (error) => debugPrint('Speech error: $error'),
    );
    if (!available) {
      Get.snackbar('Error', 'Speech recognition not available');
    }
  }

  Future<void> openMic() async {
    if (!speech.isListening) {
      isListening = true;
      await speech.listen(
        onResult: (result) {
          searchController.value.text = result.recognizedWords;
          spokenText.value = result.recognizedWords;
        },
      );
    } else {
      isListening = false;
      await speech.stop();
    }
  }

  void closeMic(){
    Future.delayed(Duration(seconds: 5), () {
      Get.back();
      spokenText.value = "";
      speech.stop();
    });
  }

  void onTabSelected(){}

  void navigateToProfilePage(){
    isInitialLogin == true ? Get.toNamed(AppRoutes.profilePage)
        : Get.toNamed(AppRoutes.loginPage);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void loadOptions() {
    options.assignAll([
      {
        'title': 'Food Delivery',
        'subtitle': 'Christmas Offer',
        'tag': 'Up to 60% OFF',
        'image': 'https://i.ibb.co/4wfmxWh0/food-delivery-image.png',
      },
      /*{
        'title': 'Instamart',
        'subtitle': 'Get anything instantly',
        'tag': 'Free Del at ${49.toCurrencyCodeFormat()}',
        'time': '8',
        'duration': 'Min',
        'image': 'https://i.ibb.co/G4vQfkKp/grocery-Photoroom.png',
      },
      {
        'title': 'Dine In',
        'subtitle': 'Sip & Savour Fest',
        'tag': 'Min 30% OFF',
        'image': 'https://i.ibb.co/ZRDYBYTc/image-dine-in.png',
      },*/
      {
        'title': 'Take Away',
        'subtitle': 'Grab and go',
        'tag': 'Buy 1 Get 1 Free',
        'image': 'https://i.ibb.co/PZwthYZS/image-128.png',
      },
    ]);
  }

  void loadAddresses() {
    addresses.assignAll([
      {
        'name': 'Al Habeeb',
        'pincode': '382480',
        'tag': 'Home',
        'address': '1600 Amphitheatre, Mountain View',
      },
      {
        'name': 'Al Qadir',
        'pincode': '380028',
        'tag': 'Work',
        'address': 'King Abdulaziz Rd, Al-Zahra\'a, Jeddah',
      },
    ]);
  }
}
