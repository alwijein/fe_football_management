import 'dart:io';
import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/team/data/models/match_report/match_report.dart';
import 'package:fe_football/app/modules/team/data/models/player/player.dart';
import 'package:fe_football/app/modules/team/data/models/player_request/player_request.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/utils/future/future_util.dart';

abstract class TeamRepository {
  // Team methods
  FutureOrError<BaseResponse<List<Team>>> getTeams({
    int page = 1,
    int limit = 10,
  });

  FutureOrError<BaseResponse<List<Team>>> getRegisteredTeams({int limit = 5});
  FutureOrError<BaseResponse<Team>> createTeam({
    required String name,
    required File logoFile,
    required int establishedYear,
    required String address,
    required String city,
  });
  FutureOrError<BaseResponse<Team>> updateTeam(
    int id, {
    required String name,
    required File logoFile,
    required int establishedYear,
    required String address,
    required String city,
  });
  FutureOrError<BaseResponse<void>> deleteTeam(int id);

  // Player methods
  FutureOrError<BaseResponse<List<Player>>> getTeamPlayers(int teamId);
  FutureOrError<BaseResponse<Player>> createPlayer(
    int teamId, {
    required PlayerRequest playerRequest,
  });
  FutureOrError<BaseResponse<Player>> updatePlayer(
    int playerId, {
    required String name,
    required File photoFile,
    required int height,
    required int weight,
    required String position,
    required int jerseyNumber,
  });
  FutureOrError<BaseResponse<void>> deletePlayer(int playerId);

  // Match report methods
  FutureOrError<BaseResponse<List<MatchReport>>> getTeamMatchReports(
    int teamId,
  );
}
