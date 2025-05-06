import 'package:taza/taza.dart';

class CategoryController extends GetxController {
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxList<SubCategoriesModel> instaMartCategories = <SubCategoriesModel>[].obs;
  final RxInt selectedCategoryIndex = 0.obs;

  bool get isShowBanner => selectedCategoryIndex.value == 0 || selectedCategoryIndex.value == 3 || selectedCategoryIndex.value == 5;

  bool get isLargeScreen => Get.width > 800;

  @override
  void onInit() {
    super.onInit();
    loadUpdatedCategories();
    loadInstamartCategories();
  }

  void loadUpdatedCategories() {
    final List<CategoryModel> updatedCategories = [
      CategoryModel(
        id: '1',
        name: 'Grilled Salmon',
        image: 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
        products: generateCommonProducts('snacks'),
      ),
      CategoryModel(
        id: '2',
        name: 'Avocado Toast',
        image: 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        products: generateCommonProducts('dairy'),
      ),
      CategoryModel(
        id: '3',
        name: 'Classic Burger',
        image: 'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg',
        products: generateCommonProducts('vegetable'),
      ),
      CategoryModel(
        id: '4',
        name: 'Pasta Carbonara',
        image: 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
        products: generateCommonProducts('bakery'),
      ),
      CategoryModel(
        id: '5',
        name: 'Vegan Bowl',
        image: 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg',
        products: generateCommonProducts('plant-based-meat'),
      ),
      CategoryModel(
        id: '6',
        name: 'Sushi Platter',
        image: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
        products: generateCommonProducts('fish-seafood'),
      ),
      CategoryModel(
        id: '7',
        name: 'Caesar Salad',
        image: 'https://images.pexels.com/photos/1640773/pexels-photo-1640773.jpeg',
        products: generateCommonProducts('fresh-vegetables'),
      ),
      CategoryModel(
        id: '8',
        name: 'Margherita Pizza',
        image: 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
        products: generateCommonProducts('fruits'),
      ),
      CategoryModel(
        id: '9',
        name: 'Pancakes',
        image: 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        products: generateCommonProducts('beverages'),
      ),
      CategoryModel(
        id: '10',
        name: 'Tacos',
        image: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
        products: generateCommonProducts('snacks-2'),
      ),
      CategoryModel(
        id: '11',
        name: 'Meat',
        image:
            'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_96/NI_CATALOG/IMAGES/CIW/2025/2/17/4b0b663e-fb13-49ec-bd52-dfae2328fcd1_7adcab28-51f3-4a68-88d5-b9f8ce7d64b7',
        products: generateCommonProducts('meat'),
      ),
      CategoryModel(
        id: '12',
        name: 'Pasta Primavera',
        image: 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
        products: generateCommonProducts('spices'),
      ),
    ];

    categories.assignAll(updatedCategories);
  }

