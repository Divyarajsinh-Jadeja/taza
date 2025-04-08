import 'package:taza/taza.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          height: Get.height,
          width: Get.width,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0xFFFFFFFF),
          //       Color(0xFFFFBF9F),
          //     ],
          //   ),
          // ),
          child: Center(
            child: Text("Splash")
          ),
        ),
      ),
    );
  }
}
