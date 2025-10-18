import 'package:fe_football/app/modules/widgets/default_button.dart';
import 'package:fe_football/app/modules/widgets/default_text_field.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:fe_football/utils/assets/common_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemaCollections.primary.scaffold,
      body: Stack(
        children: [
          _buildBackgroundSection(),

          // Login form content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingCollections.xxxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: SpacingCollections.xl9),
                    _buildHeaderSection(),
                    const SizedBox(height: SpacingCollections.xl7),
                    _buildFormSection(),
                    const SizedBox(height: SpacingCollections.xxxl),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundSection() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CommonImages.bgLogin),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorSchemaCollections.primary.scaffold.withOpacity(0.1),
              ColorSchemaCollections.primary.scaffold.withOpacity(0.5),
              ColorSchemaCollections.primary.scaffold,
            ],
          ),
        ),
      ),
    );
  }

  /// Build header section with title and subtitle
  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to\nXYZ.',
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: SpacingCollections.lg),
        Text(
          'Enter your email address and password to use\nthe application',
          style: TypographyCollections.primaryTextStyle.copyWith(
            color: ColorSchemaCollections.primary.muted,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  /// Build form section with inputs and button
  Widget _buildFormSection() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username field
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
            hintText: 'alwijein',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username tidak boleh kosong';
              }
              return null;
            },
          ),

          const SizedBox(height: SpacingCollections.xxxl),

          // Password field
          Text(
            'Password',
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: SpacingCollections.md),
          Obx(
            () => DefaultTextField(
              controller: controller.passwordController,
              hintText: '••••••••••',
              isPassword: true,
              obscureText: !controller.isPasswordVisible.value,
              onTogglePassword: controller.togglePasswordVisibility,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
          ),

          const SizedBox(height: SpacingCollections.xl7),

          // Sign in button
          Obx(
            () => DefaultButton(
              text: Text(
                'SIGN IN',
                style: TypographyCollections.whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              press: controller.handleLogin,
              isLoading: controller.isLoading.value,
              height: 56,
              borderRadius: 12,
            ),
          ),
        ],
      ),
    );
  }
}
