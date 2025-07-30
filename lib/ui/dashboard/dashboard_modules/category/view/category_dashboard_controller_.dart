import 'package:taza/taza.dart';

class CategoryDashboardController extends GetxController{
  final List<Map<String, dynamic>> options = <Map<String, dynamic>>[];

  RxList<CategoriesModel> groceryList = [
    CategoriesModel(
      id: 'grocery',
      name: 'Grocery & Kitchen',
      subCategories: [
        SubCategoriesModel(
            id: '1',
            name: 'Fresh Vegetables',
            categoryUrl: "https://i.ibb.co/GvwYZYfk/category-grocery.png"
        ),
        SubCategoriesModel(
            id: '2',
            name: 'Fresh Fruits',
            categoryUrl: "https://i.ibb.co/LDs5vb8H/category-one.png"
        ),
        SubCategoriesModel(
            id: '3',
            name: 'Dairy & Eggs',
            categoryUrl: "https://i.ibb.co/DD1Q6HCz/category-dairy.png"
        ),
        SubCategoriesModel(
            id: '4',
            name: 'Oils & Ghee',
            categoryUrl: "https://i.ibb.co/F4QpP3tT/category-oils.png"
        ),SubCategoriesModel(
            id: '5',
            name: 'Masalas',
            categoryUrl: "https://i.ibb.co/p6dG1TW5/category-masala.png"
        ),SubCategoriesModel(
            id: '6',
            name: 'Breakfast',
            categoryUrl: "https://i.ibb.co/GfDRGzkr/category-corn.png"
        ),SubCategoriesModel(
            id: '7',
            name: 'Atta,Rice & Dal',
            categoryUrl: "https://i.ibb.co/JjrJz1fy/category-atta.png"
        ),
        SubCategoriesModel(
            id: '8',
            name: 'Bakery',
            categoryUrl: "https://i.ibb.co/RkgKp1CQ/category-bakery.png"
        ),
        SubCategoriesModel(
            id: '9',
            name: 'Biscuits & Cakes',
            categoryUrl: "https://i.ibb.co/Y48J13z3/category-biscuits.png"
        ),
        SubCategoriesModel(
            id: '10',
            name: 'Tea, Coffee & More',
            categoryUrl: "https://i.ibb.co/XZDCSrSx/category-tea.png"
        ),SubCategoriesModel(
            id: '11',
            name: 'Dry Fruits',
            categoryUrl: "https://i.ibb.co/pvqm2t2W/category-almonds.png"
        ),
        SubCategoriesModel(
            id: '12',
            name: 'Meat and Seafood',
            categoryUrl: "https://i.ibb.co/C3j9TxTX/category-meat.png"
        ),


      ],
    ),
    CategoriesModel(
      id: 'snacks',
      name: 'Snacks & Drinks',
      subCategories: [
        SubCategoriesModel(
            id: '1',
            name: 'Chips and Namkeens',
            categoryUrl: "https://i.ibb.co/qFrQ4pct/chips-Photoroom.png"
        ),
        SubCategoriesModel(
            id: '2',
            name: 'Chocolates and Sweets',
            categoryUrl: "https://i.ibb.co/fKx3XrH/choc-Photoroom.png"
        ),
        SubCategoriesModel(
            id: '3',
            name: 'Drinks and Juices',
            categoryUrl: "https://i.ibb.co/kgtPWj3s/cocacola-Photoroom.png"
        ),
        SubCategoriesModel(
            id: '4',
            name: 'Frozen Food',
            categoryUrl: "https://i.ibb.co/DgkwysDz/frenchfried-Photoroom.png"
        ),SubCategoriesModel(
            id: '5',
            name: 'Ice Creams & Desserts',
            categoryUrl: "https://i.ibb.co/gbVWnQcb/icecream-Photoroom.png"
        ),SubCategoriesModel(
            id: '6',
            name: 'Noodles, Pasta & More',
            categoryUrl: "https://i.ibb.co/4RVXzcN3/maggi-Photoroom.png"
        ),SubCategoriesModel(
            id: '7',
            name: 'Paan Corner',
            categoryUrl: "https://i.ibb.co/4wPG6HZS/nicotex-Photoroom.png"
        ),
        SubCategoriesModel(
            id: '8',
            name: 'Sauces & Spreads',
            categoryUrl: "https://i.ibb.co/XHCggh7/sauce-Photoroom.png"
        ),
      ],
    ),
  ].obs;
  void onTabSelected() {
    debugPrint('CartController → Tab Init');
  }
}