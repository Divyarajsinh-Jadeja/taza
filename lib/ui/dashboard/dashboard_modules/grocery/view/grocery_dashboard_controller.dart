import 'package:taza/taza.dart';

class GroceryDashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  /// food tab controller
  late TabController foodTabController;

  /// craving tab controller

  /// food scroll controller
  ScrollController scrollController = ScrollController();

  /// search controller
  final TextEditingController searchController = TextEditingController();

  RxInt selectedFoodTab = 0.obs;

  final RxList<String> hints = ['Vegetables', 'Edible Fats', 'Grocery', 'Fruits'].obs;
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
      imagePath: AppImages.categoryGrocery,
      themeColor: Color(0xFFfcd44b),
      bannerWidget: SmartImage(path: "assets/images/healthy_vegie_yellow.png", fit: BoxFit.cover, height: 170.h,),
      tabText: "Vegetables",
    ),
    FoodTabData(
      imagePath: AppImages.categoryOne,
      themeColor: Color(0xFFffbd59),
      bannerWidget: SmartImage(path: "assets/images/fruits_banner.png", fit: BoxFit.cover,  height: 180.h,),
      tabText: "Fruits",
    ),
    FoodTabData(
      imagePath: AppImages.categoryDairy,
      themeColor: Color(0xFF08610c),
      bannerWidget: SmartImage(path: "assets/images/dairy_banner.png", fit: BoxFit.cover,  height: 180.h,),
      tabText: "Dairy & Eggs",
    ),
    FoodTabData(
      imagePath: AppImages.categoryOils,
      themeColor: Color(0xFFfcd44b),
      bannerWidget: SmartImage(path: "assets/images/banner_oil.jpg", fit: BoxFit.cover,  height: 180.h,),
      tabText: "Edible Fats",
    ),
    FoodTabData(
      imagePath: AppImages.categoryMasala,
      themeColor: Color(0xFF633174),
      bannerWidget: SizedBox(),
      tabText: "Masalas",
    ),
    FoodTabData(
      imagePath: AppImages.categoryCorn,
      themeColor: Color(0xFFE91E63),
      bannerWidget: SizedBox(),
      tabText: "Breakfast",
    ),
    FoodTabData(
      imagePath: AppImages.categoryAtta,
      themeColor: Color(0xFF3F51B5),
      bannerWidget: SizedBox(),
      tabText: "Staples",
    ),
    FoodTabData(
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
    ),
  ];

  FoodTabData get currentFoodTabData => tabs[selectedFoodTab.value];

  /// bottom navigation bar tab callback
  void onTabSelected() {}

  final List<Map<String, String>> categoriesOfferZone = const [
    {'title': 'Potato', 'image': 'assets/images/potato.png'},
    {'title': 'Promgranate', 'image': 'assets/images/anar.png'},
    {'title': 'Cucumber', 'image': 'assets/images/cucumber.png'},
    {'title': 'Ginger', 'image': 'assets/images/ginger.png'},
    {'title': 'Karela', 'image': 'assets/images/karela.png'},
    {'title': 'Strawberry', 'image': 'assets/images/strawberry.png'},
    {'title': 'Mix Vegies', 'image': 'assets/images/vegies.png'},
  ];

  final List<FoodItemModel> foodItemList = [
    FoodItemModel(
      imageUrl: 'assets/images/potato.png',
      title: 'Potato',
      rating: 4.5,
      reviews: '1.5k',
      time: '25-30 min',
      price: '15',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/anar.png',
      title: 'Promgranate',
      rating: 4.7,
      reviews: '2.3k',
      time: '10-15 min',
      price: '8',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/cucumber.png',
      title: 'Cucumber',
      rating: 4.6,
      reviews: '3.1k',
      time: '15-20 min',
      price: '12',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/ginger.png',
      title: 'Ginger',
      rating: 4.8,
      reviews: '1.8k',
      time: '20-25 min',
      price: '14',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/vegies.png',
      title: 'Mix Vegies',
      rating: 4.9,
      reviews: '2.5k',
      time: '15-20 min',
      price: '13',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/category_oils.png',
      title: 'Oil and Ghee',
      rating: 4.7,
      reviews: '2.0k',
      time: '30-40 min',
      price: '20',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/carrot.jpeg',
      title: 'Carrot',
      rating: 4.6,
      reviews: '2.8k',
      time: '20-25 min',
      price: '11',
    ),
    /*FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1640773/pexels-photo-1640773.jpeg',
      title: 'Caesar Salad',
      rating: 4.5,
      reviews: '1.9k',
      time: '10-15 min',
      price: '9',
    ),*/
    FoodItemModel(
      imageUrl: 'assets/images/cucumber.png',
      title: 'Cucumber',
      rating: 4.8,
      reviews: '2.7k',
      time: '15-20 min',
      price: '10',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/black_kaddu.png',
      title: 'Pumpkin',
      rating: 4.7,
      reviews: '2.2k',
      time: '20-25 min',
      price: '12',
    ),
    FoodItemModel(
      imageUrl: 'assets/images/lady_finger.png',
      title: 'Lady Finger',
      rating: 4.6,
      reviews: '2.0k',
      time: '20-25 min',
      price: '13',
    ),
  ];

  final List<String> foodBannerList = const ["https://i.ibb.co/6c6X3PFB/grocery-promo.gif"];

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

  final List<FoodItemModel> menuItems = [
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg',
      title: 'Grilled Chicken',
      rating: 4.5,
      reviews: '1.5k',
      time: '25-30 min',
      price: '15',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg',
      title: 'Fresh Garden Salad',
      rating: 4.7,
      reviews: '2.3k',
      time: '10-15 min',
      price: '8',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/2233729/pexels-photo-2233729.jpeg',
      title: 'Beef Burger',
      rating: 4.6,
      reviews: '3.1k',
      time: '15-20 min',
      price: '12',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1527603/pexels-photo-1527603.jpeg',
      title: 'Seafood Risotto',
      rating: 4.8,
      reviews: '1.8k',
      time: '20-25 min',
      price: '14',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/699953/pexels-photo-699953.jpeg',
      title: 'Chocolate Cake',
      rating: 4.9,
      reviews: '2.5k',
      time: '15-20 min',
      price: '13',
    ),
  ];

  final List<FoodItemModel> menuItems2 = [
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/2092897/pexels-photo-2092897.jpeg',
      title: 'Thai Green Curry',
      rating: 4.7,
      reviews: '2.1k',
      time: '20-25 min',
      price: '16',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg',
      title: 'Breakfast Burrito',
      rating: 4.4,
      reviews: '1.8k',
      time: '15-20 min',
      price: '9',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg',
      title: 'Seafood Paella',
      rating: 4.9,
      reviews: '2.7k',
      time: '30-40 min',
      price: '22',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg',
      title: 'Mushroom Risotto',
      rating: 4.6,
      reviews: '1.3k',
      time: '25-30 min',
      price: '14',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/357756/pexels-photo-357756.jpeg',
      title: 'Berry Cheesecake',
      rating: 4.8,
      reviews: '3.2k',
      time: '10-15 min',
      price: '11',
    ),
  ];

  final CarouselSliderController sliderController = CarouselSliderController();

  final RxInt selectedCategoryIndex = 0.obs;

  final List<String> categoryNames = ["What's New?", "Fast Delivery", "Meals", "Starters", "Meals", "Starters"];

  void updateSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  final List<FoodItemModel> flavorItemList = [
    FoodItemModel(
      imageUrl: AppImages.categoryGrocery,
      title: 'Fresh Vegies(3-Veg_Mix)',
      rating: 4.7,
      reviews: '2.3k',
      time: '20-25 min',
      price: '18',
    ),
    FoodItemModel(
      imageUrl: AppImages.categoryDairy,
      title: "Amul Milk with Bread",
      rating: 4.9,
      reviews: '3.5k',
      time: '15-20 min',
      price: '14',
    ),
    FoodItemModel(
      imageUrl: AppImages.categoryMasala,
      title: 'Garam Masala',
      rating: 4.5,
      reviews: '1.8k',
      time: '10-15 min',
      price: '12',
    ),
    FoodItemModel(
      imageUrl: AppImages.categoryAtta,
      title: 'Aashirwad Atta',
      rating: 4.8,
      reviews: '2.7k',
      time: '20-25 min',
      price: '15',
    ),
    FoodItemModel(
      imageUrl: AppImages.categoryAlmonds,
      title: 'Almonds',
      rating: 4.6,
      reviews: '2.1k',
      time: '5-10 min',
      price: '9',
    ),
  ];

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

