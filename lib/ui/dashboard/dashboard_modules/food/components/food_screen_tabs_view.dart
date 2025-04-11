import 'package:taza/taza.dart';

class FoodScreenTabsView extends GetView<FoodController> {
  const FoodScreenTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();

    /// [TabContainer] Currently i am working on it so avoid changes for now
    // return TabContainer(
    //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
    //   tabEdge: TabEdge.bottom,
    //   curve: Curves.easeIn,
    //   controller: controller.tabController,
    //   transitionBuilder: (child, animation) {
    //     animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
    //     return SlideTransition(
    //       position: Tween(begin: const Offset(0.2, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
    //       child: FadeTransition(opacity: animation, child: child),
    //     );
    //   },
    //   colors: <Color>[AppTheme.of(context).colors.primary, Colors.deepPurple],
    //   tabs: controller.tabs.map((e) => SmartText(e)).toList(),
    //   children: [FoodTabView(), GroceryTabView()],
    // );
  }
}
