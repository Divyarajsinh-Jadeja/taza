import 'package:taza/taza.dart';

class SmartRow extends StatelessWidget {
  final List<Widget> children;
  final TextBaseline? textBaseline;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;
  final bool isInkwell;
  final bool expanded;
  final Color? color;
  final Decoration? decoration;

  const SmartRow({
    super.key,
    this.textBaseline,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    required this.children,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.expanded = false,
    this.isInkwell = false,
    this.color,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      key: key,
      textBaseline: textBaseline,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children,
    );

    if (padding != null || width != null || height != null || color != null || decoration != null) {
      child = Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        color: color,
        decoration: decoration,
        child: child,
      );
    }

    if (onTap != null) {
      child = isInkwell ? InkWell(onTap: onTap, child: child) : GestureDetector(onTap: onTap, child: child);
    }
    if (expanded) {
      child = Expanded(child: child);
    }
    return child;
  }
}

