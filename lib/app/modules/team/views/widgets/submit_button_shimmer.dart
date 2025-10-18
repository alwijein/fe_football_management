import 'package:flutter/material.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';

class SubmitButtonShimmer extends StatefulWidget {
  const SubmitButtonShimmer({super.key});

  @override
  State<SubmitButtonShimmer> createState() => _SubmitButtonShimmerState();
}

class _SubmitButtonShimmerState extends State<SubmitButtonShimmer>
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
          width: double.infinity,
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorSchemaCollections.primary.primary.withOpacity(0.5),
                ColorSchemaCollections.primary.primary.withOpacity(0.3),
                ColorSchemaCollections.primary.primary.withOpacity(0.5),
              ],
              stops: [0.0, _animation.value.clamp(0.0, 1.0), 1.0],
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorSchemaCollections.primary.white,
                    ),
                  ),
                ),
                const SizedBox(width: SpacingCollections.md),
                Text(
                  'Menyimpan...',
                  style: TextStyle(
                    color: ColorSchemaCollections.primary.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
