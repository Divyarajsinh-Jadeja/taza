import 'package:taza/taza.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: AppThemes().appColor.primary),
        child: Center(child: SmartImage(width: 150.w, path: AppImages.icSplashLogo, fit: BoxFit.fill)),
      ),
    );
  }
}
