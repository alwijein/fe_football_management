import 'package:fe_football/app/modules/profil/controllers/profil_controller.dart';
import 'package:fe_football/app/modules/widgets/default_button.dart';
import 'package:fe_football/app/modules/widgets/default_text_field.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/modal_widgets.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends GetView<ProfilController> {
  const ChangePasswordView({super.key});

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
          'Ganti Password',
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
                key: controller.passwordFormKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(SpacingCollections.xxxl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoCard(),
                      const SizedBox(height: SpacingCollections.xl5),
                      _buildFormFields(),
                      const SizedBox(height: SpacingCollections.xl6),
                      _buildSubmitButton(),
                      const SizedBox(height: SpacingCollections.xxxl),
                    ],
                  ),
                ),
              ),
              // Error modal overlay
              if (controller.changePasswordState.value ==
                  ChangePasswordState.error)
                ErrorModal(
                  message: controller.changePasswordError.value,
                  onRetry: () {
                    controller.changePasswordState.value =
                        ChangePasswordState.initial;
                  },
                ),
              // Success modal overlay
              if (controller.changePasswordState.value ==
                  ChangePasswordState.success)
                SuccessModal(
                  title: 'Berhasil!',
                  message: 'Password berhasil diubah',
                  autoClose: true,
                  onClose: () {},
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(SpacingCollections.lg),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.warning.defaultColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorSchemaCollections.warning.defaultColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: ColorSchemaCollections.warning.defaultColor,
            size: 24,
          ),
          const SizedBox(width: SpacingCollections.lg),
          Expanded(
            child: Text(
              'Pastikan password baru minimal 6 karakter dan berbeda dari password lama',
              style: TypographyCollections.primaryTextStyle.copyWith(
                color: ColorSchemaCollections.warning.defaultColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password Lama',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => DefaultTextField(
            controller: controller.oldPasswordController,
            hintText: 'Masukkan password lama',
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
            obscureText: !controller.isOldPasswordVisible.value,
            onTogglePassword: () {
              controller.isOldPasswordVisible.value =
                  !controller.isOldPasswordVisible.value;
            },
            validator: controller.validateOldPassword,
          ),
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Password Baru',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => DefaultTextField(
            controller: controller.newPasswordController,
            hintText: 'Masukkan password baru',
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
            obscureText: !controller.isNewPasswordVisible.value,
            onTogglePassword: () {
              controller.isNewPasswordVisible.value =
                  !controller.isNewPasswordVisible.value;
            },
            validator: controller.validateNewPassword,
          ),
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Konfirmasi Password Baru',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        Obx(
          () => DefaultTextField(
            controller: controller.confirmPasswordController,
            hintText: 'Masukkan ulang password baru',
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
            obscureText: !controller.isConfirmPasswordVisible.value,
            onTogglePassword: () {
              controller.isConfirmPasswordVisible.value =
                  !controller.isConfirmPasswordVisible.value;
            },
            validator: controller.validateConfirmPassword,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Obx(() {
      // Show shimmer when loading
      if (controller.changePasswordState.value == ChangePasswordState.loading) {
        return const SubmitButtonShimmer(height: 56);
      }

      return DefaultButton(
        text: Text(
          'GANTI PASSWORD',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        press: controller.changePassword,
        height: 56,
        borderRadius: 12,
      );
    });
  }
}
