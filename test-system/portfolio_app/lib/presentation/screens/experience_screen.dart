import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/experience.dart';
import '../../providers/portfolio_provider.dart';
import '../widgets/common/glass_card.dart';

/// Experience timeline screen with animated entries
class ExperienceScreen extends ConsumerStatefulWidget {
  const ExperienceScreen({super.key});

  @override
  ConsumerState<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends ConsumerState<ExperienceScreen> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final experiences = ref.watch(experiencesProvider);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.darkGradient),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                            'EXPERIENCE',
                            style: AppTextStyles.headlineLarge.copyWith(
                              color: AppColors.neonCyan,
                              letterSpacing: 4,
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .slideX(begin: -0.1, end: 0, duration: 400.ms),
                      const SizedBox(height: 8),
                      Text(
                        'Professional journey & achievements',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                    ],
                  ),
                ),
              ),

              // Timeline
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final experience = experiences[index];
                    final isFirst = index == 0;
                    final isLast = index == experiences.length - 1;
                    final isExpanded = _expandedIndex == index;

                    return _TimelineEntry(
                          experience: experience,
                          isFirst: isFirst,
                          isLast: isLast,
                          isExpanded: isExpanded,
                          onTap: () {
                            setState(() {
                              _expandedIndex = isExpanded ? null : index;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(
                          delay: Duration(milliseconds: 300 + (index * 150)),
                          duration: 500.ms,
                        )
                        .slideX(
                          begin: -0.05,
                          end: 0,
                          delay: Duration(milliseconds: 300 + (index * 150)),
                          duration: 500.ms,
                        );
                  }, childCount: experiences.length),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 48)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.experience,
    required this.isFirst,
    required this.isLast,
    required this.isExpanded,
    required this.onTap,
  });

  final Experience experience;
  final bool isFirst;
  final bool isLast;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator - fixed width column with node and line
        SizedBox(
          width: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Node
              _TimelineNode(isCurrent: experience.isCurrent),
              // Line - use AnimatedContainer to grow with content
              if (!isLast)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 2,
                  height: isExpanded ? 400 : 150,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.neonCyan.withAlpha(127),
                        AppColors.neonCyan.withAlpha(51),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Content card
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: GlassCard(
                  padding: const EdgeInsets.all(20),
                  borderColor: isExpanded
                      ? AppColors.neonCyan.withAlpha(127)
                      : experience.isCurrent
                      ? AppColors.neonCyan.withAlpha(76)
                      : null,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  experience.role,
                                  style: AppTextStyles.titleMedium.copyWith(
                                    color: isExpanded || experience.isCurrent
                                        ? AppColors.neonCyan
                                        : null,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  experience.company,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.neonPurple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (experience.isCurrent)
                            Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.neonCyan.withAlpha(25),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.neonCyan.withAlpha(127),
                                    ),
                                  ),
                                  child: Text(
                                    'CURRENT',
                                    style: AppTextStyles.badge.copyWith(
                                      color: AppColors.neonCyan,
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                                .animate(onPlay: (c) => c.repeat(reverse: true))
                                .scaleXY(
                                  begin: 1,
                                  end: 1.05,
                                  duration: 2000.ms,
                                ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Location & Date
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            experience.location,
                            style: AppTextStyles.labelSmall,
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            experience.dateRange,
                            style: AppTextStyles.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Description
                      Text(
                        experience.description,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      // Expandable content
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: _buildExpandedContent(),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300),
                      ),
                      // Achievements preview (when not expanded)
                      if (!isExpanded && experience.achievements.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: experience.achievements.take(2).map((a) {
                              return _AchievementBadge(text: a);
                            }).toList(),
                          ),
                        ),
                      // Expand indicator
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            isExpanded ? 'COLLAPSE' : 'EXPAND',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.textMuted,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(width: 4),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              Icons.expand_more,
                              size: 16,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        // Responsibilities
        if (experience.responsibilities.isNotEmpty) ...[
          Text(
            'RESPONSIBILITIES',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          ...experience.responsibilities.map((resp) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.neonCyan.withAlpha(127),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      resp,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
        // Achievements
        if (experience.achievements.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(
            'KEY ACHIEVEMENTS',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: experience.achievements.map((a) {
              return _AchievementBadge(text: a, showIcon: true);
            }).toList(),
          ),
        ],
      ],
    );
  }
}

class _TimelineNode extends StatelessWidget {
  const _TimelineNode({required this.isCurrent});

  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrent ? AppColors.neonCyan : AppColors.darkSurfaceElevated,
        border: Border.all(color: AppColors.neonCyan, width: 2),
        boxShadow: isCurrent
            ? AppColors.neonGlow(
                color: AppColors.neonCyan,
                blurRadius: 12,
                opacity: 0.5,
              )
            : null,
      ),
      child: isCurrent
          ? Center(
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.deepSpaceBlack,
                ),
              ),
            )
          : null,
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  const _AchievementBadge({required this.text, this.showIcon = false});

  final String text;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.neonCyan.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neonCyan.withAlpha(51)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(Icons.emoji_events, size: 14, color: AppColors.neonCyan),
            const SizedBox(width: 6),
          ],
          Flexible(
            child: Text(
              text,
              style: AppTextStyles.badge.copyWith(
                color: AppColors.accentCyan,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
