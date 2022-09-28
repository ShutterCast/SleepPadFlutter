import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnakeButton extends StatefulWidget {
  const SnakeButton({Key? key}) : super(key: key);

  @override
  State<SnakeButton> createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: CustomPaint(
            painter: SnakePainter(animation: _controller),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/indicator_image.png",
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SnakePainter extends CustomPainter {
  final Animation animation;

  SnakePainter({
    required this.animation,
  }) : super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..color = Colors.black
      ..shader = SweepGradient(
          colors: const [
            Colors.purple,
            Colors.transparent,
          ],
          stops: const [
            0.7,
            1.0
          ],
          startAngle: 0.0,
          endAngle: vector.radians(180),
          transform: GradientRotation(
            vector.radians((360 * animation.value).toDouble()),
          )).createShader(rect);

    final path = Path.combine(
      PathOperation.xor,
      Path()..addRect(rect),
      Path()
        ..addRect(
          rect.deflate(6.0),
        ),
    );
    // path.addRect(rect);

    canvas.drawRect(
      rect.deflate(3.0),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 6.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
