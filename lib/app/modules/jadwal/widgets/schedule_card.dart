import 'package:fe_football/app/modules/jadwal/data/models/schedule/schedule.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:fe_football/utils/format_date/format_date.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key, required this.schedule, required this.onTap});

  final Schedule schedule;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: SpacingCollections.xl),
        padding: const EdgeInsets.all(SpacingCollections.xl),
        decoration: BoxDecoration(
          color: ColorSchemaCollections.primary.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorSchemaCollections.primary.border,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            _buildTeamInfo(schedule.homeTeam.logo, schedule.homeTeam.name),
            const SizedBox(width: SpacingCollections.xl),
            Expanded(
              child: Column(
                children: [
                  Text(
                    FormatDate.formatDateBasic(
                      DateTime.parse(schedule.matchDate),
                    ),
                    style: TypographyCollections.whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: SpacingCollections.xs),
                  Text(
                    schedule.matchTime,
                    style: TypographyCollections.primaryTextStyle.copyWith(
                      color: ColorSchemaCollections.primary.muted,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(width: SpacingCollections.xl),
            _buildTeamInfo(schedule.awayTeam.logo, schedule.awayTeam.name),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamInfo(String logo, String name) {
    return Column(
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
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
