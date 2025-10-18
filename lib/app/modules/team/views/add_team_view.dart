import 'dart:io';
import 'package:fe_football/app/modules/team/controllers/add_team_controller.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/default_button.dart';
import 'package:fe_football/app/modules/widgets/default_text_field.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTeamView extends GetView<AddTeamController> {
  const AddTeamView({super.key});

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
          'Tambah Team',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(SpacingCollections.xxxl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLogoSection(),
                    const SizedBox(height: SpacingCollections.xl6),
                    _buildFormFields(),
                    const SizedBox(height: SpacingCollections.xl6),
                    _buildSubmitButton(),
                    const SizedBox(height: SpacingCollections.xxxl),
                  ],
                ),
              ),
            ),
            // State Overlays
            Obx(() => _buildStateOverlay()),
          ],
        ),
      ),
    );
  }

  Widget _buildStateOverlay() {
    final state = controller.state.value;

    if (state == AddTeamState.error) {
      return _buildErrorOverlay();
    }

    if (state == AddTeamState.success) {
      return _buildSuccessOverlay();
    }

    return const SizedBox.shrink();
  }

  Widget _buildErrorOverlay() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: SpacingCollections.xxxl,
          ),
          padding: const EdgeInsets.all(SpacingCollections.xl6),
          decoration: BoxDecoration(
            color: ColorSchemaCollections.primary.card,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: ColorSchemaCollections.error.defaultColor,
              ),
              const SizedBox(height: SpacingCollections.xl),
              Text(
                'Gagal Menyimpan',
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: SpacingCollections.md),
              Text(
                controller.errorMessage.value,
                style: TypographyCollections.subtitleTextStyle.copyWith(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SpacingCollections.xl6),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ColorSchemaCollections.primary.white,
                        side: BorderSide(
                          color: ColorSchemaCollections.primary.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: SpacingCollections.lg,
                        ),
                      ),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: SpacingCollections.lg),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.resetState();
                        controller.submitForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorSchemaCollections.primary.primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: SpacingCollections.lg,
                        ),
                      ),
                      child: const Text('Coba Lagi'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessOverlay() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: SpacingCollections.xxxl,
          ),
          padding: const EdgeInsets.all(SpacingCollections.xl6),
          decoration: BoxDecoration(
            color: ColorSchemaCollections.primary.card,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 64,
                color: ColorSchemaCollections.success.defaultColor,
              ),
              const SizedBox(height: SpacingCollections.xl),
              Text(
                'Berhasil!',
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: SpacingCollections.md),
              Text(
                'Team berhasil ditambahkan',
                style: TypographyCollections.subtitleTextStyle.copyWith(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Logo Team',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.xl),
        Center(
          child: Obx(
            () => GestureDetector(
              onTap: controller.showImageSourceDialog,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: ColorSchemaCollections.primary.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ColorSchemaCollections.primary.border,
                    width: 2,
                  ),
                ),
                child: controller.logoFile.value != null
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              File(controller.logoPath.value),
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: controller.removeLogo,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color:
                                      ColorSchemaCollections.error.defaultColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 48,
                            color: ColorSchemaCollections.primary.muted,
                          ),
                          const SizedBox(height: SpacingCollections.md),
                          Text(
                            'Upload Logo',
                            style: TypographyCollections.primaryTextStyle
                                .copyWith(
                                  color: ColorSchemaCollections.primary.muted,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Team',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.nameController,
          hintText: 'Contoh: Persija Jakarta',
          keyboardType: TextInputType.text,
          validator: controller.validateName,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Tahun Berdiri',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.establishedYearController,
          hintText: 'Contoh: 1928',
          keyboardType: TextInputType.number,
          validator: controller.validateYear,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Alamat',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.addressController,
          hintText: 'Contoh: Jl. Gatot Subroto No. 1',
          keyboardType: TextInputType.streetAddress,
          validator: controller.validateAddress,
          maxLines: 2,
          minLines: 2,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Kota',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.cityController,
          hintText: 'Contoh: Jakarta',
          keyboardType: TextInputType.text,
          validator: controller.validateCity,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Obx(() {
      final state = controller.state.value;

      if (state == AddTeamState.loading) {
        return const SubmitButtonShimmer();
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
