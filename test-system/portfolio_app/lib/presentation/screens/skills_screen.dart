import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/skill.dart';
import '../../providers/portfolio_provider.dart';
import '../widgets/common/glass_card.dart';

/// Skills dashboard with radar chart and bento grid
class SkillsScreen extends ConsumerStatefulWidget {
  const SkillsScreen({super.key});

  @override
  ConsumerState<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends ConsumerState<SkillsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _radarAnimationController;
  int? _expandedIndex;

  @override
  void initState() {
    super.initState();
    _radarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _radarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final skills = ref.watch(skillsProvider);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 600;

    final crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.darkGradient,
        ),
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
                        'SKILLS',
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
                        'Technical expertise & proficiency levels',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                    ],
                  ),
                ),
              ),

              // Radar Chart Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                  ),
                  child: _buildRadarChartSection(skills, isDesktop),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 48)),

              // Section Title
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                  ),
                  child: Text(
                    'DETAILED BREAKDOWN',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textSecondary,
                      letterSpacing: 2,
                    ),
                  ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // Skills Grid
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                ),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: _expandedIndex != null ? 0.9 : 1.2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _buildSkillCard(
                        skills[index],
                        index,
                        isExpanded: _expandedIndex == index,
                      )
                          .animate()
                          .fadeIn(
                            delay: Duration(milliseconds: 700 + (index * 100)),
                            duration: 400.ms,
                          )
                          .slideY(
                            begin: 0.2,
                            end: 0,
                            delay: Duration(milliseconds: 700 + (index * 100)),
                            duration: 400.ms,
                          );
                    },
                    childCount: skills.length,
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 48)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadarChartSection(List<Skill> skills, bool isDesktop) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'PROFICIENCY OVERVIEW',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: isDesktop ? 350 : 280,
            child: AnimatedBuilder(
              animation: _radarAnimationController,
              builder: (context, child) {
                return RadarChart(
                  RadarChartData(
                    radarShape: RadarShape.polygon,
                    tickCount: 4,
                    ticksTextStyle: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 10,
                    ),
                    tickBorderData: BorderSide(
                      color: AppColors.glassBorder(),
                      width: 1,
                    ),
                    gridBorderData: BorderSide(
                      color: AppColors.glassBorder(),
                      width: 1,
                    ),
                    titleTextStyle: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: isDesktop ? 12 : 10,
                    ),
                    titlePositionPercentageOffset: 0.15,
                    getTitle: (index, angle) {
                      if (index < skills.length) {
                        return RadarChartTitle(
                          text: skills[index].name.split('/').first,
                        );
                      }
                      return const RadarChartTitle(text: '');
                    },
                    dataSets: [
                      RadarDataSet(
                        fillColor: AppColors.neonCyan.withAlpha(51),
                        borderColor: AppColors.neonCyan,
                        borderWidth: 2,
                        entryRadius: 4,
                        dataEntries: skills.map((skill) {
                          final animatedValue = skill.proficiency *
                              _radarAnimationController.value;
                          return RadarEntry(value: animatedValue);
                        }).toList(),
                      ),
                    ],
                    radarBorderData: BorderSide(
                      color: AppColors.neonCyan.withAlpha(76),
                      width: 1,
                    ),
                  ),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic,
                );
              },
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 500.ms).scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          delay: 400.ms,
          duration: 500.ms,
        );
  }

  Widget _buildSkillCard(Skill skill, int index, {required bool isExpanded}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedIndex = isExpanded ? null : index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: GlassCard(
          padding: const EdgeInsets.all(20),
          borderColor: isExpanded
              ? AppColors.neonCyan.withAlpha(127)
              : AppColors.glassBorder(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      skill.name,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: isExpanded ? AppColors.neonCyan : null,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.neonCyan.withAlpha(25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${skill.proficiency.toInt()}%',
                      style: AppTextStyles.stat.copyWith(
                        fontSize: 14,
                        color: AppColors.neonCyan,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                skill.category,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 16),
              // Progress bar
              _buildAnimatedProgressBar(skill.proficiency, index),
              if (isExpanded) ...[
                const SizedBox(height: 20),
                Text(
                  'TECHNOLOGIES',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: skill.technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkSurfaceElevated,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.glassBorder()),
                      ),
                      child: Text(
                        tech,
                        style: AppTextStyles.badge.copyWith(
                          color: AppColors.accentCyan,
                          fontSize: 11,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ] else ...[
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'TAP TO EXPAND',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textMuted,
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.expand_more,
                      size: 14,
                      color: AppColors.textMuted,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedProgressBar(double value, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value / 100),
      duration: Duration(milliseconds: 800 + (index * 100)),
      curve: Curves.easeOutCubic,
      builder: (context, animatedValue, child) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: animatedValue,
                backgroundColor: AppColors.darkSurface,
                valueColor: AlwaysStoppedAnimation(
                  Color.lerp(
                    AppColors.neonPurple,
                    AppColors.neonCyan,
                    animatedValue,
                  ),
                ),
                minHeight: 6,
              ),
            ),
          ],
        );
      },
    );
  }
}
