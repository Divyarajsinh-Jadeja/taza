import 'package:taza/taza.dart';

class SmartColumn extends StatelessWidget {
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;
  final List<Widget> children;

  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? color;
  final GestureTapCallback? onTap;
  final bool isInkwell;
  final bool expanded;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignment;
  final Clip clipBehavior;

  const SmartColumn({
    super.key,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection = TextDirection.ltr,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline = TextBaseline.alphabetic,
    required this.children,
    this.padding,
    this.width,
    this.height,
    this.onTap,
    this.isInkwell = false,
    this.color,
    this.expanded = false,
    this.decoration,
    this.alignment,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      key: key,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children,
    );

    if (padding != null || width != null || height != null || color != null || decoration != null || alignment != null) {
      child = Container(
        width: width,
        height: height,
        padding: padding,
        color: color,
        decoration: decoration,
        alignment: alignment,
        clipBehavior: clipBehavior,
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
