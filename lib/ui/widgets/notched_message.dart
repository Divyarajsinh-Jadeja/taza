import 'package:taza/taza.dart';

class NotchedMessageBubble extends StatelessWidget {
  final String message;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const NotchedMessageBubble({super.key, required this.message, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).notchedMsgStyle;
    return CustomPaint(
      painter: NotchPainter(),
      child: SmartColumn(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: style.notchedBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        children: [
          Text(
            message,
            style: style.notchedTextStyle,
          ),
        ],
      ),
    );
  }
}

class NotchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8FFF0)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(12, 0);
    path.lineTo(0, -12);
    path.lineTo(-12, 0);
    path.close();

    canvas.translate(24, 12);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
