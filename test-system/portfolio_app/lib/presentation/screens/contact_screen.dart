import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/common/neon_button.dart';
import '../widgets/common/typewriter_text.dart';

/// Contact/CTA screen with animated elements
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showContent = true);
    });
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.darkGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                vertical: 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Terminal icon
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.neonCyan.withAlpha(15),
                      border: Border.all(
                        color: AppColors.neonCyan.withAlpha(76),
                        width: 2,
                      ),
                      boxShadow: AppColors.neonGlow(
                        color: AppColors.neonCyan,
                        blurRadius: 40,
                        opacity: 0.3,
                      ),
                    ),
                    child: const Icon(
                      Icons.terminal,
                      size: 64,
                      color: AppColors.neonCyan,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .scale(
                        begin: const Offset(0.5, 0.5),
                        end: const Offset(1, 1),
                        duration: 500.ms,
                        curve: Curves.easeOutBack,
                      ),

                  const SizedBox(height: 40),

                  // Title with typewriter effect
                  TypewriterText(
                    text: 'INITIALIZE',
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: AppColors.neonCyan,
                      letterSpacing: 4,
                    ),
                    speed: const Duration(milliseconds: 80),
                    showCursor: false,
                  ).animate().fadeIn(delay: 300.ms, duration: 400.ms),

                  const SizedBox(height: 8),

                  // Subtitle with gradient
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColors.neonGradientHorizontal.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      'CONTACT PROTOCOL',
                      style: AppTextStyles.headlineMedium.copyWith(
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 600.ms, duration: 400.ms)
                      .slideY(begin: 0.2, end: 0, delay: 600.ms, duration: 400.ms),

                  const SizedBox(height: 16),

                  // Description
                  if (_showContent)
                    SizedBox(
                      width: isDesktop ? 500 : double.infinity,
                      child: Text(
                        "Let's build something incredible together. Whether you have a project in mind or just want to connect, I'd love to hear from you.",
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ).animate().fadeIn(duration: 400.ms),

                  const SizedBox(height: 48),

                  // Contact Links
                  if (_showContent)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isDesktop ? 600 : double.infinity,
                      ),
                      child: Column(
                        children: [
                          _AnimatedContactLink(
                            icon: Icons.email,
                            label: 'Email',
                            value: 'jason@jasonholtdigital.com',
                            color: AppColors.neonCyan,
                            delay: 0,
                            onTap: () => _launchUrl('mailto:jason@jasonholtdigital.com'),
                          ),
                          const SizedBox(height: 16),
                          _AnimatedContactLink(
                            icon: Icons.code,
                            label: 'GitHub',
                            value: 'github.com/jholt',
                            color: AppColors.neonPurple,
                            delay: 100,
                            onTap: () => _launchUrl('https://github.com/jholt'),
                          ),
                          const SizedBox(height: 16),
                          _AnimatedContactLink(
                            icon: Icons.work,
                            label: 'LinkedIn',
                            value: 'linkedin.com/in/jholt',
                            color: const Color(0xFF0A66C2),
                            delay: 200,
                            onTap: () => _launchUrl('https://linkedin.com/in/jholt'),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 48),

                  // CTA Buttons
                  if (_showContent)
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        PulsingNeonButton(
                          label: 'SEND MESSAGE',
                          icon: Icons.send,
                          onPressed: () => _launchUrl('mailto:jason@jasonholtdigital.com'),
                        ),
                        NeonButton(
                          label: 'DOWNLOAD CV',
                          icon: Icons.download,
                          onPressed: () {
                            // PDF download placeholder
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('CV download coming soon!'),
                                backgroundColor: AppColors.darkSurfaceElevated,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          isOutlined: true,
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(delay: 1200.ms, duration: 400.ms)
                        .slideY(begin: 0.2, end: 0, delay: 1200.ms, duration: 400.ms),

                  const SizedBox(height: 64),

                  // Status indicator
                  if (_showContent)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.neonCyan,
                            boxShadow: AppColors.neonGlow(
                              color: AppColors.neonCyan,
                              blurRadius: 10,
                              opacity: 0.5,
                            ),
                          ),
                        )
                            .animate(onPlay: (c) => c.repeat(reverse: true))
                            .scaleXY(
                              begin: 1,
                              end: 1.5,
                              duration: 1000.ms,
                            )
                            .then()
                            .scaleXY(
                              begin: 1.5,
                              end: 1,
                              duration: 1000.ms,
                            ),
                        const SizedBox(width: 12),
                        Text(
                          'AVAILABLE FOR NEW OPPORTUNITIES',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.neonCyan,
                            letterSpacing: 2,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(delay: 1500.ms, duration: 400.ms),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedContactLink extends StatefulWidget {
  const _AnimatedContactLink({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.delay,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final int delay;
  final VoidCallback onTap;

  @override
  State<_AnimatedContactLink> createState() => _AnimatedContactLinkState();
}

class _AnimatedContactLinkState extends State<_AnimatedContactLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: GlassCard(
            padding: const EdgeInsets.all(20),
            borderColor: _isHovered
                ? widget.color.withAlpha(127)
                : AppColors.glassBorder(),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: widget.color.withAlpha(_isHovered ? 50 : 25),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: _isHovered
                        ? AppColors.neonGlow(
                            color: widget.color,
                            blurRadius: 15,
                            opacity: 0.3,
                          )
                        : null,
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: AppTextStyles.titleSmall.copyWith(
                          color: _isHovered ? widget.color : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.value,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isHovered ? 1 : 0.5,
                  child: Icon(
                    Icons.arrow_forward,
                    color: widget.color,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 900 + widget.delay),
          duration: 400.ms,
        )
        .slideX(
          begin: 0.1,
          end: 0,
          delay: Duration(milliseconds: 900 + widget.delay),
          duration: 400.ms,
        );
  }
}
