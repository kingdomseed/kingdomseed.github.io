import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../widgets/common/typewriter_text.dart';
import '../widgets/custom_painters/holographic_ring_painter.dart';

/// Splash screen with animated loading sequence
/// Animation Timeline:
/// 0.0-0.5s: Fade in gradient background
/// 0.3-1.0s: Holographic ring rotation
/// 0.5-1.5s: Typewriter text decode
/// 1.5-2.0s: Progress indicator
/// 2.0-2.5s: Fade out → navigate to /home
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  bool _showText = false;
  bool _showProgress = false;
  bool _textComplete = false;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _startAnimationSequence();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  void _startAnimationSequence() async {
    // Wait for ring to start
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => _showText = true);

    // Wait for text animation
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() => _showProgress = true);
    _progressController.forward();

    // Wait for progress then navigate
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    _navigateToHome();
  }

  void _navigateToHome() {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.darkGradient,
        ),
        child: Stack(
          children: [
            // Grid background
            Positioned.fill(
              child: CustomPaint(
                painter: _GridBackgroundPainter(),
              ),
            )
                .animate()
                .fadeIn(duration: 500.ms, curve: Curves.easeOut),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Holographic ring
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const HolographicRing(
                          size: 150,
                          duration: Duration(seconds: 2),
                        ),
                        // Terminal icon in center
                        Icon(
                          Icons.terminal,
                          size: 48,
                          color: AppColors.neonCyan,
                        )
                            .animate()
                            .fadeIn(delay: 300.ms, duration: 400.ms)
                            .scale(
                              begin: const Offset(0.5, 0.5),
                              end: const Offset(1, 1),
                              delay: 300.ms,
                              duration: 400.ms,
                              curve: Curves.easeOutBack,
                            ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 500.ms)
                      .scale(
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1, 1),
                        delay: 300.ms,
                        duration: 500.ms,
                      ),

                  const SizedBox(height: 40),

                  // MCP-2099 title with decode effect
                  if (_showText)
                    DecodeText(
                      text: 'MCP-2099',
                      style: AppTextStyles.displayMedium.copyWith(
                        color: AppColors.neonCyan,
                        letterSpacing: 4,
                      ),
                      decodeSpeed: const Duration(milliseconds: 30),
                      revealDelay: const Duration(milliseconds: 80),
                      onComplete: () {
                        if (mounted) {
                          setState(() => _textComplete = true);
                        }
                      },
                    ).animate().fadeIn(duration: 200.ms),

                  const SizedBox(height: 12),

                  // Subtitle with typewriter
                  if (_showText && _textComplete)
                    TypewriterText(
                      text: 'PORTFOLIO SYSTEM',
                      style: AppTextStyles.terminal.copyWith(
                        color: AppColors.textSecondary,
                        letterSpacing: 2,
                      ),
                      speed: const Duration(milliseconds: 40),
                      showCursor: true,
                    ).animate().fadeIn(duration: 200.ms),

                  const SizedBox(height: 48),

                  // Progress indicator
                  if (_showProgress)
                    SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: _progressController,
                            builder: (context, child) {
                              return LinearProgressIndicator(
                                value: _progressController.value,
                                backgroundColor: AppColors.darkSurface,
                                valueColor: const AlwaysStoppedAnimation(
                                  AppColors.neonCyan,
                                ),
                                minHeight: 2,
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'INITIALIZING...',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.textMuted,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 300.ms,
                          curve: Curves.easeOut,
                        ),
                ],
              ),
            ),

            // Version number
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'v1.0.0',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 1500.ms, duration: 300.ms),
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple grid background for splash
class _GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.neonCyan.withAlpha(20)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    const gridSize = 50.0;

    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
