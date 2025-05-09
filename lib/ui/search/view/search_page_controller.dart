import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:taza/taza.dart';
import 'package:taza/ui/food_details/view/product_bottom_sheet.dart';

class SearchPageController extends GetxController {
  final RxBool isInCart = false.obs;
  final RxInt quantity = 1.obs;
  final RxBool showFullDescription = false.obs;
  final RxList<String> hints = ['Tenders', 'Burgers', 'Grocery', 'Deals', 'Lipstick', 'Face Wash', 'Toys', 'Chocolate'].obs;
  final RxInt currentHintIndex = 0.obs;
  final searchController = TextEditingController().obs;
  ScrollController scrollController = ScrollController();
  late stt.SpeechToText speech;
  bool isListening = false;
  RxString spokenText = "".obs;
  final RxList<SearchCategoryModel> searchCategories = <SearchCategoryModel>[].obs;
  final RxList<String> pastSearches = <String>[].obs;


  @override
  void onInit() {
    printWrapped("FoodDetailsController initialized");
    speech = stt.SpeechToText();
    initSpeech();
    Timer.periodic(Duration(seconds: 2), (timer) {
      currentHintIndex.value = (currentHintIndex.value + 1) % hints.length;
    });
    loadProducts();
    loadPastSearches();
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

  void loadPastSearches() {
    final stored = StorageManager.instance.getPastSearches();
    pastSearches.assignAll(stored);

    if (pastSearches.isNotEmpty) {
      searchCategories.insert(0, SearchCategoryModel(
        title: 'Your Past Searches',
        pastSearches: pastSearches,
      ));
    }
  }

  void addSearchToHistory(String query) {
    if (query.trim().isEmpty) return;

    if (!pastSearches.contains(query)) {
      pastSearches.insert(0, query);
      if (pastSearches.length > 10) pastSearches.removeLast(); // Keep max 10 items
      StorageManager.instance.savePastSearches(pastSearches);
    }

    final pastCategory = searchCategories.firstWhereOrNull(
          (cat) => cat.title == 'Your Past Searches',
    );

    if (pastCategory != null) {
      pastCategory.pastSearches = pastSearches;
      searchCategories.refresh();
    } else {
      searchCategories.insert(0, SearchCategoryModel(
        title: 'Your Past Searches',
        pastSearches: pastSearches,
      ));
    }
  }

  void clearSearchHistory() {
    pastSearches.clear();
    StorageManager.instance.clearPastSearches();

    final pastCategory = searchCategories.firstWhereOrNull(
          (cat) => cat.title == 'Your Past Searches',
    );

    if (pastCategory != null) {
      pastCategory.pastSearches = [];
      searchCategories.refresh();
    }
  }



  void closeMic(){
    Future.delayed(Duration(seconds: 5), () {
      Get.back();
      spokenText.value = "";
      speech.stop();
    });
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }


  void addToCart(BuildContext context, InstamartProductModel category) {
    isInCart.value = true;
    Utils.showSmartModalBottomSheet(context: context, builder: (context) => ProductBottomSheet(category));
  }


  void toggleDescription() {
    showFullDescription.value = !showFullDescription.value;
  }



  void loadProducts() {
    searchCategories.addAll([
      SearchCategoryModel(
        title: 'Ultimate deals on groceries',
        products: [
          InstamartProductModel(id: '6', name: 'Fresh Vegies', price: 60, imageUrl: 'https://i.ibb.co/GvwYZYfk/category-grocery.png', description: ''),
          InstamartProductModel(id: '7', name: 'Coconut', price: 70, imageUrl: 'https://i.ibb.co/LDs5vb8H/category-one.png', description: ''),
          InstamartProductModel(id: '8', name: 'Amul Milk', price: 80, imageUrl: 'https://i.ibb.co/DD1Q6HCz/category-dairy.png', description: ''),
          InstamartProductModel(id: '9', name: 'Fortune Oil', price: 59, imageUrl: 'https://i.ibb.co/F4QpP3tT/category-oils.png', description: ''),
          InstamartProductModel(id: '10', name: 'Fresh Vegies', price: 50, imageUrl: 'https://i.ibb.co/GvwYZYfk/category-grocery.png', description: ''),
        ],
      ),
      SearchCategoryModel(
        title: 'The Ultimate home solution',
        products: [
          InstamartProductModel(id: '11', name: 'Biscuits', price: 16, imageUrl: AppImages.categoryBiscuits, description: ''),
          InstamartProductModel(id: '12', name: 'Tea & More', price: 35, imageUrl: AppImages.categoryTea, description: ''),
          InstamartProductModel(id: '13', name: 'Dry-Fruits', price: 50, imageUrl: AppImages.categoryAlmonds, description: ''),
          InstamartProductModel(id: '14', name: 'Meat & Seafood', price: 28, imageUrl: AppImages.categoryMeat, description: ''),
          InstamartProductModel(id: '15', name: 'Oils & Ghee', price: 35, imageUrl: 'assets/images/category_oils.png', description: '')
        ],
      ),
      SearchCategoryModel(
        title: 'Popular Searches',
        foodTabData: [
          FoodTabData(
            imagePath: "assets/images/ic_shopping_bag.png",
            themeColor: Color(0xFFfcd44b),
            bannerWidget: SmartImage(path: "assets/images/healthy_vegie_yellow.png", fit: BoxFit.cover, height: 170.h,),
            tabText: "All",
          ),
          FoodTabData(
            imagePath: "assets/images/ic_fresh_instamart.png",
            themeColor: Color(0xFFffbd59),
            bannerWidget: SmartImage(path: "assets/images/fruits_banner.png", fit: BoxFit.cover,  height: 180.h,),
            tabText: "Fresh",
          ),
          FoodTabData(
            imagePath: "assets/images/ic_gadgets.png",
            themeColor: Color(0xFF08610c),
            bannerWidget: SmartImage(path: "assets/images/dairy_banner.png", fit: BoxFit.cover,  height: 180.h,),
            tabText: "Gadgets",
          ),
          FoodTabData(
            imagePath: "assets/images/ic_house.png",
            themeColor: Color(0xFFfcd44b),
            bannerWidget: SmartImage(path: "assets/images/banner_oil.jpg", fit: BoxFit.cover,  height: 180.h,),
            tabText: "Home",
          ),
          FoodTabData(
            imagePath: "assets/images/ic_beauty_products.png",
            themeColor: Color(0xFF633174),
            bannerWidget: SizedBox(),
            tabText: "Beauty",
          ),
          FoodTabData(
            imagePath: "assets/images/ic_kids_instamart.svg",
            themeColor: Color(0xFFE91E63),
            bannerWidget: SizedBox(),
            tabText: "Kids",
          ),
        ],
      ),
      SearchCategoryModel(
        title: 'Trending Toys Kids Will Love!',
        products: [
          InstamartProductModel(id: '1', name: 'Teddy Bear', price: 18, imageUrl: 'assets/images/ic_kids_instamart.svg', description: ''),
          InstamartProductModel(id: '2', name: 'Teddy Bear', price: 20, imageUrl: 'assets/images/ic_kids_instamart.svg', description: ''),
          InstamartProductModel(id: '3', name: 'Teddy Bear', price: 32, imageUrl: 'assets/images/ic_kids_instamart.svg', description: ''),
          InstamartProductModel(id: '4', name: 'Teddy Bear', price: 40, imageUrl: 'assets/images/ic_kids_instamart.svg', description: ''),
          InstamartProductModel(id: '5', name: 'Teddy Bear', price: 58, imageUrl: 'assets/images/ic_kids_instamart.svg', description: ''),
        ],
      ),
    ]);
  }

}