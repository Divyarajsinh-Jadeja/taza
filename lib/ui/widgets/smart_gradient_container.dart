import 'package:taza/taza.dart';

class SmartGradientContainer extends StatelessWidget {
  const SmartGradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomAppBarStyle style = AppTheme.of(context).appBarStyle;
    return Container(
      height: 2.h,
      width: context.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.clamp,
          colors: [style.borderColor.withValues(alpha: 0), style.borderColor, style.borderColor.withValues(alpha: 0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
