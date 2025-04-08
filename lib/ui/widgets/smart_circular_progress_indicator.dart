import 'package:taza/taza.dart';

class SmartCircularProgressIndicator extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? size;
  final double strokeWidth;

  const SmartCircularProgressIndicator({
    super.key,
    this.padding,
    this.size,
    this.strokeWidth = 4,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = CircularProgressIndicator(
      color: AppTheme.of(context).colors.primary,
      strokeWidth: strokeWidth,
    );
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      padding: padding ?? EdgeInsets.all(16.w),
      child: child,
    );
  }
}
