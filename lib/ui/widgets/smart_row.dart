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
  final Color? color;
  final Decoration? decoration;
  final double spacing;

  // Expansion
  final bool isExpanded;
  final bool isFlexible;
  final int flex;

  // Animation
  final SmartAnimator? animator;

  const SmartRow({
    super.key,
    required this.children,
    this.textBaseline,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.isInkwell = false,
    this.color,
    this.decoration,
    this.spacing = 0,
    this.isExpanded = false,
    this.isFlexible = false,
    this.flex = 1,
    this.animator,
  }) : assert(
         !(isExpanded && isFlexible),
         'isExpanded and isFlexible cannot be true at the same time',
       );

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      spacing: spacing,
      key: key,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children,
    );

    // Apply layout container
    if (padding != null ||
        width != null ||
        height != null ||
        color != null ||
        decoration != null) {
      child = Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: decoration ?? (color != null ? BoxDecoration(color: color) : null),
        child: child,
      );
    }

    // Gesture handling
    if (onTap != null) {
      child =
          isInkwell
              ? InkWell(onTap: onTap, child: child)
              : GestureDetector(onTap: onTap, child: child);
    }

    // Wrap in Expanded/Flexible if requested
    if (isExpanded) {
      child = Expanded(flex: flex, child: child);
    } else if (isFlexible) {
      child = Flexible(flex: flex, child: child);
    }

    // Apply animation
    if (animator != null) {
  return animator!.copyWith(child: child); 
} else {
  return child;
}
  }
}
