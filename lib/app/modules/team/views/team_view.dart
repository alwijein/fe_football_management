import 'package:fe_football/app/modules/team/controllers/team_controller.dart';
import 'package:fe_football/app/modules/widgets/default_button.dart';
import 'package:fe_football/app/modules/widgets/empty_state_widget.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/modal_widgets.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamView extends GetView<TeamController> {
  const TeamView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemaCollections.primary.scaffold,
      appBar: AppBar(
        backgroundColor: ColorSchemaCollections.primary.scaffold,
        title: Text(
          'Team',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              Column(children: [Expanded(child: _buildContent())]),
              // Error modal overlay
              if (controller.teamsState.value == TeamDataState.error)
                ErrorModal(
                  message: controller.teamsError.value,
                  onRetry: () => controller.loadTeams(refresh: true),
                ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToAddTeam,
        backgroundColor: ColorSchemaCollections.primary.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildContent() {
    switch (controller.teamsState.value) {
      case TeamDataState.loading:
        return _buildLoadingState();
      case TeamDataState.empty:
        return _buildEmptyState();
      case TeamDataState.success:
        return _buildTeamsList();
      case TeamDataState.initial:
      case TeamDataState.error:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.symmetric(vertical: SpacingCollections.md),
      itemBuilder: (context, index) => const TeamListItemShimmer(),
    );
  }

  Widget _buildTeamsList() {
    return RefreshIndicator(
      onRefresh: () => controller.loadTeams(refresh: true),
      child: ListView.builder(
        itemCount: controller.teams.length,
        padding: const EdgeInsets.symmetric(vertical: SpacingCollections.md),
        itemBuilder: (context, index) {
          final team = controller.teams[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: SpacingCollections.md),
            child: ListTile(
              title: Text(
                team.name,
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                team.city,
                style: TypographyCollections.primaryTextStyle.copyWith(
                  color: ColorSchemaCollections.primary.muted,
                  fontSize: 14,
                ),
              ),
              leading: Image.network(team.logo),
              onTap: () => controller.navigateToTeamDetail(team),
              trailing: DefaultButton(
                borderRadius: 8,
                isInfinity: false,
                height: 38,
                text: Text(
                  'Detail',
                  style: TypographyCollections.primaryTextStyle,
                ),
                press: () => controller.navigateToTeamDetail(team),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget.centered(
      icon: Icons.sports_soccer_outlined,
      title: 'Belum ada team',
      message: 'Tambahkan team baru',
      actionLabel: 'Refresh',
      onAction: () => controller.loadTeams(refresh: true),
    );
  }
}
