import 'package:taza/taza.dart';

class FoodScreenTabsView extends GetView<FoodController> {
  const FoodScreenTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabContainer(
      borderRadius: BorderRadius.circular(20.r),
      tabEdge: TabEdge.bottom,
      curve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
        return SlideTransition(
          position: Tween(begin: const Offset(0.2, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      colors: const <Color>[Color(0xfffa86be), Color(0xffa275e3)],
      tabs: controller.tabs.map((e) => SmartText(e)).toList(),
      children: const [FoodTabView(), GroceryTabView()],
    );
  }
}
