import 'package:taza/taza.dart';

class FoodTabView extends GetWidget<FoodController> {
  const FoodTabView({super.key});

  @override
  Widget build(BuildContext context) {
    /// [TabContainer] Currently i am working on it so avoid changes for now
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
        ],
      ),
    );
    // Fast delivery section
  }
}
