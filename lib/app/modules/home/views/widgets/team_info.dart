import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';

class TeamInfo extends StatelessWidget {
  const TeamInfo({super.key, required this.logo, required this.name});

  final String logo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: ColorSchemaCollections.primary.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(logo, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: SpacingCollections.md),
        SizedBox(
          width: 80,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TypographyCollections.whiteTextStyle.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
