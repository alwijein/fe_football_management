import 'package:fe_football/app/modules/team/controllers/team_detail_controller.dart';
import 'package:fe_football/app/modules/team/data/models/match_report/match_report.dart';
import 'package:fe_football/app/modules/team/data/models/player/player.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/modal_widgets.dart';
import 'package:fe_football/app/modules/widgets/confirmation_dialog.dart';
import 'package:fe_football/app/modules/widgets/empty_state_widget.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:fe_football/utils/assets/common_images.dart';
import 'package:fe_football/utils/format_date/format_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamDetailView extends GetView<TeamDetailController> {
  const TeamDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Team Detail',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
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
        child: Obx(() {
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: controller.refreshAll,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMatchReportsSection(),
                      _buildPlayersSection(),
                    ],
                  ),
                ),
              ),
              // Error modals for each section
              if (controller.reportsState.value == TeamDetailState.error)
                ErrorModal(
                  message: controller.reportsError.value,
                  onRetry: controller.loadMatchReports,
                ),
              if (controller.playersState.value == TeamDetailState.error)
                ErrorModal(
                  message: controller.playersError.value,
                  onRetry: controller.loadPlayers,
                ),
              // Delete Team Error Modal
              if (controller.deleteTeamState.value == DeleteTeamState.error)
                ErrorModal(
                  message: controller.deleteTeamError.value,
                  onRetry: () => controller.deleteTeam(),
                ),
              // Delete Team Success Modal
              if (controller.deleteTeamState.value == DeleteTeamState.success)
                SuccessModal(
                  title: 'Berhasil!',
                  message: 'Team berhasil dihapus',
                  onClose: () {
                    controller.deleteTeamState.value = DeleteTeamState.initial;
                  },
                ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToAddPlayer,
        backgroundColor: ColorSchemaCollections.primary.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildMatchReportsSection() {
    return Padding(
      padding: const EdgeInsets.all(SpacingCollections.xxxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Laporan Pertandingan',
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SpacingCollections.xl),
          Obx(() {
            switch (controller.reportsState.value) {
              case TeamDetailState.loading:
                return Column(
                  children: List.generate(
                    2,
                    (index) => const MatchReportCardShimmer(),
                  ),
                );
              case TeamDetailState.empty:
                return _buildEmptyMatchReports();
              case TeamDetailState.success:
                return Column(
                  children: controller.matchReports
                      .map((match) => _buildMatchReportCard(match))
                      .toList(),
                );
              case TeamDetailState.initial:
              case TeamDetailState.error:
                return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }

  Widget _buildEmptyMatchReports() {
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
      child: Center(
        child: Text(
          'Belum ada laporan pertandingan',
          style: TypographyCollections.primaryTextStyle.copyWith(
            color: ColorSchemaCollections.primary.muted,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildMatchReportCard(MatchReport match) {
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
          // Match Date & Time
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 14,
                color: ColorSchemaCollections.primary.muted,
              ),
              const SizedBox(width: SpacingCollections.sm),
              Text(
                '${FormatDate.formatDateBasic(DateTime.parse(match.matchDate))} • ${match.matchTime}',
                style: TypographyCollections.primaryTextStyle.copyWith(
                  color: ColorSchemaCollections.primary.muted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: SpacingCollections.xl),

          // Teams & Score
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Team
              Expanded(
                child: Column(
                  children: [
                    Image.network(match.homeTeam.logo, width: 50, height: 50),
                    const SizedBox(height: SpacingCollections.md),
                    Text(
                      match.homeTeam.name,
                      style: TypographyCollections.whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Score
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingCollections.xl,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpacingCollections.xl,
                    vertical: SpacingCollections.md,
                  ),
                  decoration: BoxDecoration(
                    color: ColorSchemaCollections.primary.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    match.homeScore != null && match.awayScore != null
                        ? '${match.homeScore} - ${match.awayScore}'
                        : 'VS',
                    style: TypographyCollections.whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Away Team
              Expanded(
                child: Column(
                  children: [
                    Image.network(match.awayTeam.logo, width: 50, height: 50),
                    const SizedBox(height: SpacingCollections.md),
                    Text(
                      match.awayTeam.name,
                      style: TypographyCollections.whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: SpacingCollections.xl),
          const Divider(color: Color(0xFF2D3142)),
          const SizedBox(height: SpacingCollections.xl),

          // Match Status
          _buildInfoRow(
            'Status Pertandingan',
            match.matchResult,
            match.matchResult == 'Tim Home Menang'
                ? const Color(0xFF10B981)
                : match.matchResult == 'Tim Away Menang'
                ? const Color(0xFFEF4444)
                : const Color(0xFFF59E0B),
          ),
          const SizedBox(height: SpacingCollections.md),

          // Top Scorer
          _buildInfoRow(
            'Pencetak Gol Terbanyak',
            '${match.topScorer?.playerName ?? ''} (${match.topScorer?.goalCount ?? '0'} gol)',
            ColorSchemaCollections.primary.primary,
          ),
          const SizedBox(height: SpacingCollections.md),

          // Home Team Total Wins
          _buildInfoRow(
            'Total Kemenangan ${match.homeTeam.name}',
            '${match.homeTeamTotalWins} kemenangan',
            ColorSchemaCollections.primary.white,
          ),
          const SizedBox(height: SpacingCollections.md),

          // Away Team Total Wins
          _buildInfoRow(
            'Total Kemenangan ${match.awayTeam.name}',
            '${match.awayTeamTotalWins} kemenangan',
            ColorSchemaCollections.primary.white,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color valueColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TypographyCollections.primaryTextStyle.copyWith(
              color: ColorSchemaCollections.primary.muted,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: SpacingCollections.md),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget _buildPlayersSection() {
    return Padding(
      padding: const EdgeInsets.all(SpacingCollections.xxxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Pemain',
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SpacingCollections.xl),
          Obx(() {
            switch (controller.playersState.value) {
              case TeamDetailState.loading:
                return Column(
                  children: List.generate(
                    3,
                    (index) => const PlayerCardShimmer(),
                  ),
                );
              case TeamDetailState.empty:
                return _buildEmptyState();
              case TeamDetailState.success:
                return Column(
                  children: controller.players.asMap().entries.map((entry) {
                    final index = entry.key;
                    final player = entry.value;
                    return _buildPlayerCard(player, index);
                  }).toList(),
                );
              case TeamDetailState.initial:
              case TeamDetailState.error:
                return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(Player player, int index) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorSchemaCollections.primary.primary.withOpacity(
                    0.2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    player.jerseyNumber.toString(),
                    style: TypographyCollections.whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorSchemaCollections.primary.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: SpacingCollections.xl),
              SizedBox(
                width: 100,
                child: Text(
                  player.name,
                  style: TypographyCollections.whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: SpacingCollections.xs),
              Text(
                player.position,
                style: TypographyCollections.primaryTextStyle.copyWith(
                  color: ColorSchemaCollections.primary.muted,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorSchemaCollections.primary.surface.withOpacity(0.5),
                  ColorSchemaCollections.primary.card,
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildPlayerImage(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerImage() {
    return Image.asset(CommonImages.playersNotFound, fit: BoxFit.cover);
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget.centered(
      icon: Icons.people_outline,
      title: 'Belum ada pemain',
      message: 'Tambahkan pemain baru',
    );
  }

  void _showDeleteConfirmation() async {
    final confirmed = await ConfirmationDialog.showDelete(
      title: 'Hapus Team',
      message:
          'Apakah Anda yakin ingin menghapus team ini? Semua data pemain dan laporan pertandingan akan ikut terhapus.',
    );

    if (confirmed == true) {
      controller.deleteTeam();
    }
  }
}
