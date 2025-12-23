import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../widgets/common/neon_button.dart';
import '../widgets/common/tech_badge.dart';
import '../widgets/common/typewriter_text.dart';
import '../widgets/custom_painters/grid_background_painter.dart';

/// Home/Hero screen with animated intro
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;
  bool _showSubtitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Delay subtitle to sync with typewriter
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _showSubtitle = true);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isDesktop = screenSize.width >= 1024;
    final isTablet = screenSize.width >= 600;

    return Scaffold(
      body: Stack(
        children: [
          // Animated grid background with parallax
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(0, _scrollOffset * 0.3),
              child: AnimatedGridBackground(
                color: AppColors.neonCyan,
                usePerspective: true,
              ),
            ),
          ),

          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.deepSpaceBlack.withAlpha(200),
                    AppColors.deepSpaceBlack.withAlpha(240),
                    AppColors.deepSpaceBlack,
                  ],
                ),
              ),
            ),
          ),

          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero section
                SizedBox(
                  height: screenSize.height,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: isDesktop
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          const Spacer(flex: 2),

                          // Name with gradient
                          _buildGradientText(
                            'JASON HOLT',
                            AppTextStyles.displayLarge.copyWith(
                              fontSize: isDesktop ? 72 : (isTablet ? 56 : 42),
                              letterSpacing: 2,
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 600.ms)
                              .slideY(
                                begin: 0.3,
                                end: 0,
                                duration: 600.ms,
                                curve: Curves.easeOut,
                              ),

                          const SizedBox(height: 16),

                          // Typewriter tagline
                          TypewriterText(
                            text: 'Flutter Engineer. Cross-Platform Specialist.',
                            style: AppTextStyles.titleLarge.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: isDesktop ? 24 : (isTablet ? 20 : 16),
                            ),
                            speed: const Duration(milliseconds: 40),
                            showCursor: true,
                          ).animate().fadeIn(delay: 400.ms, duration: 400.ms),

                          const SizedBox(height: 32),

                          // Subtitle description
                          if (_showSubtitle)
                            SizedBox(
                              width: isDesktop ? 600 : double.infinity,
                              child: Text(
                                'Building exceptional cross-platform experiences with Flutter. '
                                'From mobile apps to desktop solutions, delivering performant, '
                                'beautiful applications across 5 platforms.',
                                style: AppTextStyles.bodyLarge.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                                textAlign:
                                    isDesktop ? TextAlign.left : TextAlign.center,
                              ),
                            )
                                .animate()
                                .fadeIn(duration: 500.ms)
                                .slideY(begin: 0.2, end: 0, duration: 500.ms),

                          const SizedBox(height: 48),

                          // Floating stat badges
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            alignment:
                                isDesktop ? WrapAlignment.start : WrapAlignment.center,
                            children: [
                              _buildStatBadge('5', 'Platforms', Icons.devices),
                              _buildStatBadge('4.8★', 'Rating', Icons.star),
                              _buildStatBadge('85%', 'Retention', Icons.trending_up),
                              _buildStatBadge('200+', 'Testers', Icons.group),
                            ]
                                .animate(interval: 100.ms)
                                .fadeIn(delay: 800.ms, duration: 400.ms)
                                .slideY(
                                  begin: 0.3,
                                  end: 0,
                                  delay: 800.ms,
                                  duration: 400.ms,
                                ),
                          ),

                          const SizedBox(height: 48),

                          // CTA Buttons
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            alignment:
                                isDesktop ? WrapAlignment.start : WrapAlignment.center,
                            children: [
                              NeonButton(
                                label: 'VIEW PROJECTS',
                                icon: Icons.work_outline,
                                onPressed: () => context.go('/projects'),
                              ),
                              NeonButton(
                                label: 'GET IN TOUCH',
                                icon: Icons.mail_outline,
                                onPressed: () => context.go('/contact'),
                                isOutlined: true,
                              ),
                            ],
                          )
                              .animate()
                              .fadeIn(delay: 1200.ms, duration: 400.ms)
                              .slideY(
                                begin: 0.2,
                                end: 0,
                                delay: 1200.ms,
                                duration: 400.ms,
                              ),

                          const Spacer(flex: 3),

                          // Scroll indicator
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'SCROLL TO EXPLORE',
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: AppColors.textMuted,
                                    letterSpacing: 2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.neonCyan,
                                  size: 24,
                                )
                                    .animate(
                                      onPlay: (c) => c.repeat(reverse: true),
                                    )
                                    .moveY(
                                      begin: 0,
                                      end: 8,
                                      duration: 1000.ms,
                                      curve: Curves.easeInOut,
                                    ),
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(delay: 2000.ms, duration: 500.ms),

                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ),

                // Quick preview section
                _buildQuickPreviewSection(context, isDesktop, isTablet),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientText(String text, TextStyle style) {
    return ShaderMask(
      shaderCallback: (bounds) => AppColors.neonGradientHorizontal.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildStatBadge(String value, String label, IconData icon) {
    return FloatingBadge(
      value: value,
      label: label,
      icon: icon,
    );
  }

  Widget _buildQuickPreviewSection(
    BuildContext context,
    bool isDesktop,
    bool isTablet,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
        vertical: 64,
      ),
      child: Column(
        children: [
          Text(
            'FEATURED WORK',
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.neonCyan,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 2,
            decoration: BoxDecoration(
              gradient: AppColors.neonGradientHorizontal,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(height: 48),

          // Featured project card
          _buildFeaturedProjectCard(context, isDesktop),
        ],
      ),
    );
  }

  Widget _buildFeaturedProjectCard(BuildContext context, bool isDesktop) {
    return GestureDetector(
      onTap: () => context.go('/projects/mythic-gme-2e'),
      child: Container(
        constraints: BoxConstraints(maxWidth: isDesktop ? 800 : double.infinity),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.darkSurfaceElevated,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.glassBorder()),
          boxShadow: AppColors.neonGlow(
            color: AppColors.neonCyan,
            blurRadius: 30,
            opacity: 0.15,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.neonCyan.withAlpha(25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.games,
                    color: AppColors.neonCyan,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mythic GME 2e',
                        style: AppTextStyles.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Cross-Platform Companion App',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.neonCyan.withAlpha(25),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.neonCyan.withAlpha(76),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.neonCyan,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '4.8',
                        style: AppTextStyles.badge.copyWith(
                          color: AppColors.neonCyan,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Official companion app for solo RPG game masters. Built with Flutter using '
              'MVVM architecture, deployed across iOS, Android, Windows, macOS, and Linux.',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['Flutter', 'Dart', 'Riverpod', 'Firebase', 'Sentry']
                  .map((tech) => TechBadge(label: tech))
                  .toList(),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildMiniStat('5', 'Platforms'),
                const SizedBox(width: 24),
                _buildMiniStat('85%', 'Retention'),
                const SizedBox(width: 24),
                _buildMiniStat('200+', 'Beta Testers'),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => context.go('/projects/mythic-gme-2e'),
                  icon: const Text('View Details'),
                  label: const Icon(Icons.arrow_forward, size: 16),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.neonCyan,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.1, end: 0, duration: 600.ms);
  }

  Widget _buildMiniStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.stat.copyWith(fontSize: 18),
        ),
        Text(
          label,
          style: AppTextStyles.labelSmall,
        ),
      ],
    );
  }
}
