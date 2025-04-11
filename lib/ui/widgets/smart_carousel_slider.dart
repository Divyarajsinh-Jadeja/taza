import 'package:taza/taza.dart';

class SmartCarouselSlider extends StatelessWidget {
  final List<String> imgList;
  final CarouselSliderController controller;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final Color? backgroundColor;
  final Function(int currentPage)? onTapFullImage;
  final bool showIndicatorImage;
  const SmartCarouselSlider({
    super.key,
    required this.imgList,
    required this.controller,
    this.onPageChanged,
    this.backgroundColor,
    this.onTapFullImage,
    this.showIndicatorImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final ImageCarouselStyle imageCarouselStyle = AppTheme.of(context).imageCarouselStyle;
    ValueNotifier<int> currentPage = ValueNotifier<int>(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (onTapFullImage != null) {
                  onTapFullImage?.call(currentPage.value);
                }
              },
              child: Container(
                color: backgroundColor,
                child: CarouselSlider(
                  items:
                      imgList.map((e) {
                        return SmartImage(path: e, fit: BoxFit.fill);
                      }).toList(),
                  carouselController: controller,
                  options: CarouselOptions(
                    autoPlay: imgList.length > 1,
                    enableInfiniteScroll: imgList.length > 1,
                    onPageChanged: (index, reason) {
                      currentPage.value = index;
                      onPageChanged?.call(index, reason);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        if (showIndicatorImage)
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: imgList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller.animateToPage(index),
                  child: ValueListenableBuilder<int>(
                    valueListenable: currentPage,
                    builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsetsDirectional.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
                        child: Center(
                          child: SmartImage(
                            path: imgList[index],
                            width: 44.0.w,
                            height: 44.0.w,
                            border: Border.all(
                              color: currentPage.value == index ? imageCarouselStyle.selectedDotColor : imageCarouselStyle.dotColor,
                              width: 1.6.w,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
