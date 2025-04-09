import 'package:taza/taza.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).homeScreenStyle;
    var color = AppThemes().appColor;
    return Scaffold(
      body: SafeArea(
        child: SmartColumn(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          children: [
            SmartRow(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SmartColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmartRow(
                        children: [
                          SvgPicture.asset(AppImages.icHome),
                          SizedBox(width: 8.h),
                          SmartText(
                            LocaleKeys.home.tr,
                            style: style.addressTagTitleStyle,
                          ),
                          SizedBox(width: 6.h),
                          InkWell(
                              onTap: (){
                                showAddressBottomSheet(context);
                              }, child: SvgPicture.asset(AppImages.icArrowDropDown)),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      SmartText(
                          'Al Tadamun Al Arabi St., Mishfirah, Jeddah KSA',
                          style: style.addressTitleStyle)
                    ],
                  ),
                ),
                SvgPicture.asset(AppImages.icUser),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: color.colorD2D2D7),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SmartRow(
                children: [
                  // Placeholder text
                  Expanded(
                    child: SmartTextField(
                      hintText: "Search for ‘Tenders’",
                      hintStyle: style.searchBarHintStyle,
                      color: color.white,
                      autofocus: false,
                      enabledBorderRadius: 12.r,
                      customEnabledBorder: InputBorder.none,
                      customDisabledBorder: InputBorder.none,
                      enabledBorderColor: color.white,
                      disabledBorderColor: color.white,
                      customFocusedBorder: InputBorder.none,
                      borderRadius: BorderRadius.zero,
                      style: style.searchBarTextStyle,
                    ),
                  ),
                  SvgPicture.asset(AppImages.icSearch),
                  Container(
                    height: 21.h,
                    width: 1.w,
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                    color: color.colorD2D2D7,
                  ),
                  SvgPicture.asset(AppImages.icMic),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.options.length,
                itemBuilder: (context, index) {
                  final item = controller.options[index];
                  return Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: color.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(178, 189, 194, 0.25),
                                offset: Offset(0, 0),
                                blurRadius: 5.0,
                                spreadRadius: 5)
                          ]),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: 16.w, bottom: 16.w, start: 16.w, end: 8.w),
                        child: SmartRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left column
                            SmartColumn(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['title'], style: style.foodCardTitleStyle),
                                SizedBox(height: 2.h),
                                Text(item['subtitle'], style: style.foodCardSubTitleStyle),
                                SizedBox(height: 4.h),
                                Container(
                                  height: 30.h,
                                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [color.colorC6FFF8, color.white],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(item['tag'], style: style.foodCardTagStyle),
                                ),
                                SizedBox(height: 8.h),
                                item['time'] != null
                                    ? Container(
                                  height: 26.h,
                                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13.r),
                                    border: Border.all(color: color.primary),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(AppImages.icFlash),
                                      SizedBox(width: 4.w),
                                      SmartRichText(spans: [
                                        SmartTextSpan(
                                          text: item['time'],
                                          style: style.foodCardTimeStyle,
                                        ),
                                        SmartTextSpan(text: " "),
                                        SmartTextSpan(
                                          text: item['duration'],
                                          style: style.foodCardDurationStyle,
                                        ),
                                      ]),
                                    ],
                                  ),
                                )
                                    : SizedBox(height: 20.h),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            SmartImage(
                              width: 172.w,
                              height: 110.h,
                              path: item['image'],
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }

  void showAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SmartSingleChildScrollView(child: AddressBottomSheet()),
    );
  }
}



