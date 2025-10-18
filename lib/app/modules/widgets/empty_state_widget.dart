import 'package:fe_football/app/modules/widgets/default_button.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';

/// Global reusable empty state widget for consistent empty state UI across the app.
///
/// This widget provides two layouts:
/// - **Centered**: Full-screen centered empty state (default)
/// - **Card**: Empty state with card background container
///
/// ## Design System Compliance
/// - Uses [ColorSchemaCollections] for all colors
/// - Uses [TypographyCollections] for text styles
/// - Uses [SpacingCollections] for spacing consistency
///
/// ## Usage Examples
///
/// ### Basic Centered Empty State
/// ```dart
/// EmptyStateWidget.centered(
///   icon: Icons.sports_soccer_outlined,
///   title: 'Belum ada team',
///   message: 'Tambahkan team baru',
/// )
/// ```
///
/// ### With Action Button
/// ```dart
/// EmptyStateWidget.centered(
///   icon: Icons.calendar_today_outlined,
///   title: 'Belum ada jadwal',
///   message: 'Tambahkan jadwal pertandingan baru',
///   actionLabel: 'Refresh',
///   onAction: () => controller.loadSchedules(refresh: true),
/// )
/// ```
///
/// ### Card Layout (for sections)
/// ```dart
/// EmptyStateWidget.card(
///   icon: Icons.groups_outlined,
///   iconSize: 32,
///   title: 'Belum ada team terdaftar',
///   titleSize: 14,
///   height: 140,
/// )
/// ```
///
/// ### With Custom Icon Color
/// ```dart
/// EmptyStateWidget.centered(
///   icon: Icons.person_off_outlined,
///   iconSize: 80,
///   iconColor: ColorSchemaCollections.error.defaultColor,
///   title: 'Data profil tidak ditemukan',
///   actionLabel: 'Muat Ulang',
///   onAction: controller.loadProfile,
/// )
/// ```
class EmptyStateWidget extends StatelessWidget {
  /// Icon to display in the empty state
  final IconData icon;

  /// Size of the icon (default: 64 for centered, 48 for card)
  final double? iconSize;

  /// Color of the icon (default: ColorSchemaCollections.primary.muted)
  final Color? iconColor;

  /// Main title text
  final String title;

  /// Font size for title (default: 18 for centered, 16 for card)
  final double? titleSize;

  /// Font weight for title (default: FontWeight.w600)
  final FontWeight? titleWeight;

  /// Optional subtitle/message text
  final String? message;

  /// Font size for message (default: 14)
  final double? messageSize;

  /// Optional action button label
  final String? actionLabel;

  /// Callback when action button is pressed
  final VoidCallback? onAction;

  /// Whether to use card layout (with background container)
  final bool isCard;

  /// Height for card layout (default: 200)
  final double? height;

  /// Horizontal margin for card layout (default: SpacingCollections.xxxl)
  final double? horizontalMargin;

  const EmptyStateWidget._({
    super.key,
    required this.icon,
    this.iconSize,
    this.iconColor,
    required this.title,
    this.titleSize,
    this.titleWeight,
    this.message,
    this.messageSize,
    this.actionLabel,
    this.onAction,
    required this.isCard,
    this.height,
    this.horizontalMargin,
  });

  /// Create a centered full-screen empty state
  ///
  /// Best for main list views (team list, schedule list, player list)
  ///
  /// Example:
  /// ```dart
  /// EmptyStateWidget.centered(
  ///   icon: Icons.sports_soccer_outlined,
  ///   title: 'Belum ada team',
  ///   message: 'Tambahkan team baru',
  /// )
  /// ```
  factory EmptyStateWidget.centered({
    Key? key,
    required IconData icon,
    double iconSize = 64,
    Color? iconColor,
    required String title,
    double titleSize = 18,
    FontWeight titleWeight = FontWeight.w600,
    String? message,
    double messageSize = 14,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return EmptyStateWidget._(
      key: key,
      icon: icon,
      iconSize: iconSize,
      iconColor: iconColor,
      title: title,
      titleSize: titleSize,
      titleWeight: titleWeight,
      message: message,
      messageSize: messageSize,
      actionLabel: actionLabel,
      onAction: onAction,
      isCard: false,
    );
  }

  /// Create an empty state with card background
  ///
  /// Best for dashboard sections and smaller empty states
  ///
  /// Example:
  /// ```dart
  /// EmptyStateWidget.card(
  ///   icon: Icons.groups_outlined,
  ///   iconSize: 32,
  ///   title: 'Belum ada team terdaftar',
  ///   titleSize: 14,
  ///   height: 140,
  /// )
  /// ```
  factory EmptyStateWidget.card({
    Key? key,
    required IconData icon,
    double iconSize = 48,
    Color? iconColor,
    required String title,
    double titleSize = 16,
    FontWeight titleWeight = FontWeight.w600,
    String? message,
    double messageSize = 14,
    String? actionLabel,
    VoidCallback? onAction,
    double height = 200,
    double horizontalMargin = SpacingCollections.xxxl,
  }) {
    return EmptyStateWidget._(
      key: key,
      icon: icon,
      iconSize: iconSize,
      iconColor: iconColor,
      title: title,
      titleSize: titleSize,
      titleWeight: titleWeight,
      message: message,
      messageSize: messageSize,
      actionLabel: actionLabel,
      onAction: onAction,
      isCard: true,
      height: height,
      horizontalMargin: horizontalMargin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon
        Icon(
          icon,
          size: iconSize,
          color: iconColor ?? ColorSchemaCollections.primary.muted,
        ),

        // Spacing after icon
        SizedBox(
          height: isCard ? SpacingCollections.lg : SpacingCollections.xl,
        ),

        // Title
        Text(
          title,
          style: TypographyCollections.whiteTextStyle.copyWith(
            fontSize: titleSize,
            fontWeight: titleWeight,
          ),
          textAlign: TextAlign.center,
        ),

        // Message (optional)
        if (message != null) ...[
          const SizedBox(height: SpacingCollections.md),
          Text(
            message!,
            style: TypographyCollections.primaryTextStyle.copyWith(
              color: ColorSchemaCollections.primary.muted,
              fontSize: messageSize,
            ),
            textAlign: TextAlign.center,
          ),
        ],

        // Action Button (optional)
        if (actionLabel != null && onAction != null) ...[
          const SizedBox(height: SpacingCollections.xl6),
          DefaultButton(
            isInfinity: false,
            paddingHorizontal: SpacingCollections.xl6,
            text: Text(
              actionLabel!,
              style: TypographyCollections.primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            press: onAction!,
          ),
        ],
      ],
    );

    // Card layout with container background
    if (isCard) {
      return Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
        padding: const EdgeInsets.all(SpacingCollections.xl),
        decoration: BoxDecoration(
          color: ColorSchemaCollections.primary.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorSchemaCollections.primary.border,
            width: 1,
          ),
        ),
        child: Center(child: content),
      );
    }

    // Centered layout (full screen)
    return Center(child: content);
  }
}
