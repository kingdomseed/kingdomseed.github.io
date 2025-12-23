import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/certification.dart';
import '../../providers/portfolio_provider.dart';
import '../widgets/common/glass_card.dart';

/// Certifications grid with 3D flip cards
class CertificationsScreen extends ConsumerStatefulWidget {
  const CertificationsScreen({super.key});

  @override
  ConsumerState<CertificationsScreen> createState() =>
      _CertificationsScreenState();
}

class _CertificationsScreenState extends ConsumerState<CertificationsScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final certifications = ref.watch(certificationsProvider);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 600;

    // Get unique categories
    final categories = [
      'All',
      ...certifications.map((c) => c.category).toSet()
    ];

    // Filter certifications
    final filteredCerts = _selectedCategory == 'All'
        ? certifications
        : certifications
            .where((c) => c.category == _selectedCategory)
            .toList();

    final crossAxisCount = isDesktop ? 4 : (isTablet ? 2 : 1);

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
                        'CERTIFICATIONS',
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
                        'Professional credentials & achievements',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                    ],
                  ),
                ),
              ),

              // Category Filter
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.asMap().entries.map((entry) {
                        final index = entry.key;
                        final category = entry.value;
                        final isSelected = category == _selectedCategory;
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _CategoryChip(
                            label: category,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                              });
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
                      }).toList(),
                    ),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              // Certifications Grid
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                ),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: isDesktop ? 0.85 : 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _FlipCard(
                        certification: filteredCerts[index],
                      )
                          .animate()
                          .fadeIn(
                            delay:
                                Duration(milliseconds: 400 + (index * 100)),
                            duration: 400.ms,
                          )
                          .slideY(
                            begin: 0.15,
                            end: 0,
                            delay:
                                Duration(milliseconds: 400 + (index * 100)),
                            duration: 400.ms,
                          );
                    },
                    childCount: filteredCerts.length,
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
}

class _CategoryChip extends StatefulWidget {
  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<_CategoryChip> {
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
                ? AppColors.neonPurple.withAlpha(25)
                : (_isHovered
                    ? AppColors.darkSurfaceElevated
                    : AppColors.darkSurface),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.neonPurple
                  : AppColors.glassBorder(),
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: widget.isSelected
                ? AppColors.neonGlow(
                    color: AppColors.neonPurple,
                    blurRadius: 15,
                    opacity: 0.2,
                  )
                : null,
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.labelMedium.copyWith(
              color: widget.isSelected
                  ? AppColors.neonPurple
                  : AppColors.textSecondary,
              fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

/// 3D Flip card that shows certification front and back
class _FlipCard extends StatefulWidget {
  const _FlipCard({required this.certification});

  final Certification certification;

  @override
  State<_FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<_FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
    _controller.addListener(() {
      if (_controller.value >= 0.5 && _showFront) {
        setState(() => _showFront = false);
      } else if (_controller.value < 0.5 && !_showFront) {
        setState(() => _showFront = true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * math.pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..rotateY(angle);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: _showFront
                ? _buildFront()
                : Transform(
                    transform: Matrix4.identity()..rotateY(math.pi),
                    alignment: Alignment.center,
                    child: _buildBack(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    final cert = widget.certification;
    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderColor: cert.isValid
          ? AppColors.neonPurple.withAlpha(76)
          : AppColors.glassBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _getCategoryColor(cert.category).withAlpha(25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getCategoryIcon(cert.category),
                  color: _getCategoryColor(cert.category),
                  size: 24,
                ),
              ),
              const Spacer(),
              if (cert.isValid)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
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
                    'VALID',
                    style: AppTextStyles.badge.copyWith(
                      color: AppColors.neonCyan,
                      fontSize: 9,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cert.name,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  cert.issuer,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: _getCategoryColor(cert.category),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Text(
                  cert.category,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.glassBorder(), height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TAP TO FLIP',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 9,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.rotate_90_degrees_ccw,
                size: 12,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBack() {
    final cert = widget.certification;
    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderColor: AppColors.neonPurple.withAlpha(76),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DETAILS',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow('Issued', cert.formattedIssueDate),
          const SizedBox(height: 12),
          if (cert.expiryDate != null)
            _buildDetailRow(
              'Expires',
              cert.formattedExpiryDate ?? 'Never',
            ),
          if (cert.credentialId != null) ...[
            const SizedBox(height: 12),
            _buildDetailRow('Credential ID', cert.credentialId!),
          ],
          const Spacer(),
          if (cert.credentialUrl != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.neonPurple.withAlpha(25),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.neonPurple.withAlpha(76),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified,
                    size: 14,
                    color: AppColors.neonPurple,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'VERIFY CREDENTIAL',
                    style: AppTextStyles.badge.copyWith(
                      color: AppColors.neonPurple,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TAP TO FLIP BACK',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 9,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.rotate_90_degrees_cw,
                size: 12,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textMuted,
              fontSize: 11,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Cloud':
        return AppColors.neonCyan;
      case 'Mobile':
        return AppColors.neonPurple;
      case 'Dev Tools':
        return const Color(0xFF00E676); // Green accent
      case 'Adobe Creative Suite':
        return const Color(0xFFFF6D00); // Orange accent
      default:
        return AppColors.neonCyan;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Cloud':
        return Icons.cloud;
      case 'Mobile':
        return Icons.phone_android;
      case 'Dev Tools':
        return Icons.build;
      case 'Adobe Creative Suite':
        return Icons.brush;
      default:
        return Icons.verified;
    }
  }
}

