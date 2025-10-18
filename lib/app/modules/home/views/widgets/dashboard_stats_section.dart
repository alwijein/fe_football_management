import 'package:fe_football/app/modules/home/controllers/home_controller.dart';
import 'package:fe_football/app/modules/home/views/widgets/stat_card.dart';
import 'package:fe_football/app/modules/home/views/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/empty_state_widget.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardStatsSection extends StatelessWidget {
  const DashboardStatsSection({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingCollections.xxxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard Stats',
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: SpacingCollections.xl),
          Obx(() {
            final state = controller.statsState.value;

            if (state == HomeDataState.loading) {
              return _buildShimmer();
            }

            if (state == HomeDataState.error) {
              return _buildError(controller.statsError.value);
            }

            if (state == HomeDataState.empty) {
              return _buildEmpty();
            }

            return _buildStats();
          }),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: StatCardShimmer()),
            SizedBox(width: SpacingCollections.xl),
            Expanded(child: StatCardShimmer()),
          ],
        ),
        const SizedBox(height: SpacingCollections.xl),
        const SizedBox(width: double.infinity, child: StatCardShimmer()),
      ],
    );
  }

  Widget _buildError(String message) {
    return Container(
      padding: const EdgeInsets.all(SpacingCollections.xl6),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: ColorSchemaCollections.error.defaultColor,
            ),
            const SizedBox(height: SpacingCollections.lg),
            Text(
              'Gagal memuat statistik',
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: SpacingCollections.sm),
            Text(
              message,
              style: TypographyCollections.subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SpacingCollections.lg),
            ElevatedButton(
              onPressed: controller.loadDashboardStats,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorSchemaCollections.primary.primary,
              ),
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return EmptyStateWidget.card(
      icon: Icons.bar_chart_outlined,
      iconSize: 48,
      title: 'Belum ada data statistik',
      height: 150,
      horizontalMargin: 0,
    );
  }

  Widget _buildStats() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'Total Team',
                value: controller.totalTeams.value.toString(),
                icon: Icons.groups_rounded,
                color: ColorSchemaCollections.primary.primary,
              ),
            ),
            const SizedBox(width: SpacingCollections.xl),
            Expanded(
              child: StatCard(
                title: 'Jadwal',
                value: controller.totalSchedules.value.toString(),
                icon: Icons.calendar_today_rounded,
                color: ColorSchemaCollections.success.defaultColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: SpacingCollections.xl),
        SizedBox(
          width: double.infinity,
          child: StatCard(
            title: 'Pemain',
            value: controller.totalPlayers.value.toString(),
            icon: Icons.person_rounded,
            color: ColorSchemaCollections.warning.defaultColor,
            hasImage: true,
          ),
        ),
      ],
    );
  }
}
