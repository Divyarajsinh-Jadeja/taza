import 'package:taza/taza.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).searchBarStyle;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SmartColumn(
          children: [
            HomeAddressHeader(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 10.h),
              userImagePath: "https://i.ibb.co/HLgDnFFQ/Group.png",
              addressTypeTag: LocaleKeys.home.tr,
              address: "Al Tadamun Al Arabi St., Mishfirah, Jeddah KSA",
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Obx(() {
                return SmartSearchBar(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                  items: [controller.hints[controller.currentHintIndex.value]],
                  controller: controller.searchController,
                  onChanged: (val) {},
                  suffixIcon: SmartRow(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmartImage(path: AppImages.icSearch, height: 24.h, width: 24.w),
                      Container(
                        height: 21.h,
                        width: 1.w,
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                        color: style.searchBarBorderColor,
                      ),
                      SmartImage(path: AppImages.icMic, width: 24.w, height: 24.h),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                itemCount: controller.options.length,
                itemBuilder: (context, index) {
                  final item = controller.options[index];
                  return SmartAnimator(
                    animateSlideX: true,
                    slideXBegin: const Offset(-1.0, 0.0),
                    slideEnd: Offset.zero,
                    animateFadeIn: true,
                    animationDuration: const Duration(milliseconds: 500),
                    animationDelay: Duration(milliseconds: index * 100),
                    animationCurve: Curves.easeOut,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 8.0.h, end: 4.w),
                      child: FoodOptionCard(
                        onTap: () {
                          if(item["title"]=="Instamart"){
                            Get.find<DashboardController>().changeTab(1);
                          }
                        },
                        title: item['title'],
                        subtitle: item['subtitle'],
                        tag: item['tag'],
                        time: item['time'],
                        duration: item['duration'],
                        image: item['image'],
                      ),
                    ),
                  );
                }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.95,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAddressBottomSheet(BuildContext context, List<Map<String, dynamic>> addresses) {
    Utils.showSmartModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddressBottomSheet(addresses: addresses),
    );
  }
}
