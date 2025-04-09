import 'package:taza/taza.dart';
import 'package:taza/ui/widgets/smart_category_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          SmartCategoryRow(
            categories: [
              FoodCategory(imagePath: 'https://i.ibb.co/DfhxyxmG/Group-118-1.png', name: 'Meal', onTap: () => print('Meal tapped')),
              FoodCategory(imagePath: 'https://i.ibb.co/chrNxfh6/Group-118-2.png', name: 'Burger', onTap: () => print('Burger tapped')),
              FoodCategory(imagePath: 'https://i.ibb.co/nMCktdhW/Group-118-3.png', name: 'Sandwich', onTap: () => print('Sandwich tapped')),
              FoodCategory(imagePath: 'https://i.ibb.co/67g3RhCN/Group-118.png', name: 'Starters', onTap: () => print('Starters tapped')),
              FoodCategory(imagePath: 'https://i.ibb.co/DfhxyxmG/Group-118-1.png', name: 'Meal', onTap: () => print('Meal tapped')),
              FoodCategory(imagePath: 'https://i.ibb.co/chrNxfh6/Group-118-2.png', name: 'Burger', onTap: () => print('Burger tapped')),
              FoodCategory(imagePath: 'https://i.ibb.co/nMCktdhW/Group-118-3.png', name: 'Sandwich', onTap: () => print('Sandwich tapped')),
              FoodCategory(imagePath: 'https://i.ibb.co/67g3RhCN/Group-118.png', name: 'Starters', onTap: () => print('Starters tapped')),
            ],
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoryItems.length,
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final item = controller.categoryItems[index];
                return SmartCategoryCard(title: item['title']!, imagePath: item['image']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
