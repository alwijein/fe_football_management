import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';

/// Reusable confirmation dialog widget
/// Shows confirmation message with cancel and confirm buttons
/// Returns true if confirmed, false if cancelled
class ConfirmationDialog {
  /// Show a confirmation dialog
  ///
  /// Parameters:
  /// - [title]: Dialog title (required)
  /// - [message]: Dialog message/content (required)
  /// - [confirmText]: Text for confirm button (default: 'OK')
  /// - [cancelText]: Text for cancel button (default: 'Batal')
  /// - [confirmColor]: Color for confirm button (default: primary)
  /// - [isDangerous]: If true, uses error color for confirm button (default: false)
  /// - [icon]: Optional icon to show above title
  /// - [iconColor]: Color for the icon
  /// - [barrierDismissible]: Can dismiss by tapping outside (default: true)
  ///
  /// Returns: Future<bool?> - true if confirmed, false if cancelled, null if dismissed
  static Future<bool?> show({
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Batal',
    Color? confirmColor,
    bool isDangerous = false,
    IconData? icon,
    Color? iconColor,
    bool barrierDismissible = true,
  }) {
    return Get.dialog<bool>(
      AlertDialog(
        backgroundColor: ColorSchemaCollections.primary.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(SpacingCollections.xxxl),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon (optional)
            if (icon != null) ...[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: (iconColor ?? ColorSchemaCollections.primary.primary)
                      .withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? ColorSchemaCollections.primary.primary,
                  size: 32,
                ),
              ),
              const SizedBox(height: SpacingCollections.xl),
            ],
            // Title
            Text(
              title,
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SpacingCollections.md),
            // Message
            Text(
              message,
              style: TypographyCollections.primaryTextStyle.copyWith(
                color: ColorSchemaCollections.primary.muted,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SpacingCollections.xxxl),
            // Buttons
            Row(
              children: [
                // Cancel button
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.back(result: false),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: SpacingCollections.lg,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: ColorSchemaCollections.primary.border,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: TypographyCollections.primaryTextStyle.copyWith(
                        color: ColorSchemaCollections.primary.muted,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: SpacingCollections.md),
                // Confirm button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(result: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDangerous
                          ? ColorSchemaCollections.error.defaultColor
                          : (confirmColor ??
                                ColorSchemaCollections.primary.primary),
                      padding: const EdgeInsets.symmetric(
                        vertical: SpacingCollections.lg,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      confirmText,
                      style: TypographyCollections.whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  /// Show a delete confirmation dialog
  /// Pre-configured for delete operations with danger styling
  static Future<bool?> showDelete({
    required String title,
    required String message,
    String confirmText = 'Hapus',
    String cancelText = 'Batal',
  }) {
    return show(
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      isDangerous: true,
      icon: Icons.delete_outline,
      iconColor: ColorSchemaCollections.error.defaultColor,
    );
  }

  /// Show a logout confirmation dialog
  /// Pre-configured for logout operations
  static Future<bool?> showLogout({
    String title = 'Konfirmasi Logout',
    String message = 'Apakah Anda yakin ingin keluar?',
    String confirmText = 'Logout',
    String cancelText = 'Batal',
  }) {
    return show(
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      isDangerous: true,
      icon: Icons.logout,
      iconColor: ColorSchemaCollections.error.defaultColor,
    );
  }

  /// Show a warning confirmation dialog
  /// Pre-configured for warning operations
  static Future<bool?> showWarning({
    required String title,
    required String message,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
  }) {
    return show(
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      icon: Icons.warning_amber_rounded,
      iconColor: ColorSchemaCollections.warning.defaultColor,
    );
  }

  /// Show an info confirmation dialog
  /// Pre-configured for informational confirmations
  static Future<bool?> showInfo({
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Batal',
  }) {
    return show(
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      icon: Icons.info_outline,
      iconColor: ColorSchemaCollections.primary.accent,
    );
  }
}
