import 'package:taza/taza.dart';

class FoodController extends GetxController with GetSingleTickerProviderStateMixin {
  /// food tab controller
  late TabController foodTabController;

  /// craving tab controller
  late TabController cravingTabController;

  /// food scroll controller
  ScrollController scrollController = ScrollController();

  /// search controller
  final TextEditingController searchController = TextEditingController();

  RxInt selectedFoodTab = 0.obs;

  final RxList<String> hints = ['Tenders', 'Burgers', 'Grocery', 'Deals'].obs;
  final RxInt currentHintIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    foodTabController = TabController(length: tabs.length, vsync: this);
    foodTabController.addListener(() {
      selectedFoodTab.value = foodTabController.index;
    });
    Timer.periodic(Duration(seconds: 2), (timer) {
      currentHintIndex.value = (currentHintIndex.value + 1) % hints.length;
    });
    if (Get.context != null) {
      precacheImage(AssetImage('assets/images/banner-2.jpg'), Get.context!);
    }
  }

  final GlobalKey headerKey = GlobalKey();

  final List<FoodTabData> tabs = [

    FoodTabData(
      imagePath: "assets/images/burger1.png",
      themeColor: Color(0xFF0c3271),
      bannerWidget: SmartImage(path: "assets/images/banner-2.jpg", fit: BoxFit.cover),
      tabText: "Burger",
    ),
    FoodTabData(
      imagePath: "assets/images/sandwich.png",
      themeColor: Color(0xFF3f6800),
      bannerWidget: SmartImage(path: "assets/images/banner-3.jpg", fit: BoxFit.cover),
      tabText: "Sandwich",
    ),
    FoodTabData(
      imagePath: "assets/images/noodles.png",
      themeColor: Color(0xFFfd235d),
      bannerWidget: SmartImage(path: "assets/images/banner-4.jpg", fit: BoxFit.cover),
      tabText: "Noodles",
    ),
    FoodTabData(
      imagePath: "assets/images/pizza.png",
      themeColor: Color(0xFF633174),
      bannerWidget: SmartImage(path: "assets/images/banner-5.jpg", fit: BoxFit.cover),
      tabText: "Pizza",
    ),
    FoodTabData(
      imagePath: "assets/images/chinease.png",
      themeColor: Color(0xFFE91E63),
      bannerWidget: SizedBox(),
      tabText: "Chinese",
    ),
    FoodTabData(
      imagePath: "assets/images/meat.png",
      themeColor: Color(0xFF3F51B5),
      bannerWidget: SizedBox(),
      tabText: "Non-Veg",
    ),
    FoodTabData(
      imagePath: "assets/images/dosa.png",
      themeColor: Color(0xFFfcd44b),
      bannerWidget: Image.asset(AppImages.icBannerGif, fit: BoxFit.cover),
      tabText: "North-Indian",
    ),
    /*FoodTabData(
      imagePath: AppImages.categoryBakery,
      themeColor: Color(0xFF3F51B5),
      bannerWidget: SizedBox(),
      tabText: "Bakery",
    ),
    FoodTabData(
      imagePath: AppImages.categoryBiscuits,
      themeColor: Color(0xFF3F51B5),
      bannerWidget: SizedBox(),
      tabText: "Biscuits",
    ),
    FoodTabData(
      imagePath: AppImages.categoryTea,
      themeColor: Color(0xFF3F51B5),
      bannerWidget: SizedBox(),
      tabText: "Caffique",
    ),
    FoodTabData(
      imagePath: AppImages.categoryAlmonds,
      themeColor: Color(0xFF3F51B5),
      bannerWidget: SizedBox(),
      tabText: "Dry-Fruits",
    ),
    FoodTabData(
      imagePath: AppImages.categoryMeat,
      themeColor: Color(0xFF3F51B5),
      bannerWidget: SizedBox(),
      tabText: "Meat",
    ),*/
  ];

  FoodTabData get currentFoodTabData => tabs[selectedFoodTab.value];

  /// bottom navigation bar tab callback
  void onTabSelected() {}

  final List<Map<String, String>> categoriesOfferZone = const [
    {'title': 'Large Order', 'image': 'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg'},
    {'title': 'Gourmet Delights', 'image': 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg'},
    {'title': 'Delivery Fast', 'image': 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg'},
    {'title': 'Offer Zone', 'image': 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg'},
    {'title': 'Large Order', 'image': 'assets/images/food-3.png'},
    {'title': 'Gourmet Delights', 'image': 'assets/images/food-2.png'},
  ];

  final List<Map<String, String>> popularBrandsList = const [
    {'image': 'https://i.ibb.co/r2pXXP4v/dac5f96ac4b110ec87b56edfcb9f59db-removebg-preview.png'},
    {'image': 'https://i.ibb.co/F44gC4C8/Orange-and-Yellow-Simple-Street-Food-Logo-removebg-preview.png'},
    {'image': 'https://i.ibb.co/mr4NJFYM/Red-and-White-Modern-Burger-Logo-removebg-preview.png'},
    {'image': 'https://i.ibb.co/20RfCHVs/Yellow-and-Brown-Kitchen-Food-Logo-removebg-preview.png'},
    {'image': 'https://i.ibb.co/gFJ9g2Lw/pngimg-com-mcdonalds-PNG9-removebg-preview.png'},

  ];




  final List<FoodModel> foodItemList = getRandomMenuItems(10);

  ///Remove the promo banner
  final List<String> foodBannerList = [];

  final List<Widget> cravingTabs = [
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg',
          width: 80.w,
          height: 80.w,
          imageBorderRadius: BorderRadius.all(Radius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8.w),
        SmartText("Salad"),
        SizedBox(height: 8.w),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg',
          width: 80.w,
          height: 80.w,
          imageBorderRadius: BorderRadius.all(Radius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8.w),
        SmartText("Burger"),
        SizedBox(height: 8.w),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg',
          width: 80.w,
          height: 80.w,
          imageBorderRadius: BorderRadius.all(Radius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8.w),
        SmartText("Dessert"),
        SizedBox(height: 8.w),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
          width: 80.w,
          height: 80.w,
          imageBorderRadius: BorderRadius.all(Radius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8.w),
        SmartText("Sushi"),
        SizedBox(height: 8.w),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
          width: 80.w,
          height: 80.w,
          imageBorderRadius: BorderRadius.all(Radius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8.w),
        SmartText("Pasta"),
        SizedBox(height: 8.w),
      ],
    ),
  ];

  final List<FoodModel> menuItems = getRandomMenuItems(8);

  final List<FoodModel> menuItems2 = getRandomMenuItems(5);

  final CarouselSliderController sliderController = CarouselSliderController();

  final RxInt selectedCategoryIndex = 0.obs;

  final List<String> categoryNames = ["What's New?", "Fast Delivery", "Meals", "Starters", "Meals", "Starters"];

  void updateSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  final List<FoodModel> flavorItemList = getRandomMenuItems(15);

  List<ShoppingListOption> getOptions(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    return [
      ShoppingListOption(
        title: LocaleKeys.scanIt.tr,
        icon: Icons.camera_alt,
        backgroundGradientStart: colors.colorFDE8DE,
        backgroundGradientEnd: colors.colorF5C9B8,
        onTap: () {
          Get.back();
        },
      ),
      ShoppingListOption(
        title: LocaleKeys.sayIt.tr,
        icon: Icons.mic,
        backgroundGradientStart: colors.colorD9EAFD,
        backgroundGradientEnd: colors.colorA5CDFE,
        onTap: () {
          Get.back();
        },
      ),
      ShoppingListOption(
        title: LocaleKeys.writeIt.tr,
        icon: Icons.edit,
        backgroundGradientStart: colors.colorFFE6B8,
        backgroundGradientEnd: colors.colorFFF86D,
        onTap: () {
          Get.back();
        },
      ),
    ];
  }

  @override
  void onClose() {
    foodTabController.dispose();
    cravingTabController.dispose();
    scrollController.dispose();
    searchController.dispose();
    super.onClose();
  }

  RxDouble headerHeight = 0.0.obs;

  void updateHeaderHeight(double height) {
    if (headerHeight.value != height) {
      headerHeight.value = height;
    }
  }
}

