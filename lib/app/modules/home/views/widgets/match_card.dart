import 'package:fe_football/app/modules/home/data/models/today_match/today_match.dart';
import 'package:fe_football/app/modules/home/views/widgets/team_info.dart';
import 'package:fe_football/styles/color_schema_collections.dart';
import 'package:fe_football/styles/spacings_collections.dart';
import 'package:fe_football/styles/typography_collections.dart';
import 'package:fe_football/utils/format_date/format_date.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match});

  final TodayMatch match;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(SpacingCollections.xl),
      decoration: BoxDecoration(
        color: ColorSchemaCollections.primary.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorSchemaCollections.primary.border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SpacingCollections.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TeamInfo(logo: match.homeTeam.logo, name: match.homeTeam.name),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      FormatDate.formatDateBasic(
                        DateTime.parse(match.matchDate),
                      ),
                      style: TypographyCollections.whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: SpacingCollections.xs),
                    Text(
                      match.matchTime,
                      style: TypographyCollections.primaryTextStyle.copyWith(
                        color: ColorSchemaCollections.primary.muted,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      match.awayScore != null && match.homeScore != null
                          ? '${match.homeScore} - ${match.awayScore}'
                          : 'VS',
                      style: TypographyCollections.whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              TeamInfo(logo: match.awayTeam.logo, name: match.awayTeam.name),
            ],
          ),
        ],
      ),
    );
  }
}
