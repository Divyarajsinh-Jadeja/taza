// import 'package:taza/taza.dart';
//
// class FoodPage extends GetView<FoodController> {
//   const FoodPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.yellow,
//             // floating: false,
//             // pinned: false,
//             // snap: false,
//             flexibleSpace: FlexibleSpaceBar(
//               titlePadding: EdgeInsets.zero,
//               title: Padding(
//                 padding: EdgeInsets.only(bottom: 8.h),
//                 child: ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   title: SmartRow(
//                     children: [
//                       SmartImage(path: AppImages.icHome, height: 24.w, width: 24.w),
//                       SmartText(LocaleKeys.home.tr),
//                       SmartImage(path: AppImages.icArrowDown, height: 16.w, width: 16.w),
//                     ],
//                   ),
//                   subtitle: SmartText("Ai Tadamun Ai Arabi St., Mishfirah, Jeddah KSA", maxLines: 1, overflow: TextOverflow.ellipsis),
//                   trailing: CircleAvatar(child: SmartImage(path: AppImages.icFood)),
//                 ),
//               ),
//             ),
//           ),
//
//           // Pinned Search Bar
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: _SearchBarHeaderDelegate(
//               child: Container(
//                 color: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                 child: SmartTextField(hintText: "Search food or restaurant...", prefixIcon: Icon(Icons.search)),
//               ),
//             ),
//           ),
//
//           // Example: Dummy SliverList content
//         ],
//       ),
//     );
//   }
// }
//
// // Delegate class for pinned header
// class _SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;
//   final double _height;
//
//   _SearchBarHeaderDelegate({required this.child, double height = 80}) : _height = height;
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }
//
//   @override
//   double get maxExtent => _height;
//
//   @override
//   double get minExtent => _height;
//
//   @override
//   bool shouldRebuild(covariant _SearchBarHeaderDelegate oldDelegate) {
//     return oldDelegate.child != child || oldDelegate._height != _height;
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taza/taza.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.yellow,
            floating: false,
            pinned: false,
            snap: false,
            // expandedHeight: 100.h,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  title: SmartRow(
                    children: [
                      SmartImage(path: AppImages.icHome, height: 24.w, width: 24.w),
                      SmartText(LocaleKeys.home.tr),
                      SmartImage(path: AppImages.icArrowDown, height: 16.w, width: 16.w),
                    ],
                  ),
                  subtitle: SmartText("Ai Tadamun Ai Arabi St., Mishfirah, Jeddah KSA", maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: CircleAvatar(child: SmartImage(path: AppImages.icFood)),
                ),
              ),
            ),
          ),

          // ✅ Pinned Search Bar (Fixed Height + Delegate)
          SliverPersistentHeader(pinned: true, delegate: SearchBarHeaderDelegate()),

          // Dummy List Content
          SliverList(delegate: SliverChildBuilderDelegate(childCount: 20, (context, index) => ListTile(title: Text('Food Item $index')))),
        ],
      ),
    );
  }
}

// ✅ Proper Delegate Class
class SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 70.h;

  @override
  double get maxExtent => 70.h;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      alignment: Alignment.center,
      child: SmartTextField(hintText: "Search food or restaurant...", prefixIcon: Icon(Icons.search)),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
