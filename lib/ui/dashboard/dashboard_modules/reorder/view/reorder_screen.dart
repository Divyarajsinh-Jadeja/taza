import 'package:taza/taza.dart';

class ReorderScreen extends GetView<ReorderController> {
  const ReorderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(title: "Reorder"),
      body: SizedBox(
        height: Get.height,
        child: Obx(() {
          return SmartColumn(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 20.r,top: 16.r,bottom: 16.r),
                height: 32.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SmartSwitch(
                      value: controller.isVeg.value,
                      onToggle: controller.toggleVeg,
                      activeColor: Colors.green,
                      activeIcon: SmartImage(path: AppImages.icVeg),
                      inactiveIcon: SmartImage(path: AppImages.icVeg),
                    ),
                    8.width,
                    SmartSwitch(
                      value: controller.isNonVeg.value,
                      onToggle: controller.toggleNonVeg,
                      activeColor: Colors.red,
                      activeIcon: SmartImage(path: AppImages.icNonVeg),
                      inactiveIcon: SmartImage(path: AppImages.icNonVeg),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,),
                  children: [
                    FoodCard(),
                    16.height,
                    FoodCard(),
                    16.height,
                    FoodCard(),
                    16.height,
                    FoodCard(),
                    16.height,
                    FoodCard(),
                    16.height,FoodCard(),
                    16.height,FoodCard(),
                    16.height,
                    FoodCard(),
                    16.height,FoodCard(),
                    16.height,




                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}


