import 'package:taza/taza.dart';

class FullScreenImagePage extends StatefulWidget {
  const FullScreenImagePage({super.key});

  @override
  State<FullScreenImagePage> createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  late PageController _pageController;
  late int _currentIndex;
  late InstamartProductModel model;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    model = args['model'];
    _currentIndex = args['initialIndex'];
    _pageController = PageController(initialPage:_currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final loginStyle = AppTheme.of(context).loginPageStyle;
    return Scaffold(
      backgroundColor: loginStyle.loginPageBgColor,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: 3,
            pageController: _pageController,
            backgroundDecoration: BoxDecoration(
              color: loginStyle.loginPageBgColor,
            ),
            onPageChanged: (index) => setState(() => _currentIndex = index),
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(model.imageUrl),
                heroAttributes: PhotoViewHeroAttributes(tag: 'product-image-$index'),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2.5,
              );
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: SmartImage(
              size: 22.w,
              path: AppImages.icArrowLeft,
              onTap: () => Get.back(),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 80.w,
              width: 80.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SmartImage(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index ? loginStyle.continueButtonBgColor : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    path : model.imageUrl,
                    height: 60.h,
                    width: 80.w,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
