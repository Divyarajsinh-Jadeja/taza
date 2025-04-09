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
        notchMargin: 12.w,
        elevation: 10.w,
        child: SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final iconColor = selectedIndex == index ? style.selectedIconColor : style.unselectedIconColor;
            final textColor = selectedIndex == index ? style.selectedLabelColor : style.unselectedLabelColor;
            return SmartColumn(
              expanded: true,
              onTap: () => onItemSelected(index),
              mainAxisSize: MainAxisSize.min,
              children: [
                index == 2 ? SizedBox(height: 32.h) : SmartImage(path: item.icon, color: iconColor, height: 32.h, width: 32.w),
                SizedBox(height: 4.h),
                SmartText(
                  item.label,
                  style: style.unselectedLabelStyle.merge(TextStyle(color: textColor)),
                  textAlign: item.textAlign,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
