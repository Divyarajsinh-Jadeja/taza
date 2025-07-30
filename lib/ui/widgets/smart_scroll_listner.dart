import 'package:taza/taza.dart';

class SmartScrollListner extends StatelessWidget {
  final Widget child;

  const SmartScrollListner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.axis == Axis.vertical) {
            Get.find<DashboardController>().onScroll(notification.metrics.pixels);
          }
          return false;
        },
        child: child,
      ),
    );
  }
}
