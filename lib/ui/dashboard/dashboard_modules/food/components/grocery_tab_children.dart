import 'package:taza/taza.dart';

class GroceryTabView extends StatelessWidget {
  const GroceryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    /// [TabContainer] Currently i am working on it so avoid changes for now
    final List<Map<String, String>> _categories = [
      {'title': 'Meal', 'image': 'assets/images/meal.jpg'},
      {'title': 'Burger', 'image': 'assets/images/burger.jpg'},
      {'title': 'Sandwich', 'image': 'assets/images/sandwich.jpg'},
      {'title': 'Starters', 'image': 'assets/images/starters.jpg'},
      {'title': 'Pasta', 'image': 'assets/images/starters.jpg'},
      {'title': 'Pizza', 'image': 'assets/images/starters.jpg'},
      {'title': 'Dessert', 'image': 'assets/images/starters.jpg'},
      {'title': 'Drinks', 'image': 'assets/images/starters.jpg'},
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SmartTextField(hintText: "Search food"),
          SizedBox(height: 20.h),
          Row(
            children: [
              Flexible(child: SmartImage(path: "assets/images/Fast1.png")),
              const Spacer(),
              SmartImage(path: "assets/images/Fast.png"),
            ],
          ),

          SizedBox(height: 20.h),

          // Food categories
          SizedBox(
            height: 120.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                final category = _categories[index];
                return _buildCategoryItem(category['title'].toString(), category['image'].toString());
              },
            ),
          ),
        ],
      ),
    );
    // Fast delivery section
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            imagePath,
            width: 80.w,
            height: 80.w,
            fit: BoxFit.cover,
            // Fallback if image not found
            errorBuilder:
                (context, error, stackTrace) => Container(
                  width: 80.w,
                  height: 80.w,
                  color: Colors.white.withOpacity(0.2),
                  child: Icon(Icons.image, color: Colors.white),
                ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
