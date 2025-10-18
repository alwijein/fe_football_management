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

class EditProfileView extends GetView<ProfilController> {
  const EditProfileView({super.key});

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
          'Edit Profil',
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
                      _buildPhotoSection(),
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
              if (controller.updateProfileState.value ==
                  UpdateProfileState.error)
                ErrorModal(
                  message: controller.updateProfileError.value,
                  onRetry: () {
                    controller.updateProfileState.value =
                        UpdateProfileState.initial;
                  },
                ),
              // Success modal overlay
              if (controller.updateProfileState.value ==
                  UpdateProfileState.success)
                SuccessModal(
                  title: 'Berhasil!',
                  message: 'Profil berhasil diperbarui',
                  autoClose: true,
                  onClose: () {},
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPhotoSection() {
    return Center(
      child: Column(
        children: [
          Text(
            'Foto Profil',
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: SpacingCollections.lg),
          Obx(
            () => GestureDetector(
              onTap: controller.showImageSourcePicker,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorSchemaCollections.primary.primary,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipOval(child: _buildProfileImage()),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorSchemaCollections.primary.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorSchemaCollections.primary.white,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: ColorSchemaCollections.primary.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: SpacingCollections.md),
          Text(
            'Tap untuk mengubah foto',
            style: TypographyCollections.primaryTextStyle.copyWith(
              color: ColorSchemaCollections.primary.muted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    if (controller.selectedPhotoFile.value != null) {
      return Image.file(
        controller.selectedPhotoFile.value!,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      );
    } else if (controller.profile.value != null) {
      return Image.network(
        controller.profile.value!.photoUrl,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: 120,
            height: 120,
            color: ColorSchemaCollections.primary.card,
            child: const Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 120,
            height: 120,
            color: ColorSchemaCollections.primary.card,
            child: Icon(
              Icons.person,
              size: 60,
              color: ColorSchemaCollections.primary.muted,
            ),
          );
        },
      );
    } else {
      return Container(
        width: 120,
        height: 120,
        color: ColorSchemaCollections.primary.card,
        child: Icon(
          Icons.person,
          size: 60,
          color: ColorSchemaCollections.primary.muted,
        ),
      );
    }
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Lengkap',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.fullNameController,
          hintText: 'Masukkan nama lengkap',
          keyboardType: TextInputType.text,
          validator: controller.validateFullName,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Username',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.usernameController,
          hintText: 'Masukkan username',
          keyboardType: TextInputType.text,
          validator: controller.validateUsername,
        ),
        const SizedBox(height: SpacingCollections.xxxl),
        Text(
          'Email',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        DefaultTextField(
          controller: controller.emailController,
          hintText: 'Masukkan email',
          keyboardType: TextInputType.emailAddress,
          validator: controller.validateEmail,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Obx(() {
      // Show shimmer when loading
      if (controller.updateProfileState.value == UpdateProfileState.loading) {
        return const SubmitButtonShimmer(height: 56);
      }

      return DefaultButton(
        text: Text(
          'SIMPAN PERUBAHAN',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        press: controller.updateProfile,
        height: 56,
        borderRadius: 12,
      );
    });
  }
}
