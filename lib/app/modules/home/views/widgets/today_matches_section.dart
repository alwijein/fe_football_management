import 'package:fe_football/app/modules/home/controllers/home_controller.dart';
import 'package:fe_football/app/modules/home/views/widgets/match_card.dart';
import 'package:fe_football/app/modules/home/views/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/empty_state_widget.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayMatchesSection extends StatelessWidget {
  const TodayMatchesSection({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingCollections.xxxl,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jadwal Hari Ini',
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: controller.navigateToSeeMoreMatches,
                child: Text(
                  'Lihat Semua',
                  style: TypographyCollections.primaryTextStyle.copyWith(
                    color: ColorSchemaCollections.primary.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: SpacingCollections.xl),
        Obx(() {
          final state = controller.matchesState.value;

          if (state == HomeDataState.loading) {
            return _buildShimmer();
          }

          if (state == HomeDataState.error) {
            return _buildError(controller.matchesError.value);
          }

          if (state == HomeDataState.empty) {
            return _buildEmpty();
          }

          return _buildMatchesList();
        }),
      ],
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingCollections.xxxl,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const SizedBox(width: 300, child: MatchCardShimmer());
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: SpacingCollections.xxxl),
      padding: const EdgeInsets.all(SpacingCollections.xl),
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
              'Gagal memuat jadwal',
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
              onPressed: controller.loadTodayMatches,
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
      icon: Icons.calendar_today_outlined,
      iconSize: 48,
      title: 'Tidak ada jadwal hari ini',
      message: 'Belum ada pertandingan yang dijadwalkan untuk hari ini',
      messageSize: 12,
      height: 200,
    );
  }

  Widget _buildMatchesList() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingCollections.xxxl,
        ),
        itemCount: controller.todayMatches.length,
        itemBuilder: (context, index) {
          final match = controller.todayMatches[index];
          return Padding(
            padding: const EdgeInsets.only(right: SpacingCollections.xl),
            child: MatchCard(match: match),
          );
        },
      ),
    );
  }
}
