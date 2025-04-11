import 'package:taza/taza.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).searchBarStyle;
    return Scaffold(
      body: SafeArea(
        child: SmartColumn(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          children: [
            HomeAddressHeader(
                onAddressTap: () {
                  showAddressBottomSheet(context, controller.addresses);
                },
                addressTypeTag: LocaleKeys.home.tr,
                address: "Al Tadamun Al Arabi St., Mishfirah, Jeddah KSA"),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Obx((){
                return SmartSearchBar(
                  items: [controller.hints[controller.currentHintIndex.value]],
                  controller: controller.searchController,
                  onChanged: (val){},
                  suffixIcon: SmartRow(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        SmartImage(path : AppImages.icSearch, height: 24.h, width: 24.w),
                        Container(
                          height: 21.h,
                          width: 1.w,
                          margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                          color: style.searchBarBorderColor,
                        ),
                        SmartImage(path : AppImages.icMic, width: 24.w, height: 24.h,),
                      ]),
                );
              }),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
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
              )
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
      builder:
          (context) => SmartSingleChildScrollView(child: AddressBottomSheet(addresses: addresses,)),
    );
  }
}
