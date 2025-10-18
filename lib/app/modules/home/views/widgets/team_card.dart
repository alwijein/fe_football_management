import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({super.key, required this.team, required this.onTap});

  final Team team;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        padding: const EdgeInsets.all(SpacingCollections.lg),
        decoration: BoxDecoration(
          color: ColorSchemaCollections.primary.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorSchemaCollections.primary.border,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ColorSchemaCollections.primary.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(team.logo, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: SpacingCollections.md),
            Text(
              team.name,
              textAlign: TextAlign.center,
              style: TypographyCollections.whiteTextStyle.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
