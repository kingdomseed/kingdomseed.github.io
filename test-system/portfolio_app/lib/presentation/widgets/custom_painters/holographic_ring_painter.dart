import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Holographic ring painter for splash screen
class HolographicRingPainter extends CustomPainter {
  HolographicRingPainter({
    required this.progress,
    this.color = AppColors.neonCyan,
    this.secondaryColor = AppColors.neonPurple,
    this.strokeWidth = 3,
    this.ringCount = 3,
  });

  final double progress;
  final Color color;
  final Color secondaryColor;
  final double strokeWidth;
  final int ringCount;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2 - strokeWidth;

    for (int i = 0; i < ringCount; i++) {
      final ringProgress = (progress + i / ringCount) % 1.0;
      final radius = maxRadius * (0.3 + 0.7 * (i / ringCount));
      final opacity = 0.3 + 0.7 * (1 - i / ringCount);

      // Interpolate color between primary and secondary
      final ringColor = Color.lerp(color, secondaryColor, i / ringCount)!;

      final paint = Paint()
        ..color = ringColor.withAlpha((opacity * 255).toInt())
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      // Draw arc that grows with progress
      final sweepAngle = 2 * math.pi * ringProgress;
      final startAngle = -math.pi / 2 + (i * math.pi / 4);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant HolographicRingPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}

/// Animated holographic ring widget
class HolographicRing extends StatefulWidget {
  const HolographicRing({
    super.key,
    this.size = 200,
    this.duration = const Duration(seconds: 2),
    this.color = AppColors.neonCyan,
    this.secondaryColor = AppColors.neonPurple,
    this.onComplete,
  });

  final double size;
  final Duration duration;
  final Color color;
  final Color secondaryColor;
  final VoidCallback? onComplete;

  @override
  State<HolographicRing> createState() => _HolographicRingState();
}

class _HolographicRingState extends State<HolographicRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: HolographicRingPainter(
            progress: _controller.value,
            color: widget.color,
            secondaryColor: widget.secondaryColor,
          ),
        );
      },
    );
  }
}

/// Pulsing ring effect
class PulsingRing extends StatefulWidget {
  const PulsingRing({
    super.key,
    this.size = 100,
    this.color = AppColors.neonCyan,
    this.minScale = 0.8,
    this.maxScale = 1.2,
  });

  final double size;
  final Color color;
  final double minScale;
  final double maxScale;

  @override
  State<PulsingRing> createState() => _PulsingRingState();
}

class _PulsingRingState extends State<PulsingRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.8,
      end: 0.3,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.color.withAlpha((_opacityAnimation.value * 255).toInt()),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withAlpha((_opacityAnimation.value * 0.5 * 255).toInt()),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
