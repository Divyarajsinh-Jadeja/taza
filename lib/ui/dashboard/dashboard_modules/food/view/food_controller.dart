import 'package:taza/taza.dart';

class FoodController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late TabController cravingTabController;

  final scrollController = ScrollController();
  final searchController = TextEditingController();

  final tabs = const ["Food", "Grocery"];

  final List<Map<String, String>> categoriesOfferZone = const [
    {'title': 'Large Order', 'image': 'assets/images/food-2.png'},
    {'title': 'Gourmet Delights', 'image': 'assets/images/food-3.png'},
    {'title': 'Delivery Fast', 'image': 'assets/images/food-4.png'},
    {'title': 'Offer Zone', 'image': 'assets/images/food-2.png'},
    {'title': 'Large Order', 'image': 'assets/images/food-3.png'},
    {'title': 'Gourmet Delights', 'image': 'assets/images/food-4.png'},
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

  final List<String> foodBannerList = const ["https://i.ibb.co/DHZxXgkZ/Banner.jpg"];

  final List<Widget> cravingTabs = [
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg',
          width: 80,
          height: 80,
          imageBorderRadius: BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8),
        SmartText("Salad"),
        SizedBox(height: 8),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg',
          width: 80,
          height: 80,
          imageBorderRadius: BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8),
        SmartText("Burger"),
        SizedBox(height: 8),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg',
          width: 80,
          height: 80,
          imageBorderRadius: BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8),
        SmartText("Dessert"),
        SizedBox(height: 8),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
          width: 80,
          height: 80,
          imageBorderRadius: BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8),
        SmartText("Sushi"),
        SizedBox(height: 8),
      ],
    ),
    Column(
      children: [
        SmartImage(
          path: 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
          width: 80,
          height: 80,
          imageBorderRadius: BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(height: 8),
        SmartText("Pasta"),
        SizedBox(height: 8),
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

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    setupTabControllerListener();
    debugPrint("FoodController initialized");
  }

  void onTabSelected() {}

  void setupTabControllerListener() {
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        /// TODO :: callback
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    cravingTabController.dispose();
    scrollController.dispose();
    searchController.dispose();
    super.onClose();
  }
}
