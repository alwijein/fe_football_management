import 'package:fe_football/app/modules/jadwal/controllers/jadwal_controller.dart';
import 'package:fe_football/app/modules/jadwal/widgets/schedule_card.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/modal_widgets.dart';
import 'package:fe_football/app/modules/widgets/empty_state_widget.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalView extends GetView<JadwalController> {
  const JadwalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemaCollections.primary.scaffold,
      appBar: AppBar(
        backgroundColor: ColorSchemaCollections.primary.scaffold,
        title: Text(
          'Jadwal Pertandingan',
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

              if (controller.schedulesState.value == ScheduleDataState.error)
                ErrorModal(
                  message: controller.schedulesError.value,
                  onRetry: () => controller.loadSchedules(refresh: true),
                ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToAddSchedule,
        backgroundColor: ColorSchemaCollections.primary.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildContent() {
    switch (controller.schedulesState.value) {
      case ScheduleDataState.loading:
        return _buildLoadingState();
      case ScheduleDataState.empty:
        return _buildEmptyState();
      case ScheduleDataState.success:
        return _buildScheduleList();
      case ScheduleDataState.initial:
      case ScheduleDataState.error:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: SpacingCollections.xxxl),
      itemCount: 5,
      itemBuilder: (context, index) => const ScheduleCardShimmer(),
    );
  }

  Widget _buildScheduleList() {
    return RefreshIndicator(
      onRefresh: () => controller.loadSchedules(refresh: true),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingCollections.xxxl,
        ),
        itemCount: controller.schedules.length,
        itemBuilder: (context, index) {
          final schedule = controller.schedules[index];
          return ScheduleCard(
            schedule: schedule,
            onTap: () => controller.navigateToScheduleDetail(schedule),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget.centered(
      icon: Icons.calendar_today_outlined,
      title: 'Belum ada jadwal',
      message: 'Tambahkan jadwal pertandingan baru',
      actionLabel: 'Refresh',
      onAction: () => controller.loadSchedules(refresh: true),
    );
  }
}
