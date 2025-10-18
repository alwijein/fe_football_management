import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/app/modules/widgets/default_button.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/add_schedule_controller.dart';

class AddScheduleView extends GetView<AddScheduleController> {
  const AddScheduleView({super.key});

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
          'Tambah Jadwal',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(SpacingCollections.xxxl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTeamSelection(),
                const SizedBox(height: SpacingCollections.xl6),
                _buildDateTimeSelection(context),
                const SizedBox(height: SpacingCollections.xl6),
                _buildSubmitButton(),
                const SizedBox(height: SpacingCollections.xxxl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Home Team',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => _buildTeamSelector(
            selectedTeam: controller.selectedHomeTeam.value,
            hint: 'Pilih home team',
            onTap: () => _showTeamPicker(isHomeTeam: true),
          ),
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Away Team',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => _buildTeamSelector(
            selectedTeam: controller.selectedAwayTeam.value,
            hint: 'Pilih away team',
            onTap: () => _showTeamPicker(isHomeTeam: false),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamSelector({
    required Team? selectedTeam,
    required String hint,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            if (selectedTeam != null) ...[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorSchemaCollections.primary.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(selectedTeam.logo, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: SpacingCollections.lg),
              Expanded(
                child: Text(
                  selectedTeam.name,
                  style: TypographyCollections.whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: Text(
                  hint,
                  style: TypographyCollections.primaryTextStyle.copyWith(
                    color: ColorSchemaCollections.primary.placeholder,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
            Icon(
              Icons.arrow_drop_down,
              color: ColorSchemaCollections.primary.muted,
            ),
          ],
        ),
      ),
    );
  }

  void _showTeamPicker({required bool isHomeTeam}) {
    controller.searchController.clear();
    controller.filteredTeams.value = controller.teams;

    Get.bottomSheet(
      Container(
        height: Get.height * 0.7,
        padding: const EdgeInsets.all(SpacingCollections.xxxl),
        decoration: BoxDecoration(
          color: ColorSchemaCollections.primary.card,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isHomeTeam ? 'Pilih Home Team' : 'Pilih Away Team',
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: SpacingCollections.xl),
            TextField(
              controller: controller.searchController,
              onChanged: controller.filterTeams,
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: 'Cari team...',
                hintStyle: TypographyCollections.primaryTextStyle.copyWith(
                  color: ColorSchemaCollections.primary.placeholder,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorSchemaCollections.primary.muted,
                ),
                filled: true,
                fillColor: ColorSchemaCollections.primary.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: SpacingCollections.xl,
                  vertical: SpacingCollections.lg,
                ),
              ),
            ),
            const SizedBox(height: SpacingCollections.xl),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.filteredTeams.length,
                  itemBuilder: (context, index) {
                    final team = controller.filteredTeams[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: SpacingCollections.md,
                      ),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorSchemaCollections.primary.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(team.logo, fit: BoxFit.cover),
                        ),
                      ),
                      title: Text(
                        team.name,
                        style: TypographyCollections.whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        if (isHomeTeam) {
                          controller.selectHomeTeam(team);
                        } else {
                          controller.selectAwayTeam(team);
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildDateTimeSelection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal Pertandingan',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => GestureDetector(
            onTap: () => controller.pickDate(context),
            child: Container(
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
                  Icon(
                    Icons.calendar_today,
                    color: ColorSchemaCollections.primary.muted,
                    size: 20,
                  ),
                  const SizedBox(width: SpacingCollections.lg),
                  Expanded(
                    child: Text(
                      controller.selectedDate.value != null
                          ? DateFormat(
                              'dd MMM yyyy',
                            ).format(controller.selectedDate.value!)
                          : 'Pilih tanggal',
                      style: controller.selectedDate.value != null
                          ? TypographyCollections.whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )
                          : TypographyCollections.primaryTextStyle.copyWith(
                              color: ColorSchemaCollections.primary.placeholder,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Waktu Pertandingan',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => GestureDetector(
            onTap: () => controller.pickTime(context),
            child: Container(
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
                  Icon(
                    Icons.access_time,
                    color: ColorSchemaCollections.primary.muted,
                    size: 20,
                  ),
                  const SizedBox(width: SpacingCollections.lg),
                  Expanded(
                    child: Text(
                      controller.selectedTime.value != null
                          ? '${controller.selectedTime.value!.hour.toString().padLeft(2, '0')}:${controller.selectedTime.value!.minute.toString().padLeft(2, '0')}'
                          : 'Pilih waktu',
                      style: controller.selectedTime.value != null
                          ? TypographyCollections.whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )
                          : TypographyCollections.primaryTextStyle.copyWith(
                              color: ColorSchemaCollections.primary.placeholder,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Obx(
      () => DefaultButton(
        text: Text(
          'SIMPAN',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        press: controller.submitForm,
        isLoading: controller.isLoading.value,
        height: 56,
        borderRadius: 12,
      ),
    );
  }
}
