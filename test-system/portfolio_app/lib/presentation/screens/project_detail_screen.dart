import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/portfolio_provider.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/common/neon_button.dart';
import '../widgets/common/tech_badge.dart';

/// Project detail screen with full info and animations
class ProjectDetailScreen extends ConsumerWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final String projectId;

  Future<void> _launchUrl(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    final project = projects.firstWhere(
      (p) => p.id == projectId,
      orElse: () => projects.first,
    );

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.darkGradient,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Custom App Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.darkSurfaceElevated,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.glassBorder()),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.textPrimary,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'PROJECT DETAILS',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.textMuted,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      if (project.rating != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.neonCyan.withAlpha(25),
                            borderRadius: BorderRadius.circular(16),
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
                                project.rating!.toString(),
                                style: AppTextStyles.badge.copyWith(
                                  color: AppColors.neonCyan,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ).animate().fadeIn(duration: 300.ms),
              ),

              // Project Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                    vertical: 24,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project icon
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.neonCyan.withAlpha(25),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: AppColors.neonGlow(
                            color: AppColors.neonCyan,
                            blurRadius: 20,
                            opacity: 0.2,
                          ),
                        ),
                        child: Icon(
                          _getProjectIcon(project.category),
                          color: AppColors.neonCyan,
                          size: 40,
                        ),
                      )
                          .animate()
                          .fadeIn(delay: 200.ms, duration: 400.ms)
                          .scale(
                            begin: const Offset(0.8, 0.8),
                            end: const Offset(1, 1),
                            delay: 200.ms,
                            duration: 400.ms,
                          ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              style: AppTextStyles.headlineLarge.copyWith(
                                color: AppColors.neonCyan,
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 300.ms, duration: 400.ms)
                                .slideX(begin: 0.1, end: 0, delay: 300.ms, duration: 400.ms),
                            const SizedBox(height: 8),
                            Text(
                              project.category,
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.neonPurple,
                              ),
                            ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Description Card
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                  ),
                  child: GlassCard(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OVERVIEW',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textMuted,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          project.description,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 500.ms, duration: 400.ms)
                      .slideY(begin: 0.1, end: 0, delay: 500.ms, duration: 400.ms),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // Stats Grid
              if (project.stats != null && project.stats!.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KEY METRICS',
                          style: AppTextStyles.titleMedium.copyWith(
                            color: AppColors.textSecondary,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: project.stats!.entries.map((entry) {
                            return _AnimatedStatCard(
                              label: entry.key,
                              value: _formatStatValue(entry.value),
                              index: project.stats!.keys.toList().indexOf(entry.key),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              // Tech Stack
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TECH STACK',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.textSecondary,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: project.techStack.asMap().entries.map((entry) {
                          return TechBadge(label: entry.value)
                              .animate()
                              .fadeIn(
                                delay: Duration(milliseconds: 700 + (entry.key * 50)),
                                duration: 300.ms,
                              )
                              .slideX(
                                begin: 0.2,
                                end: 0,
                                delay: Duration(milliseconds: 700 + (entry.key * 50)),
                                duration: 300.ms,
                              );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              // Achievements
              if (project.achievements != null && project.achievements!.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                    ),
                    child: GlassCard(
                      padding: const EdgeInsets.all(24),
                      borderColor: AppColors.neonPurple.withAlpha(76),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.emoji_events,
                                color: AppColors.neonPurple,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'KEY ACHIEVEMENTS',
                                style: AppTextStyles.titleMedium.copyWith(
                                  color: AppColors.neonPurple,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ...project.achievements!.asMap().entries.map((entry) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: AppColors.neonCyan.withAlpha(25),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: AppColors.neonCyan,
                                      size: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      entry.value,
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                .animate()
                                .fadeIn(
                                  delay: Duration(milliseconds: 900 + (entry.key * 100)),
                                  duration: 400.ms,
                                )
                                .slideX(
                                  begin: 0.1,
                                  end: 0,
                                  delay: Duration(milliseconds: 900 + (entry.key * 100)),
                                  duration: 400.ms,
                                );
                          }),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 800.ms, duration: 400.ms)
                        .slideY(begin: 0.1, end: 0, delay: 800.ms, duration: 400.ms),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              // Action Buttons
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                  ),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      if (project.externalLink != null)
                        NeonButton(
                          label: 'VIEW PROJECT',
                          icon: Icons.launch,
                          onPressed: () => _launchUrl(project.externalLink),
                        ),
                    ],
                  )
                      .animate()
                      .fadeIn(delay: 1100.ms, duration: 400.ms)
                      .slideY(begin: 0.2, end: 0, delay: 1100.ms, duration: 400.ms),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 48)),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getProjectIcon(String category) {
    switch (category) {
      case 'Mobile':
        return Icons.phone_android;
      case 'EdTech':
        return Icons.school;
      case 'Tool':
        return Icons.build;
      default:
        return Icons.code;
    }
  }

  String _formatStatValue(dynamic value) {
    if (value is double) {
      return '${(value * 100).toInt()}%';
    }
    return value.toString();
  }
}

class _AnimatedStatCard extends StatelessWidget {
  const _AnimatedStatCard({
    required this.label,
    required this.value,
    required this.index,
  });

  final String label;
  final String value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.stat.copyWith(
              fontSize: 28,
              color: AppColors.neonCyan,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textMuted,
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 600 + (index * 100)),
          duration: 400.ms,
        )
        .slideY(
          begin: 0.2,
          end: 0,
          delay: Duration(milliseconds: 600 + (index * 100)),
          duration: 400.ms,
        );
  }
}
