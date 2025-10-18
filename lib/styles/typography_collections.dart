import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypographyCollections {
  static TextStyle primaryTextStyle = GoogleFonts.openSans(
    color: ColorSchemaCollections.primary.white,
    fontSize: 16,
  );

  static TextStyle subtitleTextStyle = GoogleFonts.openSans(
    color: ColorSchemaCollections.primary.disabled,
    fontSize: 16,
  );

  static TextStyle whiteTextStyle = GoogleFonts.openSans(
    color: ColorSchemaCollections.primary.white,
    fontSize: 16,
  );

  static TextStyle greenTextStyle = GoogleFonts.openSans(
    color: ColorSchemaCollections.success.defaultColor,
    fontSize: 16,
  );

  static TextStyle redTextStyle = GoogleFonts.openSans(
    color: ColorSchemaCollections.error.defaultColor,
    fontSize: 16,
  );
}
