import 'package:taza/taza.dart';


class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).manageCustomerStyle;
    return Scaffold(
      appBar: AppBar(
        title: SmartText("Dashboard", style: style.appbarTitleStyle),
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            HomePage(),
            ProfilePage(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        );
      }),
    );
  }
}
