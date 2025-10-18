// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatsImpl(
      totalTeams: (json['total_teams'] as num).toInt(),
      totalMatches: (json['total_schedules'] as num).toInt(),
      totalPlayers: (json['total_players'] as num).toInt(),
    );

Map<String, dynamic> _$$DashboardStatsImplToJson(
  _$DashboardStatsImpl instance,
) => <String, dynamic>{
  'total_teams': instance.totalTeams,
  'total_schedules': instance.totalMatches,
  'total_players': instance.totalPlayers,
};
