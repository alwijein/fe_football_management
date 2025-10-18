import 'package:flutter/material.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';

/// Reusable error modal overlay widget
/// Shows error message with retry button in center of screen
class ErrorModal extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorModal({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: Container(
        color: Colors.black54,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: SpacingCollections.xxxl,
            ),
            padding: const EdgeInsets.all(SpacingCollections.xxxl),
            decoration: BoxDecoration(
              color: ColorSchemaCollections.primary.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorSchemaCollections.primary.border,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Error icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    color: Color(0xFFEF4444),
                    size: 32,
                  ),
                ),
                const SizedBox(height: SpacingCollections.xl),
                // Error title
                Text(
                  'Oops! Terjadi Kesalahan',
                  style: TypographyCollections.whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: SpacingCollections.md),
                // Error message
                Text(
                  message,
                  style: TypographyCollections.primaryTextStyle.copyWith(
                    color: ColorSchemaCollections.primary.muted,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: SpacingCollections.xxxl),
                // Retry button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onRetry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorSchemaCollections.primary.primary,
                      padding: const EdgeInsets.symmetric(
                        vertical: SpacingCollections.lg,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Coba Lagi',
                      style: TypographyCollections.whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessModal extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onClose;
  final bool autoClose;

  const SuccessModal({
    super.key,
    required this.title,
    required this.message,
    this.onClose,
    this.autoClose = false,
  });

  @override
  Widget build(BuildContext context) {
    if (autoClose && onClose != null) {
      Future.delayed(const Duration(seconds: 2), onClose);
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: SpacingCollections.xxxl,
            ),
            padding: const EdgeInsets.all(SpacingCollections.xxxl),
            decoration: BoxDecoration(
              color: ColorSchemaCollections.primary.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorSchemaCollections.primary.border,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Success icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF10B981),
                    size: 32,
                  ),
                ),
                const SizedBox(height: SpacingCollections.xl),
                // Success title
                Text(
                  title,
                  style: TypographyCollections.whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: SpacingCollections.md),
                // Success message
                Text(
                  message,
                  style: TypographyCollections.primaryTextStyle.copyWith(
                    color: ColorSchemaCollections.primary.muted,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (!autoClose && onClose != null) ...[
                  const SizedBox(height: SpacingCollections.xxxl),
                  // Close button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onClose,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorSchemaCollections.primary.primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: SpacingCollections.lg,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'OK',
                        style: TypographyCollections.whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
