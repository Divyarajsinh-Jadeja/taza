import 'package:taza/taza.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).searchBarStyle;
    final loginStyle = AppTheme.of(context).loginPageStyle;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar : true,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            controller: controller.scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: HomeAddressHeader(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 10.h),
                  userImagePath: "https://i.ibb.co/HLgDnFFQ/Group.png",
                  addressTypeTag: LocaleKeys.home.tr,
                  address: "1600 Amphitheatre, Mountain View",
                ),
              ),
              PinnedHeaderSliver(
                child: Container(
                  color: loginStyle.loginPageBgColor,
                  height: 10.h,
                ),
              ),
              PinnedHeaderSliver(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Obx(() {
                    return SmartSearchBar(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                      items: [controller.hints[controller.currentHintIndex.value]],
                      controller: controller.searchController.value,
                      onChanged: (val) {},
                      suffixIcon: SmartRow(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 21.h,
                            width: 1.w,
                            margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                            color: style.searchBarBorderColor,
                          ),
                          SmartImage(
                            onTap: (){
                              controller.openMic();
                              showMicListeningSheet(context, loginStyle);
                            },
                              path: AppImages.icMic,
                              width: 24.w, height: 24.h
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SliverToBoxAdapter(
                child: SmartColumn(children: [
                  SizedBox(height: 16.h),
                  SmartColumn(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: SmartImage(
                            onTap: (){
                              Get.find<DashboardController>().changeTab(1);
                            },
                            path: AppImages.imgFoodGif,
                            height: 180,
                            width: Get.width,
                            fit: BoxFit.cover, // Optional: ensures image fills bounds
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                                  if(index == 0){
                                    Get.find<DashboardController>().changeTab(1);
                                  }
                                  if(index == 1){
                                    Get.find<DashboardController>().changeTab(2);
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
                      SizedBox(height: 20.h,),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: SmartImage(
                            onTap: (){
                              Get.find<DashboardController>().changeTab(1);
                            },
                            path: "https://i.ibb.co/XxX5QXtZ/Delicious-Food-Menu-Banner-Design.png",
                            height: 160,
                            width: Get.width,
                            fit: BoxFit.fill, // Optional: ensures image fills bounds
                          ),
                        ),
                      ),
                      SizedBox(height: 26.h,),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SmartText("Take\na Bite!",
                          optionalPadding: EdgeInsetsDirectional.only(start: 16.w),
                          style: style.searchBarHintStyle.copyWith(fontSize: 60, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ]),
              )
            ],
          ),
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

  void showMicListeningSheet(BuildContext context, LoginPageStyle loginStyle) {
    Utils.showSmartModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        controller.closeMic();
        return SmartColumn(
          width: Get.width,
          height: 280.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmartImage(
              path: AppImages.imgAnimatedMic,
              size: 110.w,
            ),
            Obx((){
              return SmartText(controller.spokenText.value,style: loginStyle.tagTextStyle,);
            })
          ],
        );
      },
    );
  }

}
