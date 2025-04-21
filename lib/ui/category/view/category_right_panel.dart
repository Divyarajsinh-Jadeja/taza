import 'package:taza/taza.dart';
import 'package:taza/ui/category/view/category_screen.dart';

class CategoryProductGrid extends GetView<CategoryController> {
  const CategoryProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: Tween<Offset>(begin: Offset(0.05, 0), end: Offset.zero).animate(animation), child: child),
          );
        },
        child: ProductListView(key: ValueKey(controller.selectedCategoryIndex.value)),
      ),
    );
  }
}

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF3E1F16), Color(0xFF7B3F29)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: SmartColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmartText(
            "Up to 40% OFF",
            style: TextStyle(color: Colors.amber.shade200, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          SizedBox(height: 6),
          SmartText("Try crispy wafers for a sweet break!", style: TextStyle(color: Colors.white70, fontSize: 14)),
          SizedBox(height: 14),
          SmartButton(
            onTap: () {},
            title: "Order Now ",
            height: 32,
            width: context.width / 3,
            activeBackgroundColor: Colors.white,
            titleStyle: AppTheme.of(context).interMediumBoldW500TextStyle,
          ),
        ],
      ),
    );
  }
}
