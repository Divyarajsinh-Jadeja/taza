import 'package:taza/taza.dart';

class SmartTextSpan {
  final String? text;
  final TextStyle? style;
  final VoidCallback? onTap;
  final InlineSpanType type;
  final Widget? widget;

  SmartTextSpan({
    this.text,
    this.style,
    this.onTap,
    this.type = InlineSpanType.text,
    this.widget,
  });
}

class SmartRichText extends StatelessWidget {
  final List<SmartTextSpan> spans;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  const SmartRichText({
    super.key,
    required this.spans,
    this.textAlign = TextAlign.start,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).smartRichTextStyle;
    List<InlineSpan> textSpans = spans.map((span) {
      switch (span.type) {
        case InlineSpanType.text:
          return TextSpan(
            text: span.text,
            style: style.textStyle.merge(span.style),
            recognizer: span.onTap != null ? (TapGestureRecognizer()..onTap = span.onTap) : null,
          );
        case InlineSpanType.widget:
          return WidgetSpan(child: span.widget ?? SizedBox.shrink());
      }
    }).toList();
    Widget child = RichText(
      text: TextSpan(
        style: style.textStyle.merge(textStyle),
        children: textSpans,
      ),
      textAlign: textAlign,
    );
    return padding != null
        ? Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          )
        : child;
  }
}