  ///For instamart
  void loadInstamartCategories(){
    List<SubCategoriesModel> groceryList = [
          SubCategoriesModel(
              id: '1',
              name: 'Fresh Vegetables',
              categoryUrl: "https://i.ibb.co/GvwYZYfk/category-grocery.png",
              products: generateProductsForInstamart('1'),
          ),
          SubCategoriesModel(
              id: '2',
              name: 'Fresh Fruits',
              categoryUrl: "https://i.ibb.co/LDs5vb8H/category-one.png",
            products: generateProductsForInstamart('2'),
          ),
          SubCategoriesModel(
              id: '3',
              name: 'Dairy & Eggs',
              categoryUrl: "https://i.ibb.co/DD1Q6HCz/category-dairy.png",
            products: generateProductsForInstamart('3'),
          ),
          SubCategoriesModel(
              id: '4',
              name: 'Oils & Ghee',
              categoryUrl: "https://i.ibb.co/F4QpP3tT/category-oils.png",
            products: generateProductsForInstamart('4'),
          ),SubCategoriesModel(
              id: '5',
              name: 'Masalas',
              categoryUrl: "https://i.ibb.co/p6dG1TW5/category-masala.png",
        products: generateProductsForInstamart('5'),
          ),SubCategoriesModel(
              id: '6',
              name: 'Breakfast',
              categoryUrl: "https://i.ibb.co/GfDRGzkr/category-corn.png",
        products: generateProductsForInstamart('6'),
          ),SubCategoriesModel(
              id: '7',
              name: 'Atta,Rice & Dal',
              categoryUrl: "https://i.ibb.co/JjrJz1fy/category-atta.png",
        products: generateProductsForInstamart('7'),
          ),
          SubCategoriesModel(
              id: '8',
              name: 'Bakery',
              categoryUrl: "https://i.ibb.co/RkgKp1CQ/category-bakery.png",
            products: generateProductsForInstamart('8'),
          ),
          SubCategoriesModel(
              id: '9',
              name: 'Biscuits & Cakes',
              categoryUrl: "https://i.ibb.co/Y48J13z3/category-biscuits.png",
            products: generateProductsForInstamart('9'),
          ),
          SubCategoriesModel(
              id: '10',
              name: 'Tea, Coffee & More',
              categoryUrl: "https://i.ibb.co/XZDCSrSx/category-tea.png",
            products: generateProductsForInstamart('10'),
          ),SubCategoriesModel(
              id: '11',
              name: 'Dry Fruits',
              categoryUrl: "https://i.ibb.co/pvqm2t2W/category-almonds.png",
        products: generateProductsForInstamart('11'),
          ),
          SubCategoriesModel(
              id: '12',
              name: 'Meat and Seafood',
              categoryUrl: "https://i.ibb.co/C3j9TxTX/category-meat.png",
            products: generateProductsForInstamart('12'),
          ),
  ];
    instaMartCategories.assignAll(groceryList);
  }


  List<ProductModel> generateCommonProducts(String categoryId) {
    return List.generate(14, (index) {
      return ProductModel(
        id: '${categoryId}_product_${index + 1}',
        name: 'Sample Product ${index + 1}',
        description: 'High quality and fresh grocery item',
        price: 19.99 + index * 5,
        imageUrl: productImages[index],
      );
    });
  }

  List<ProductModel> generateProductsForInstamart(String categoryId) {
    return List.generate(12, (index) {
      return ProductModel(
        id: '${categoryId}_product_${index + 1}',
        name: 'Sample Product ${index + 1}',
        description: 'High quality and fresh grocery item',
        price: 19.99 + index * 5,
        imageUrl: instamartProductImages[index],
      );
    });
  }

  final List<String> productImages = [
    'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
    'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
    'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg',
    'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
    'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg',
    'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
    'https://images.pexels.com/photos/1640773/pexels-photo-1640773.jpeg',
    'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
    'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
    'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_96/NI_CATALOG/IMAGES/CIW/2025/2/17/4b0b663e-fb13-49ec-bd52-dfae2328fcd1_7adcab28-51f3-4a68-88d5-b9f8ce7d64b7',
    'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
    'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
    'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
  ];

  final List<String> instamartProductImages = [
    'https://i.ibb.co/GvwYZYfk/category-grocery.png',
    'https://i.ibb.co/LDs5vb8H/category-one.png',
    'https://i.ibb.co/DD1Q6HCz/category-dairy.png',
    'https://i.ibb.co/F4QpP3tT/category-oils.png',
    'https://i.ibb.co/p6dG1TW5/category-masala.png',
    'https://i.ibb.co/GfDRGzkr/category-corn.png',
    'https://i.ibb.co/JjrJz1fy/category-atta.png',
    'https://i.ibb.co/RkgKp1CQ/category-bakery.png',
    'https://i.ibb.co/Y48J13z3/category-biscuits.png',
    'https://i.ibb.co/XZDCSrSx/category-tea.png',
    'https://i.ibb.co/pvqm2t2W/category-almonds.png',
    'https://i.ibb.co/C3j9TxTX/category-meat.png',
  ];

  // Method to change selected category
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  // Getter for current category
  CategoryModel get currentCategory => categories.isNotEmpty ? categories[selectedCategoryIndex.value] : CategoryModel();
  SubCategoriesModel get currentInstamartCategory => instaMartCategories.isNotEmpty ? instaMartCategories[selectedCategoryIndex.value] : SubCategoriesModel();
}
