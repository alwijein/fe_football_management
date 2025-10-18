import 'package:fe_football/app/modules/team/controllers/add_player_controller.dart';
import 'package:fe_football/app/modules/widgets/default_button.dart';
import 'package:fe_football/app/modules/widgets/default_text_field.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/modal_widgets.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlayerView extends GetView<AddPlayerController> {
  const AddPlayerView({super.key});

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
          'Tambah Pemain',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(SpacingCollections.xxxl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormFields(),
                      const SizedBox(height: SpacingCollections.xl6),
                      _buildSubmitButton(),
                      const SizedBox(height: SpacingCollections.xxxl),
                    ],
                  ),
                ),
              ),
              // Error modal overlay
              if (controller.submitState.value == AddPlayerState.error)
                ErrorModal(
                  message: controller.submitError.value,
                  onRetry: () {
                    controller.submitState.value = AddPlayerState.initial;
                  },
                ),
              // Success modal overlay
              if (controller.submitState.value == AddPlayerState.success)
                SuccessModal(
                  title: 'Berhasil!',
                  message: 'Pemain berhasil ditambahkan',
                  autoClose: true,
                  onClose: () {},
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Pemain',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.nameController,
          hintText: 'Contoh: Bambang Pamungkas',
          keyboardType: TextInputType.text,
          validator: controller.validateName,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Tinggi Badan (cm)',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.heightController,
          hintText: 'Contoh: 178',
          keyboardType: TextInputType.number,
          validator: controller.validateHeight,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Berat Badan (kg)',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.weightController,
          hintText: 'Contoh: 75',
          keyboardType: TextInputType.number,
          validator: controller.validateWeight,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Posisi',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => GestureDetector(
            onTap: controller.showPositionPicker,
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
                  Expanded(
                    child: Text(
                      controller.selectedPosition.value.isEmpty
                          ? 'Pilih posisi'
                          : controller.selectedPosition.value,
                      style: controller.selectedPosition.value.isEmpty
                          ? TypographyCollections.primaryTextStyle.copyWith(
                              color: ColorSchemaCollections.primary.placeholder,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )
                          : TypographyCollections.whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: ColorSchemaCollections.primary.muted,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Nomor Punggung',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.jerseyNumberController,
          hintText: 'Contoh: 10',
          keyboardType: TextInputType.number,
          validator: controller.validateJerseyNumber,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Obx(() {
      // Show shimmer when loading
      if (controller.submitState.value == AddPlayerState.loading) {
        return const SubmitButtonShimmer(height: 56);
      }

      return DefaultButton(
        text: Text(
          'SIMPAN',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        press: controller.submitForm,
        height: 56,
        borderRadius: 12,
      );
    });
  }
}
