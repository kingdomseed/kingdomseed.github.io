import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/project.dart';
import '../../providers/portfolio_provider.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/common/tech_badge.dart';

/// Projects portfolio with filter chips and cards
class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(filteredProjectsProvider);
    final categories = ref.watch(projectCategoriesProvider);
    final currentFilter = ref.watch(projectFilterProvider);

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
                        'PROJECTS',
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
                        'Featured work & applications',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                    ],
                  ),
                ),
              ),

              // Filter Chips
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories
                          .asMap()
                          .entries
                          .map((entry) {
                            final index = entry.key;
                            final category = entry.value;
                            final isSelected = category == currentFilter;
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: _FilterChipWidget(
                                label: category,
                                isSelected: isSelected,
                                onTap: () {
                                  ref
                                      .read(projectFilterProvider.notifier)
                                      .setFilter(category);
                                },
                              ),
                            )
                                .animate()
                                .fadeIn(
                                  delay: Duration(milliseconds: 300 + (index * 50)),
                                  duration: 300.ms,
                                )
                                .slideX(
                                  begin: 0.2,
                                  end: 0,
                                  delay: Duration(milliseconds: 300 + (index * 50)),
                                  duration: 300.ms,
                                );
                          })
                          .toList(),
                    ),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              // Projects Grid/List
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                ),
                sliver: isDesktop
                    ? _buildDesktopGrid(context, projects)
                    : _buildMobileList(context, projects),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 48)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopGrid(BuildContext context, List<Project> projects) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.3,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _ProjectCard(
            project: projects[index],
            onTap: () => context.go('/projects/${projects[index].id}'),
          )
              .animate()
              .fadeIn(
                delay: Duration(milliseconds: 400 + (index * 100)),
                duration: 400.ms,
              )
              .slideY(
                begin: 0.1,
                end: 0,
                delay: Duration(milliseconds: 400 + (index * 100)),
                duration: 400.ms,
              );
        },
        childCount: projects.length,
      ),
    );
  }

  Widget _buildMobileList(BuildContext context, List<Project> projects) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _ProjectCard(
              project: projects[index],
              onTap: () => context.go('/projects/${projects[index].id}'),
            )
                .animate()
                .fadeIn(
                  delay: Duration(milliseconds: 400 + (index * 100)),
                  duration: 400.ms,
                )
                .slideX(
                  begin: 0.1,
                  end: 0,
                  delay: Duration(milliseconds: 400 + (index * 100)),
                  duration: 400.ms,
                ),
          );
        },
        childCount: projects.length,
      ),
    );
  }
}

class _FilterChipWidget extends StatefulWidget {
  const _FilterChipWidget({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<_FilterChipWidget> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.neonCyan.withAlpha(25)
                : (_isHovered
                    ? AppColors.darkSurfaceElevated
                    : AppColors.darkSurface),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.neonCyan
                  : AppColors.glassBorder(),
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: widget.isSelected
                ? AppColors.neonGlow(
                    color: AppColors.neonCyan,
                    blurRadius: 15,
                    opacity: 0.2,
                  )
                : null,
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.labelMedium.copyWith(
              color: widget.isSelected
                  ? AppColors.neonCyan
                  : AppColors.textSecondary,
              fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.project,
    required this.onTap,
  });

  final Project project;
  final VoidCallback onTap;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..setEntry(0, 0, _isHovered ? 1.02 : 1.0)..setEntry(1, 1, _isHovered ? 1.02 : 1.0)..setEntry(2, 2, 1.0),
          child: GlowingGlassCard(
            padding: const EdgeInsets.all(24),
            glowColor: _isHovered ? AppColors.neonCyan : Colors.transparent,
            glowBlur: _isHovered ? 25 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Project icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.neonCyan.withAlpha(25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _getProjectIcon(widget.project.category),
                        color: AppColors.neonCyan,
                        size: 28,
                      ),
                    ),
                    const Spacer(),
                    // Rating badge
                    if (widget.project.rating != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
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
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.project.rating!.toString(),
                              style: AppTextStyles.badge.copyWith(
                                color: AppColors.neonCyan,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.project.name,
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: _isHovered ? AppColors.neonCyan : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.project.category,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.neonPurple,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    widget.project.description,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 16),
                // Tech stack
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: widget.project.techStack.take(4).map((tech) {
                    return TechBadge(label: tech);
                  }).toList(),
                ),
                const SizedBox(height: 16),
                // Stats row
                if (widget.project.stats != null)
                  Row(
                    children: [
                      if (widget.project.stats!.containsKey('platforms'))
                        _buildMiniStat(
                          '${widget.project.stats!['platforms']}',
                          'Platforms',
                        ),
                      if (widget.project.stats!.containsKey('retention'))
                        _buildMiniStat(
                          '${(widget.project.stats!['retention'] * 100).toInt()}%',
                          'Retention',
                        ),
                      const Spacer(),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isHovered ? 1 : 0.5,
                        child: Row(
                          children: [
                            Text(
                              'VIEW',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.neonCyan,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.neonCyan,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
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

  Widget _buildMiniStat(String value, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTextStyles.stat.copyWith(fontSize: 16),
          ),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
