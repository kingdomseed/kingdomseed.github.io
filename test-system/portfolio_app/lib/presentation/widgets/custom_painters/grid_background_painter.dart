import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Futuristic grid background with perspective effect
class GridBackgroundPainter extends CustomPainter {
  GridBackgroundPainter({
    this.color = AppColors.neonCyan,
    this.opacity = 0.15,
    this.gridSize = 40,
    this.perspective = 0.3,
    this.scrollOffset = 0,
  });

  final Color color;
  final double opacity;
  final double gridSize;
  final double perspective;
  final double scrollOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withAlpha((opacity * 255).toInt())
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2;
    final horizonY = size.height * 0.3;

    // Horizontal lines with perspective
    for (double y = horizonY; y <= size.height; y += gridSize) {
      final t = (y - horizonY) / (size.height - horizonY);
      final alpha = (opacity * t * 255).toInt();
      paint.color = color.withAlpha(alpha);

      final width = size.width * (0.2 + 0.8 * t);
      final startX = centerX - width / 2;
      final endX = centerX + width / 2;

      canvas.drawLine(
        Offset(startX, y + (scrollOffset * perspective * t)),
        Offset(endX, y + (scrollOffset * perspective * t)),
        paint,
      );
    }

    // Vertical lines converging to horizon
    const lineCount = 15;
    for (int i = -lineCount; i <= lineCount; i++) {
      final startX = centerX + i * (size.width / lineCount);
      final endX = centerX + i * (size.width / (lineCount * 5));

      final t = (i.abs() / lineCount);
      final alpha = ((opacity * (1 - t * 0.5)) * 255).toInt();
      paint.color = color.withAlpha(alpha);

      canvas.drawLine(
        Offset(startX, size.height),
        Offset(endX, horizonY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant GridBackgroundPainter oldDelegate) {
    return color != oldDelegate.color ||
        opacity != oldDelegate.opacity ||
        gridSize != oldDelegate.gridSize ||
        scrollOffset != oldDelegate.scrollOffset;
  }
}

/// Simple flat grid painter
class FlatGridPainter extends CustomPainter {
  FlatGridPainter({
    this.color = AppColors.neonCyan,
    this.opacity = 0.1,
    this.gridSize = 40,
  });

  final Color color;
  final double opacity;
  final double gridSize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withAlpha((opacity * 255).toInt())
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Draw vertical lines
    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlatGridPainter oldDelegate) {
    return color != oldDelegate.color ||
           opacity != oldDelegate.opacity ||
           gridSize != oldDelegate.gridSize;
  }
}

/// Animated grid background widget
class AnimatedGridBackground extends StatefulWidget {
  const AnimatedGridBackground({
    super.key,
    this.child,
    this.color = AppColors.neonCyan,
    this.usePerspective = true,
  });

  final Widget? child;
  final Color color;
  final bool usePerspective;

  @override
  State<AnimatedGridBackground> createState() => _AnimatedGridBackgroundState();
}

class _AnimatedGridBackgroundState extends State<AnimatedGridBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      setState(() {
        _scrollOffset = _controller.value * 80;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: widget.usePerspective
          ? GridBackgroundPainter(
              color: widget.color,
              scrollOffset: _scrollOffset,
            )
          : FlatGridPainter(color: widget.color),
      child: widget.child,
    );
  }
}
