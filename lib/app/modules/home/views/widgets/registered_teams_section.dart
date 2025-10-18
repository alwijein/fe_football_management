import 'package:fe_football/app/modules/home/controllers/home_controller.dart';
import 'package:fe_football/app/modules/home/views/widgets/team_card.dart';
import 'package:fe_football/app/modules/home/views/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/empty_state_widget.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteredTeamsSection extends StatelessWidget {
  const RegisteredTeamsSection({super.key, required this.controller});

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
                'Team terdaftar',
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: controller.navigateToSeeMoreTeams,
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
          final state = controller.teamsState.value;

          if (state == HomeDataState.loading) {
            return _buildShimmer();
          }

          if (state == HomeDataState.error) {
            return _buildError(controller.teamsError.value);
          }

          if (state == HomeDataState.empty) {
            return _buildEmpty();
          }

          return _buildTeamsList();
        }),
      ],
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingCollections.xxxl,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TeamCardShimmer();
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return Container(
      height: 140,
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
              size: 32,
              color: ColorSchemaCollections.error.defaultColor,
            ),
            const SizedBox(height: SpacingCollections.md),
            Text(
              'Gagal memuat team',
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: SpacingCollections.sm),
            ElevatedButton(
              onPressed: controller.loadRegisteredTeams,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorSchemaCollections.primary.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingCollections.lg,
                  vertical: SpacingCollections.sm,
                ),
              ),
              child: const Text('Coba Lagi', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return EmptyStateWidget.card(
      icon: Icons.groups_outlined,
      iconSize: 32,
      title: 'Belum ada team terdaftar',
      titleSize: 14,
      height: 140,
    );
  }

  Widget _buildTeamsList() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingCollections.xxxl,
        ),
        itemCount: controller.registeredTeams.length,
        itemBuilder: (context, index) {
          final team = controller.registeredTeams[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index < controller.registeredTeams.length - 1
                  ? SpacingCollections.xl
                  : 0,
            ),
            child: TeamCard(
              team: team,
              onTap: () => controller.navigateToTeamDetails(team),
            ),
          );
        },
      ),
    );
  }
}
