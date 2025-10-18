import 'package:flutter/material.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';

/// Base shimmer loading widget with animated gradient effect
/// Can be used as a standalone shimmer or as base for specific shimmer components
class ShimmerLoading extends StatefulWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const ShimmerLoading({super.key, this.width, this.height, this.borderRadius});

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorSchemaCollections.primary.card,
                ColorSchemaCollections.primary.card.withOpacity(0.5),
                ColorSchemaCollections.primary.card,
              ],
              stops: [0.0, _animation.value.clamp(0.0, 1.0), 1.0],
            ),
          ),
        );
      },
    );
  }
}

/// Shimmer for match card in horizontal list
class MatchCardShimmer extends StatelessWidget {
  const MatchCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SpacingCollections.xl),
      margin: const EdgeInsets.only(right: SpacingCollections.xl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerLoading(width: 100, height: 16),
          const SizedBox(height: SpacingCollections.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ShimmerLoading(
                    width: 60,
                    height: 60,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  const ShimmerLoading(width: 80, height: 14),
                ],
              ),
              const ShimmerLoading(width: 60, height: 30),
              Column(
                children: [
                  ShimmerLoading(
                    width: 60,
                    height: 60,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  const ShimmerLoading(width: 80, height: 14),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Shimmer for team card in horizontal list
class TeamCardShimmer extends StatelessWidget {
  const TeamCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: SpacingCollections.xl),
      padding: const EdgeInsets.all(SpacingCollections.lg),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ShimmerLoading(
            width: 80,
            height: 80,
            borderRadius: BorderRadius.circular(40),
          ),
          const SizedBox(height: SpacingCollections.md),
          const ShimmerLoading(width: 90, height: 14),
          const SizedBox(height: SpacingCollections.sm),
          const ShimmerLoading(width: 70, height: 12),
        ],
      ),
    );
  }
}

/// Shimmer for statistics card
class StatCardShimmer extends StatelessWidget {
  const StatCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SpacingCollections.xl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoading(width: 40, height: 40),
          SizedBox(height: SpacingCollections.lg),
          ShimmerLoading(width: 60, height: 24),
          SizedBox(height: SpacingCollections.sm),
          ShimmerLoading(width: 80, height: 14),
        ],
      ),
    );
  }
}

/// Shimmer for team list item (vertical list)
class TeamListItemShimmer extends StatelessWidget {
  const TeamListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SpacingCollections.md),
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingCollections.xl,
        vertical: SpacingCollections.lg,
      ),
      child: Row(
        children: [
          // Logo shimmer
          ShimmerLoading(
            width: 50,
            height: 50,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(width: SpacingCollections.xl),
          // Text shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerLoading(width: 150, height: 16),
                const SizedBox(height: SpacingCollections.sm),
                ShimmerLoading(
                  width: 100,
                  height: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
          // Button shimmer
          ShimmerLoading(
            width: 70,
            height: 38,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
    );
  }
}

/// Shimmer for player card
class PlayerCardShimmer extends StatelessWidget {
  const PlayerCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SpacingCollections.xl),
      padding: const EdgeInsets.all(SpacingCollections.xl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorSchemaCollections.primary.border,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Player photo shimmer
          ShimmerLoading(
            width: 60,
            height: 60,
            borderRadius: BorderRadius.circular(30),
          ),
          const SizedBox(width: SpacingCollections.xl),
          // Player info shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerLoading(width: 120, height: 16),
                const SizedBox(height: SpacingCollections.sm),
                const ShimmerLoading(width: 80, height: 14),
                const SizedBox(height: SpacingCollections.sm),
                Row(
                  children: [
                    const ShimmerLoading(width: 60, height: 12),
                    const SizedBox(width: SpacingCollections.md),
                    const ShimmerLoading(width: 60, height: 12),
                  ],
                ),
              ],
            ),
          ),
          // Jersey number shimmer
          ShimmerLoading(
            width: 40,
            height: 40,
            borderRadius: BorderRadius.circular(20),
          ),
        ],
      ),
    );
  }
}

/// Shimmer for match report card
class MatchReportCardShimmer extends StatelessWidget {
  const MatchReportCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SpacingCollections.xl),
      padding: const EdgeInsets.all(SpacingCollections.xl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorSchemaCollections.primary.border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date shimmer
          const ShimmerLoading(width: 150, height: 14),
          const SizedBox(height: SpacingCollections.xl),
          // Match teams shimmer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ShimmerLoading(
                    width: 50,
                    height: 50,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  const ShimmerLoading(width: 80, height: 14),
                ],
              ),
              ShimmerLoading(
                width: 60,
                height: 30,
                borderRadius: BorderRadius.circular(8),
              ),
              Column(
                children: [
                  ShimmerLoading(
                    width: 50,
                    height: 50,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  const ShimmerLoading(width: 80, height: 14),
                ],
              ),
            ],
          ),
          const SizedBox(height: SpacingCollections.xl),
          const Divider(color: Color(0xFF2D3142)),
          const SizedBox(height: SpacingCollections.xl),
          // Info rows shimmer
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: SpacingCollections.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ShimmerLoading(width: 120, height: 12),
                  ShimmerLoading(
                    width: 100,
                    height: 12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Shimmer for submit button
class SubmitButtonShimmer extends StatelessWidget {
  final double? width;
  final double height;

  const SubmitButtonShimmer({super.key, this.width, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      width: width ?? double.infinity,
      height: height,
      borderRadius: BorderRadius.circular(12),
    );
  }
}

/// Shimmer for schedule card (vertical list)
class ScheduleCardShimmer extends StatelessWidget {
  const ScheduleCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SpacingCollections.xl),
      padding: const EdgeInsets.all(SpacingCollections.xl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorSchemaCollections.primary.border,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Home team shimmer
          Column(
            children: [
              ShimmerLoading(
                width: 50,
                height: 50,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(height: SpacingCollections.md),
              const ShimmerLoading(width: 70, height: 14),
            ],
          ),
          const SizedBox(width: SpacingCollections.xl),
          // Date and time shimmer
          Expanded(
            child: Column(
              children: [
                ShimmerLoading(
                  width: 100,
                  height: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: SpacingCollections.xs),
                ShimmerLoading(
                  width: 60,
                  height: 12,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: SpacingCollections.md),
                ShimmerLoading(
                  width: 80,
                  height: 24,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
          ),
          const SizedBox(width: SpacingCollections.xl),
          // Away team shimmer
          Column(
            children: [
              ShimmerLoading(
                width: 50,
                height: 50,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(height: SpacingCollections.md),
              const ShimmerLoading(width: 70, height: 14),
            ],
          ),
        ],
      ),
    );
  }
}

/// Shimmer for profile header (avatar + name)
class ProfileHeaderShimmer extends StatelessWidget {
  const ProfileHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerLoading(
          width: 120,
          height: 120,
          borderRadius: BorderRadius.circular(60),
        ),
        const SizedBox(height: SpacingCollections.xl),
        const ShimmerLoading(width: 200, height: 24),
        const SizedBox(height: SpacingCollections.xs),
        const ShimmerLoading(width: 120, height: 16),
      ],
    );
  }
}

/// Shimmer for profile info row
class ProfileInfoShimmer extends StatelessWidget {
  const ProfileInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShimmerLoading(
          width: 40,
          height: 40,
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(width: SpacingCollections.md),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(width: 80, height: 12),
              SizedBox(height: 4),
              ShimmerLoading(width: 150, height: 14),
            ],
          ),
        ),
      ],
    );
  }
}
