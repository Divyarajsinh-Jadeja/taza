import 'package:taza/taza.dart';

class NotchedMessageBubble extends StatelessWidget {
  final String message;

  const NotchedMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NotchPainter(),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFE8FFF0), // soft green
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Color(0xFF34A853), fontSize: 12),
        ),
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
