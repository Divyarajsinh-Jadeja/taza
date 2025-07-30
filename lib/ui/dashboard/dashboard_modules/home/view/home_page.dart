import 'package:taza/taza.dart';
import 'package:taza/ui/dashboard/dashboard_modules/home/view/ai_chat_controller.dart';
import 'package:taza/ui/widgets/smart_scroll_listner.dart';

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
        body: SmartScrollListner(
          child: CustomScrollView(
            controller: controller.scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: HomeAddressHeader(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,),
                  userImagePath: "https://i.ibb.co/HLgDnFFQ/Group.png",
                  addressTypeTag: LocaleKeys.home.tr,
                  showSubscriptionIcon: true,
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
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.searchPage, arguments: AppConst.isFromHome);
                      },
                      child: SmartSearchBar(
                        isSearchWithPrefix: true,
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                        items: [controller.hints[controller.currentHintIndex.value]],
                        controller: controller.searchController.value,
                        onChanged: (val) {},
                        isEnabled: false,
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
                                size: 24.w,
                            ),
                          ],
                        ),
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
        /*floatingActionButton: FloatingActionButton(
          backgroundColor: loginStyle.continueButtonBgColor,
          onPressed: () {
            showAIChatSheet(context);
          },
          child: Icon(Icons.chat),
        ),*/
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

  void showAIChatSheet(BuildContext context) {
    final chatController = Get.put(AIChatController());
    final textController = TextEditingController();
    Utils.showSmartModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: SmartSingleChildScrollView(
            padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 16.w),
            child: SmartColumn(
              height: 600,
              mainAxisSize: MainAxisSize.min,
              children: [
                SmartText(
                  "AI Assistant",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Obx(() {
                  return chatController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SmartText(chatController.aiResponse.value);
                }),
                SizedBox(height: 16.h),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Ask me anything...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                SmartButton(
                  title: "Send",
                  onTap: () {
                    final msg = textController.text.trim();
                    if (msg.isNotEmpty) {
                      chatController.sendMessage(msg);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
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


