import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Custom painter for timeline connector lines
class TimelineLinePainter extends CustomPainter {
  TimelineLinePainter({
    this.color = AppColors.neonCyan,
    this.opacity = 0.5,
    this.strokeWidth = 2,
    this.isFirst = false,
    this.isLast = false,
    this.nodeRadius = 8,
  });

  final Color color;
  final double opacity;
  final double strokeWidth;
  final bool isFirst;
  final bool isLast;
  final double nodeRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withAlpha((opacity * 255).toInt())
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final centerX = nodeRadius;
    final startY = isFirst ? nodeRadius : 0.0;
    final endY = isLast ? nodeRadius : size.height;

    // Draw vertical line
    canvas.drawLine(
      Offset(centerX, startY),
      Offset(centerX, endY),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant TimelineLinePainter oldDelegate) {
    return color != oldDelegate.color ||
        opacity != oldDelegate.opacity ||
        isFirst != oldDelegate.isFirst ||
        isLast != oldDelegate.isLast;
  }
}

/// Glowing timeline node painter
class TimelineNodePainter extends CustomPainter {
  TimelineNodePainter({
    this.color = AppColors.neonCyan,
    this.isCurrent = false,
    this.radius = 8,
  });

  final Color color;
  final bool isCurrent;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);

    // Outer glow
    if (isCurrent) {
      final glowPaint = Paint()
        ..color = color.withAlpha(76)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(center, radius + 4, glowPaint);
    }

    // Outer ring
    final ringPaint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, ringPaint);

    // Inner fill (only for current)
    if (isCurrent) {
      final fillPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, radius - 3, fillPaint);
    }
  }

  @override
  bool shouldRepaint(covariant TimelineNodePainter oldDelegate) {
    return color != oldDelegate.color ||
        isCurrent != oldDelegate.isCurrent ||
        radius != oldDelegate.radius;
  }
}

/// Timeline widget combining node and line
class TimelineIndicator extends StatelessWidget {
  const TimelineIndicator({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.isCurrent = false,
    this.color = AppColors.neonCyan,
    this.height = 100,
    this.nodeRadius = 8,
  });

  final bool isFirst;
  final bool isLast;
  final bool isCurrent;
  final Color color;
  final double height;
  final double nodeRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nodeRadius * 2,
      height: height,
      child: Stack(
        children: [
          // Line
          Positioned.fill(
            child: CustomPaint(
              painter: TimelineLinePainter(
                color: color,
                isFirst: isFirst,
                isLast: isLast,
                nodeRadius: nodeRadius,
              ),
            ),
          ),
          // Node at top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: nodeRadius * 2,
              height: nodeRadius * 2,
              child: CustomPaint(
                painter: TimelineNodePainter(
                  color: color,
                  isCurrent: isCurrent,
                  radius: nodeRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
