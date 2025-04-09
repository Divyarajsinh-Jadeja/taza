import 'package:taza/imports.dart';

class SmartCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const SmartCategoryCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Split title on the first space
    final parts = title.split(' ');
    final line1 = parts.first;
    final line2 = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    return Container(
      width: 90.h,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 6.w),
      padding: EdgeInsetsDirectional.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          SmartText(line1, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
          SmartText(line2, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
          SizedBox(height: 6.h),
          Expanded(child: SmartImage(path: imagePath, fit: BoxFit.contain)),
        ],
      ),
    );
  }
}
