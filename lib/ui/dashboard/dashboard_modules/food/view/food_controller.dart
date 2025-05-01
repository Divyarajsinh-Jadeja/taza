import 'package:taza/taza.dart';
import 'package:taza/ui/dashboard/dashboard_modules/food/components/restaurant_item_card.dart';

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


  final List<RestaurantItemModel> restaurantItemList = [
    RestaurantItemModel(
      id: 1,
      imageUrl: 'https://i.ibb.co/99w2vpzL/Mc-Donalds-Retro.jpg',
      title: 'McDonald\'s',
      rating: 4.4,
      reviews: '15k',
      distance: '1.2 km',
      cuisines: 'Burgers, Fast Food',
      priceForTwo: 500,
      startingPrice: 99,
      deliveryTime: '20-25 min',
      hasCarousel: true,
      time: '20-25 min',
      price: '15',
    ),
    RestaurantItemModel(
      id: 2,
      imageUrl: 'https://i.ibb.co/xt5DpLNT/subway-header.jpg',
      title: 'Subway',
      rating: 4.3,
      reviews: '9.8k',
      distance: '1.0 km',
      cuisines: 'Sandwiches, Healthy',
      priceForTwo: 450,
      startingPrice: 129,
      deliveryTime: '15-20 min',
      hasCarousel: false,
      time: '15-20 min',
      price: '8',
    ),
    RestaurantItemModel(
      id: 3,
      imageUrl: 'https://i.ibb.co/23ZtTcjf/burger-king.jpg',
      title: 'Burger King',
      rating: 4.5,
      reviews: '12k',
      distance: '2.0 km',
      cuisines: 'Burgers, American',
      priceForTwo: 550,
      startingPrice: 119,
      deliveryTime: '20-30 min',
      hasCarousel: false,
      time: '20-30 min',
      price: '12',
    ),
    RestaurantItemModel(
      id: 4,
      imageUrl: 'https://i.ibb.co/Pzc05HXZ/dominos.jpg',
      title: 'Domino\'s Pizza',
      rating: 4.6,
      reviews: '18k',
      distance: '2.5 km',
      cuisines: 'Pizza, Fast Food',
      priceForTwo: 600,
      startingPrice: 99,
      deliveryTime: '25-35 min',
      hasCarousel: true,
      time: '25-35 min',
      price: '14',
    ),
    RestaurantItemModel(
      id: 5,
      imageUrl: 'https://i.ibb.co/HLrrqVV6/taco-bell.jpg',
      title: 'Taco Bell',
      rating: 4.3,
      reviews: '8.4k',
      distance: '1.7 km',
      cuisines: 'Mexican, Tacos',
      priceForTwo: 500,
      startingPrice: 109,
      deliveryTime: '20-25 min',
      hasCarousel: false,
      time: '20-25 min',
      price: '13',
    ),
    RestaurantItemModel(
      id: 6,
      imageUrl: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      title: 'KFC',
      rating: 4.5,
      reviews: '14k',
      distance: '2.3 km',
      cuisines: 'Chicken, Fast Food',
      priceForTwo: 650,
      startingPrice: 129,
      deliveryTime: '30-40 min',
      hasCarousel: true,
      time: '30-40 min',
      price: '20',
    ),
    RestaurantItemModel(
      id: 7,
      imageUrl: 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
      title: 'Pizza Hut',
      rating: 4.4,
      reviews: '10.2k',
      distance: '2.1 km',
      cuisines: 'Pizza, Italian',
      priceForTwo: 700,
      startingPrice: 149,
      deliveryTime: '25-30 min',
      hasCarousel: false,
      time: '25-30 min',
      price: '11',
    ),
  ];

  final List<FoodItemModel> foodItemList = [
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
      title: 'Grilled Salmon',
      rating: 4.5,
      reviews: '1.5k',
      time: '25-30 min',
      price: '15',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
      title: 'Avocado Toast',
      rating: 4.7,
      reviews: '2.3k',
      time: '10-15 min',
      price: '8',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg',
      title: 'Classic Burger',
      rating: 4.6,
      reviews: '3.1k',
      time: '15-20 min',
      price: '12',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
      title: 'Pasta Carbonara',
      rating: 4.8,
      reviews: '1.8k',
      time: '20-25 min',
      price: '14',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg',
      title: 'Vegan Buddha Bowl',
      rating: 4.9,
      reviews: '2.5k',
      time: '15-20 min',
      price: '13',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      title: 'Sushi Platter',
      rating: 4.7,
      reviews: '2.0k',
      time: '30-40 min',
      price: '20',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
      title: 'Margherita Pizza',
      rating: 4.6,
      reviews: '2.8k',
      time: '20-25 min',
      price: '11',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1640773/pexels-photo-1640773.jpeg',
      title: 'Caesar Salad',
      rating: 4.5,
      reviews: '1.9k',
      time: '10-15 min',
      price: '9',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
      title: 'Pancakes with Berries',
      rating: 4.8,
      reviews: '2.7k',
      time: '15-20 min',
      price: '10',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      title: 'Tacos',
      rating: 4.7,
      reviews: '2.2k',
      time: '20-25 min',
      price: '12',
    ),
    FoodItemModel(
      imageUrl: 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
      title: 'Pasta Primavera',
      rating: 4.6,
      reviews: '2.0k',
      time: '20-25 min',
      price: '13',
    ),
  ];

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
      imageUrl: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?q=80&w=1480&auto=format&fit=crop',
      title: 'Teriyaki Salmon Bowl',
      rating: 4.7,
      reviews: '2.3k',
      time: '20-25 min',
      price: '18',
    ),
    FoodItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1481&auto=format&fit=crop',
      title: 'Neapolitan Pizza',
      rating: 4.9,
      reviews: '3.5k',
      time: '15-20 min',
      price: '14',
    ),
    FoodItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=1470&auto=format&fit=crop',
      title: 'Vegetable Buddha Bowl',
      rating: 4.5,
      reviews: '1.8k',
      time: '10-15 min',
      price: '12',
    ),
    FoodItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1551024601-bec78aea704b?q=80&w=1364&auto=format&fit=crop',
      title: 'Beef Tacos',
      rating: 4.8,
      reviews: '2.7k',
      time: '20-25 min',
      price: '15',
    ),
    FoodItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?q=80&w=1374&auto=format&fit=crop',
      title: 'Tiramisu Dessert',
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

