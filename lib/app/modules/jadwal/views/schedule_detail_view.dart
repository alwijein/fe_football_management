import 'package:fe_football/app/modules/widgets/modal_widgets.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/confirmation_dialog.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:fe_football/utils/format_date/format_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/schedule_detail_controller.dart';

class ScheduleDetailView extends GetView<ScheduleDetailController> {
  const ScheduleDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: ColorSchemaCollections.primary.scaffold,
            appBar: AppBar(
              backgroundColor: ColorSchemaCollections.primary.scaffold,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorSchemaCollections.primary.white,
                ),
                onPressed: () => Get.back(),
              ),
              title: Text(
                'Detail Pertandingan',
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: ColorSchemaCollections.error.defaultColor,
                  ),
                  onPressed: () => _showDeleteConfirmation(),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(SpacingCollections.xxxl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMatchInfo(),
                    const SizedBox(height: SpacingCollections.xl6),
                    _buildActionButtons(),
                    const SizedBox(height: SpacingCollections.xl6),
                    _buildScorersList(),
                  ],
                ),
              ),
            ),
          ),
          if (controller.scorersState.value == ScheduleDetailState.error)
            ErrorModal(
              message: controller.scorersError.value,
              onRetry: () => controller.loadScorers(),
            ),
          if (controller.matchResultState.value == MatchResultState.error)
            ErrorModal(
              message: controller.matchResultError.value,
              onRetry: () => controller.submitMatchResult(),
            ),
          if (controller.matchResultState.value == MatchResultState.success)
            SuccessModal(
              title: 'Berhasil!',
              message: 'Hasil pertandingan berhasil disimpan',
              onClose: () {
                controller.matchResultState.value = MatchResultState.initial;
              },
            ),
          if (controller.addScorerState.value == ScorerState.error)
            ErrorModal(
              message: controller.addScorerError.value,
              onRetry: () => controller.submitScorer(),
            ),
          if (controller.addScorerState.value == ScorerState.success)
            SuccessModal(
              title: 'Berhasil!',
              message: 'Pencetak gol berhasil ditambahkan',
              onClose: () {
                controller.addScorerState.value = ScorerState.initial;
              },
            ),
          if (controller.deleteScheduleState.value == DeleteScheduleState.error)
            ErrorModal(
              message: controller.deleteScheduleError.value,
              onRetry: () => controller.deleteSchedule(),
            ),
          if (controller.deleteScheduleState.value ==
              DeleteScheduleState.success)
            SuccessModal(
              title: 'Berhasil!',
              message: 'Jadwal pertandingan berhasil dihapus',
              onClose: () {
                controller.deleteScheduleState.value =
                    DeleteScheduleState.initial;
              },
            ),
        ],
      ),
    );
  }

  Widget _buildMatchInfo() {
    final schedule = controller.schedule.value;
    if (schedule == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(SpacingCollections.xxxl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorSchemaCollections.primary.border,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTeamInfo(schedule.homeTeam.logo, schedule.homeTeam.name),
              Column(
                children: [
                  Text(
                    FormatDate.formatDateBasic(
                      DateTime.parse(schedule.matchDate),
                    ),
                    style: TypographyCollections.whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: SpacingCollections.xs),
                  Text(
                    schedule.matchTime,
                    style: TypographyCollections.primaryTextStyle.copyWith(
                      color: ColorSchemaCollections.primary.muted,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              _buildTeamInfo(schedule.awayTeam.logo, schedule.awayTeam.name),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamInfo(String logo, String name) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: ColorSchemaCollections.primary.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(logo, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        SizedBox(
          width: 100,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: Icons.score,
            label: 'Input Hasil',
            onTap: controller.showMatchResultForm,
          ),
        ),
        const SizedBox(width: SpacingCollections.xl),
        Expanded(
          child: _buildActionButton(
            icon: Icons.person_add,
            label: 'Tambah Scorer',
            onTap: controller.showAddScorerForm,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: SpacingCollections.xl),
        decoration: BoxDecoration(
          color: ColorSchemaCollections.primary.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: SpacingCollections.md),
            Text(
              label,
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScorersList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pencetak Gol',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.xl),
        Obx(() {
          final state = controller.scorersState.value;

          // Loading State
          if (state == ScheduleDetailState.loading) {
            return Column(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: SpacingCollections.lg),
                  child: _buildScorerShimmer(),
                ),
              ),
            );
          }

          // Empty State
          if (state == ScheduleDetailState.empty ||
              controller.scorers.isEmpty) {
            return Container(
              padding: const EdgeInsets.all(SpacingCollections.xl6),
              decoration: BoxDecoration(
                color: ColorSchemaCollections.primary.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: ColorSchemaCollections.primary.border,
                  width: 1,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.sports_soccer_outlined,
                      size: 48,
                      color: ColorSchemaCollections.primary.muted,
                    ),
                    const SizedBox(height: SpacingCollections.lg),
                    Text(
                      'Belum ada pencetak gol',
                      style: TypographyCollections.primaryTextStyle.copyWith(
                        color: ColorSchemaCollections.primary.muted,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // Success State
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.scorers.length,
            itemBuilder: (context, index) {
              final scorer = controller.scorers[index];
              return Container(
                margin: const EdgeInsets.only(bottom: SpacingCollections.lg),
                padding: const EdgeInsets.all(SpacingCollections.xl),
                decoration: BoxDecoration(
                  color: ColorSchemaCollections.primary.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: ColorSchemaCollections.primary.border,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorSchemaCollections.primary.primary
                            .withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          scorer.player.jerseyNumber.toString(),
                          style: TypographyCollections.whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorSchemaCollections.primary.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: SpacingCollections.lg),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            scorer.player.name,
                            style: TypographyCollections.whiteTextStyle
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: SpacingCollections.xs),
                          Text(
                            scorer.player.team?.name ?? '',
                            style: TypographyCollections.primaryTextStyle
                                .copyWith(
                                  color: ColorSchemaCollections.primary.muted,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SpacingCollections.lg,
                        vertical: SpacingCollections.md,
                      ),
                      decoration: BoxDecoration(
                        color: ColorSchemaCollections.success.defaultColor
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${scorer.minute}'",
                        style: TypographyCollections.whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ColorSchemaCollections.success.defaultColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: SpacingCollections.md),
                    IconButton(
                      onPressed: () => controller.deleteScorer(scorer.id),
                      icon: Icon(
                        Icons.delete_outline,
                        color: ColorSchemaCollections.error.defaultColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ],
    );
  }

  Widget _buildScorerShimmer() {
    return Container(
      padding: const EdgeInsets.all(SpacingCollections.xl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorSchemaCollections.primary.border,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF252842),
              shape: BoxShape.circle,
            ),
            child: ShimmerLoading(
              width: 40,
              height: 40,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: SpacingCollections.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoading(
                  width: 120,
                  height: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: SpacingCollections.xs),
                ShimmerLoading(
                  width: 80,
                  height: 12,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
          ShimmerLoading(
            width: 40,
            height: 30,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation() async {
    final confirmed = await ConfirmationDialog.showDelete(
      title: 'Hapus Jadwal',
      message: 'Apakah Anda yakin ingin menghapus jadwal pertandingan ini?',
    );

    if (confirmed == true) {
      controller.deleteSchedule();
    }
  }
}
