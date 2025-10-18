import 'package:fe_football/app/modules/profil/controllers/profil_controller.dart';
import 'package:fe_football/app/modules/widgets/shimmer_loading.dart';
import 'package:fe_football/app/modules/widgets/modal_widgets.dart';
import 'package:fe_football/app/modules/widgets/empty_state_widget.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemaCollections.primary.scaffold,
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              // Main content
              if (controller.profileDataState.value == ProfileDataState.loading)
                _buildLoadingState(),
              if (controller.profileDataState.value == ProfileDataState.success)
                _buildSuccessState(),
              if (controller.profileDataState.value == ProfileDataState.empty)
                _buildEmptyState(),
              // Error modal overlay
              if (controller.profileDataState.value == ProfileDataState.error)
                ErrorModal(
                  message: controller.profileError.value,
                  onRetry: controller.loadProfile,
                ),
              // Logout loading overlay
              if (controller.logoutState.value == LogoutState.loading)
                _buildLogoutLoadingOverlay(),
              // Logout error modal
              if (controller.logoutState.value == LogoutState.error)
                ErrorModal(
                  message: controller.logoutError.value,
                  onRetry: () {
                    controller.logoutState.value = LogoutState.initial;
                  },
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(SpacingCollections.xxxl),
      child: Column(
        children: [
          ProfileHeaderShimmer(),
          SizedBox(height: SpacingCollections.xl5),
          ProfileInfoShimmer(),
          SizedBox(height: SpacingCollections.xl),
          ProfileInfoShimmer(),
          SizedBox(height: SpacingCollections.xl),
          ProfileInfoShimmer(),
          SizedBox(height: SpacingCollections.xl),
          ProfileInfoShimmer(),
        ],
      ),
    );
  }

  Widget _buildSuccessState() {
    final profile = controller.profile.value!;

    return RefreshIndicator(
      onRefresh: controller.loadProfile,
      backgroundColor: ColorSchemaCollections.primary.card,
      color: ColorSchemaCollections.primary.primary,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Header with profile picture
            _buildHeader(profile),
            const SizedBox(height: SpacingCollections.xl5),

            // Profile information cards
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SpacingCollections.xxxl,
              ),
              child: Column(
                children: [
                  // Personal Info Section
                  _buildSectionTitle('Informasi Pribadi'),
                  const SizedBox(height: SpacingCollections.lg),
                  _buildInfoCard(
                    icon: Icons.person_outline,
                    label: 'Nama Lengkap',
                    value: profile.fullName,
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  _buildInfoCard(
                    icon: Icons.alternate_email,
                    label: 'Username',
                    value: profile.username,
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  _buildInfoCard(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: profile.email,
                  ),

                  const SizedBox(height: SpacingCollections.xl5),

                  // Actions Section
                  _buildSectionTitle('Aksi'),
                  const SizedBox(height: SpacingCollections.lg),
                  _buildActionCard(
                    icon: Icons.edit_outlined,
                    title: 'Edit Profil',
                    subtitle: 'Ubah informasi profil Anda',
                    onTap: controller.navigateToEditProfile,
                    color: ColorSchemaCollections.primary.primary,
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  _buildActionCard(
                    icon: Icons.lock_outline,
                    title: 'Ganti Password',
                    subtitle: 'Ubah password akun Anda',
                    onTap: controller.navigateToChangePassword,
                    color: ColorSchemaCollections.warning.defaultColor,
                  ),
                  const SizedBox(height: SpacingCollections.md),
                  _buildActionCard(
                    icon: Icons.logout,
                    title: 'Logout',
                    subtitle: 'Keluar dari akun Anda',
                    onTap: controller.showLogoutDialog,
                    color: ColorSchemaCollections.error.defaultColor,
                  ),

                  const SizedBox(height: SpacingCollections.xl5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget.centered(
      icon: Icons.person_off_outlined,
      iconSize: 80,
      title: 'Data profil tidak ditemukan',
      titleSize: 16,
      titleWeight: FontWeight.w500,
    );
  }

  Widget _buildHeader(profile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(SpacingCollections.xl5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorSchemaCollections.primary.primary,
            ColorSchemaCollections.primary.primary.withOpacity(0.7),
          ],
        ),
      ),
      child: Column(
        children: [
          // Profile Picture
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                profile.photoUrl,
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
              ),
            ),
          ),
          const SizedBox(height: SpacingCollections.xl),

          // Name
          Text(
            profile.fullName,
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SpacingCollections.sm),

          // Username
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingCollections.lg,
              vertical: SpacingCollections.sm,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '@${profile.username}',
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TypographyCollections.whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(SpacingCollections.lg),
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
          Container(
            padding: const EdgeInsets.all(SpacingCollections.md),
            decoration: BoxDecoration(
              color: ColorSchemaCollections.primary.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: ColorSchemaCollections.primary.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: SpacingCollections.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TypographyCollections.primaryTextStyle.copyWith(
                    color: ColorSchemaCollections.primary.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: SpacingCollections.xs),
                Text(
                  value,
                  style: TypographyCollections.whiteTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(SpacingCollections.lg),
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
            Container(
              padding: const EdgeInsets.all(SpacingCollections.md),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: SpacingCollections.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TypographyCollections.whiteTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: SpacingCollections.xs),
                  Text(
                    subtitle,
                    style: TypographyCollections.primaryTextStyle.copyWith(
                      color: ColorSchemaCollections.primary.muted,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: ColorSchemaCollections.primary.muted,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutLoadingOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(SpacingCollections.xl5),
          decoration: BoxDecoration(
            color: ColorSchemaCollections.primary.card,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: ColorSchemaCollections.primary.primary,
              ),
              const SizedBox(height: SpacingCollections.lg),
              Text(
                'Logging out...',
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
