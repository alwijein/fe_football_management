import 'package:fe_football/app/modules/home/views/widgets/dashboard_stats_section.dart';
import 'package:fe_football/app/modules/home/views/widgets/registered_teams_section.dart';
import 'package:fe_football/app/modules/home/views/widgets/today_matches_section.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemaCollections.primary.scaffold,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.onInit();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: SpacingCollections.xxxl),
                _buildHeader(),
                const SizedBox(height: SpacingCollections.xl6),
                TodayMatchesSection(controller: controller),
                const SizedBox(height: SpacingCollections.xl6),
                RegisteredTeamsSection(controller: controller),
                const SizedBox(height: SpacingCollections.xl6),
                DashboardStatsSection(controller: controller),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingCollections.xxxl),
      child: Text(
        'Selamat Datang',
        style: TypographyCollections.whiteTextStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
