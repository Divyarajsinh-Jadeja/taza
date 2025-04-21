import 'package:taza/taza.dart';

class CategoryController extends GetxController {
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxInt selectedCategoryIndex = 0.obs;

  bool get isShowBanner => selectedCategoryIndex.value == 0 || selectedCategoryIndex.value == 3 || selectedCategoryIndex.value == 5;

  bool get isLargeScreen => Get.width > 800;

  @override
  void onInit() {
    super.onInit();
    loadUpdatedCategories();
  }

  void loadUpdatedCategories() {
    final List<CategoryModel> updatedCategories = [
      CategoryModel(
        id: 'snacks',
        name: 'Snacks',
        image: 'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg',
        products: generateCommonProducts('snacks'),
      ),
      CategoryModel(
        id: 'dairy',
        name: 'Dairy',
        image: 'https://i0.wp.com/www.kabilaifarm.com/wp-content/uploads/2023/06/Understanding-the-Different-Types-of-Dairy-Products.jpg',
        products: generateCommonProducts('dairy'),
      ),
      CategoryModel(
        id: 'vegetable',
        name: 'Vegetable',
        image: 'https://www.niir.org/blog/wp-content/uploads/2023/05/9-2.jpg',
        products: generateCommonProducts('vegetable'),
      ),
      CategoryModel(
        id: 'bakery',
        name: 'Bakery',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/567052d8-9618-4ceb-bda1-f195fa78a2cc_eb30370f-cbe4-4e93-b4c1-d9c71622a11f',
        products: generateCommonProducts('bakery'),
      ),
      CategoryModel(
        id: 'plant-based-meat',
        name: 'Plant Based Meat',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/4fec724a-c344-4b23-b6fd-e6d696577cfd_444bb828-6365-413c-b7d0-ef1864b95ad5',
        products: generateCommonProducts('plant-based-meat'),
      ),
      CategoryModel(
        id: 'fish-seafood',
        name: 'Fish and Seafood',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/fde3a928-55e0-4367-9145-6b2f69e331f1_f24f6a02-28e5-481b-af67-9354fccd64a3',
        products: generateCommonProducts('fish-seafood'),
      ),
      CategoryModel(
        id: 'fresh-vegetables',
        name: 'Fresh Vegetables',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/3/19/b2676f05-a400-41d7-9972-bc7a182c9a57_6d253ad3-aa89-460e-adce-3e20698c008f',
        products: generateCommonProducts('fresh-vegetables'),
      ),
      CategoryModel(
        id: 'fruits',
        name: 'Fruits',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/3/19/f369d6d4-49c6-4f57-a801-dfe3d0f3073b_057f4b62-a4b2-4c82-80b2-fbc20d06387a',
        products: generateCommonProducts('fruits'),
      ),
      CategoryModel(
        id: 'beverages',
        name: 'Beverages',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2024/11/23/517525a3-2cc0-4feb-80ed-a447e47cbc47_949b7643-9de3-4ad9-8920-366e6f0814cd',
        products: generateCommonProducts('beverages'),
      ),
      CategoryModel(
        id: 'snacks-2',
        name: 'Snacks (2nd)',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2024/11/23/8be99d9b-a6e2-4a7f-b269-1dc1ea03a611_269d71e9-1473-4a37-acc5-f836406ce587',
        products: generateCommonProducts('snacks-2'),
      ),
      CategoryModel(
        id: 'meat',
        name: 'Meat',
        image:
            'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_96/NI_CATALOG/IMAGES/CIW/2025/2/17/4b0b663e-fb13-49ec-bd52-dfae2328fcd1_7adcab28-51f3-4a68-88d5-b9f8ce7d64b7',
        products: generateCommonProducts('meat'),
      ),
      CategoryModel(
        id: 'spices',
        name: 'Spices',
        image:
            'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/2149e719-73f0-4109-a9f7-bb0c048f5f76_19da0609-b66c-4a58-aadc-9beec4a41a44',
        products: generateCommonProducts('spices'),
      ),
    ];

    categories.assignAll(updatedCategories);
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

  final List<String> productImages = [
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_272,w_252/NI_CATALOG/IMAGES/CIW/2025/1/12/e0d181d7-7756-4439-99e6-83c8d23a9a0c_92118_1.png",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_272,w_252/d2dc187f59ca5ea4b227306282e36f22",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/3/19/f7d9376b-bd76-4d32-b764-c571cc77a2e9_1caf9829-007f-4b8d-a38e-fa6d092320c2",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/f5e00d95-997e-4279-8dfd-1c2bbc5ace34_60228eb0-54da-4804-95eb-74ac84e006d6",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/567052d8-9618-4ceb-bda1-f195fa78a2cc_eb30370f-cbe4-4e93-b4c1-d9c71622a11f",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/a481799d-b29c-4723-bdda-690021132bc3_9044be8f-011c-4de5-a110-8fa3a15069f9",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/2149e719-73f0-4109-a9f7-bb0c048f5f76_19da0609-b66c-4a58-aadc-9beec4a41a44",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2024/7/3/4121a462-dc57-4cb1-910b-056b5a02ae8d_c33058e0-6895-43d6-b3e1-e4c42c2b3fdd",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/9a80557e-0883-4cfc-8df8-131cc16b982e_5b72d6ab-7048-43ea-bd5d-f272416a4063",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/17/957f6644-12d4-4c73-be97-fd3eec4661e9_c7bd6a25-3b67-4663-a2ae-6b96f47c05e3",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/3/4/50eba797-b232-4e97-b578-e60886b6a165_6ced657f-8c05-4e35-a01b-1631129664af",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2024/7/3/d0d4bf84-e337-4c4d-8320-0be4dde066a3_1a0e4888-355d-49b1-9a8c-2a9b8e71f678",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/3/18/62a0f8a4-747a-41e8-a5ed-b304ec02c139_8129ecc9-db9c-48ee-b651-7484800a0a6d",
    "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_294/NI_CATALOG/IMAGES/CIW/2025/2/27/6e4ae802-2187-410d-8b2b-5fd5f6e8e783_9208c4aa-06b7-4114-a4e9-343fa0e09a91",
  ];

  // Method to change selected category
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  // Getter for current category
  CategoryModel get currentCategory => categories.isNotEmpty ? categories[selectedCategoryIndex.value] : CategoryModel();
}
