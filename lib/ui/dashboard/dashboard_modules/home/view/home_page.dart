import 'package:taza/taza.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SmartColumn(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          children: [
            HomeAddressHeader(
                onAddressTap: () {
                  showAddressBottomSheet(context);
                },
                addressTypeTag: LocaleKeys.home.tr,
                address: "Al Tadamun Al Arabi St., Mishfirah, Jeddah KSA"),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Obx((){
                return CustomSearchBar(
                  items: [controller.hints[controller.currentHintIndex.value]],
                  controller: controller.searchController,
                  onChanged: (val){},
                  suffixIcon: SmartRow(
                      children: [
                        SmartImage(path : AppImages.icSearch),
                        Container(
                          height: 21.h,
                          width: 1.w,
                          margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                          color: AppThemes().appColor.colorD2D2D7,
                        ),
                        SmartImage(path : AppImages.icMic),
                      ]),
                );
              }),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.options.length,
                  itemBuilder: (context, index) {
                    final item = controller.options[index];
                    return Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            vertical: 8.0,
                          ),
                          child: FoodOptionCard(
                              onTap: (){},
                              title: item['title'],
                              subtitle: item['subtitle'],
                              tag: item['tag'],
                              time: item['time'],
                              duration: item['duration'],
                              image: item['image'],
                          ),
                        )
                        .animate()
                        .slideX(
                          begin: -1.0,
                          end: 0.0,
                          curve: Curves.easeOut,
                          duration: 500.ms,
                          delay: (index * 100).ms, // Stagger effect
                        )
                        .fadeIn();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAddressBottomSheet(BuildContext context) {
    Utils.showSmartModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => SmartSingleChildScrollView(child: AddressBottomSheet()),
    );
  }
}
