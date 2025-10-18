import 'package:flutter/material.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';

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
