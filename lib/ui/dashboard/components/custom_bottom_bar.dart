import 'package:taza/taza.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, required this.selectedIndex, required this.items, required this.onItemSelected});

  final int selectedIndex;
  final List<BottomNavigationBarDataModel> items;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).tabBarStyle;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: style.unselectedLabelColor.withValues(alpha: 0.3), blurRadius: 12.r, offset: const Offset(0, -4))],
      ),
      child: BottomAppBar(
        color: style.backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircularNotchedRectangle(),
        notchMargin: 14.w,
        elevation: 4.w,
        child: SmartRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final iconColor = selectedIndex == index ? style.selectedIconColor : style.unselectedIconColor;
            final textColor = selectedIndex == index ? style.selectedLabelColor : style.unselectedLabelColor;
            return SmartColumn(
              expanded: true,
              onTap: () {
                HapticFeedback.lightImpact();
                onItemSelected(index);
              },
              mainAxisSize: MainAxisSize.min,
              children: [
                SmartImage(path: item.icon ?? "", color: iconColor, size: 25.w, fit: BoxFit.contain,),
                SizedBox(height: 4.h),
                Expanded(
                  child: SmartText(
                    item.label.tr,
                    style: style.unselectedLabelStyle.copyWith(color: textColor),
                    textAlign: item.textAlign,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
