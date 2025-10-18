import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
    this.isInfinity = true,
    this.height = 52,
    this.color,
    this.isLoading = false,
    this.isActive = true,
    this.borderWidth = 1,
    this.borderRadius,
    this.borderSide,
    this.loadingColor,
    this.paddingHorizontal,
  });

  final Widget text;
  final Function() press;
  final bool isInfinity;
  final double height;
  final Color? color;
  final bool isLoading;
  final bool isActive;
  final double? borderWidth;
  final double? borderRadius;
  final BorderSide? borderSide;
  final Color? loadingColor;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle activeButtonStyle = TextButton.styleFrom(
      backgroundColor: color ?? ColorSchemaCollections.primary.primary,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 50),
        side:
            borderSide ??
            BorderSide(
              color: color != null
                  ? color!
                  : ColorSchemaCollections.primary.primary,
              width: borderWidth!,
            ),
      ),
    );
    final ButtonStyle deactiveButtonStyle = TextButton.styleFrom(
      backgroundColor: ColorSchemaCollections.primary.disabled,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 24),
      shadowColor: ColorSchemaCollections.primary.muted,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
    return isActive
        ? activeButton(activeButtonStyle)
        : deactiveButton(deactiveButtonStyle);
  }

  SizedBox activeButton(ButtonStyle btnStyle) {
    return SizedBox(
      width: isInfinity ? double.infinity : null,
      height: height,
      child: TextButton(
        style: btnStyle,
        onPressed: press,
        child: isLoading
            ? CircularProgressIndicator(
                color: loadingColor ?? ColorSchemaCollections.primary.white,
              )
            : text,
      ),
    );
  }

  SizedBox deactiveButton(ButtonStyle btnStyle) {
    return SizedBox(
      width: isInfinity ? double.infinity : null,
      height: height,
      child: TextButton(style: btnStyle, onPressed: () {}, child: text),
    );
  }
}
