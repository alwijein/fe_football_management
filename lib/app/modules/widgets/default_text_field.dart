import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.obscureText = false,
    this.onTogglePassword,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onTogglePassword;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool enabled;
  final int maxLines;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: SpacingCollections.md),
        ],
        Container(
          decoration: BoxDecoration(
            color: ColorSchemaCollections.primary.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: ColorSchemaCollections.primary.border,
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            onChanged: onChanged,
            enabled: enabled,
            maxLines: maxLines,
            minLines: minLines,
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TypographyCollections.primaryTextStyle.copyWith(
                color: ColorSchemaCollections.primary.placeholder,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: ColorSchemaCollections.primary.muted,
                        size: 20,
                      ),
                      onPressed: onTogglePassword,
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: SpacingCollections.xl,
                vertical: SpacingCollections.xl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
