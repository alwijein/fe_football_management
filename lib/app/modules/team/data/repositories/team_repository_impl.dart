import 'dart:io';
import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network.dart';
import 'package:fe_football/app/modules/team/data/models/match_report/match_report.dart';
import 'package:fe_football/app/modules/team/data/models/player/player.dart';
import 'package:fe_football/app/modules/team/data/models/player_request/player_request.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/utils/future/future_util.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamNetwork _teamNetwork;

  TeamRepositoryImpl(this._teamNetwork);

  @override
  FutureOrError<BaseResponse<List<Team>>> getTeams({
    int page = 1,
    int limit = 10,
  }) {
    return _teamNetwork.getTeams(page: page, limit: limit);
  }

  @override
  FutureOrError<BaseResponse<List<Team>>> getRegisteredTeams({int limit = 5}) {
    return _teamNetwork.getRegisteredTeams(limit: limit);
  }

  @override
  FutureOrError<BaseResponse<Team>> createTeam({
    required String name,
    required File logoFile,
    required int establishedYear,
    required String address,
    required String city,
  }) {
    return _teamNetwork.createTeam(
      name: name,
      logoFile: logoFile,
      establishedYear: establishedYear,
      address: address,
      city: city,
    );
  }

  @override
  FutureOrError<BaseResponse<Team>> updateTeam(
    int id, {
    required String name,
    required File logoFile,
    required int establishedYear,
    required String address,
    required String city,
  }) {
    return _teamNetwork.updateTeam(
      id,
      name: name,
      logoFile: logoFile,
      establishedYear: establishedYear,
      address: address,
      city: city,
    );
  }

  @override
  FutureOrError<BaseResponse<void>> deleteTeam(int id) {
    return _teamNetwork.deleteTeam(id);
  }

  @override
  FutureOrError<BaseResponse<List<Player>>> getTeamPlayers(int teamId) {
    return _teamNetwork.getTeamPlayers(teamId);
  }

  @override
  FutureOrError<BaseResponse<Player>> createPlayer(
    int teamId, {
    required PlayerRequest playerRequest,
  }) {
    return _teamNetwork.createPlayer(teamId, playerRequest: playerRequest);
  }

  @override
  FutureOrError<BaseResponse<Player>> updatePlayer(
    int playerId, {
    required String name,
    required File photoFile,
    required int height,
    required int weight,
    required String position,
    required int jerseyNumber,
  }) {
    return _teamNetwork.updatePlayer(
      playerId,
      name: name,
      photoFile: photoFile,
      height: height,
      weight: weight,
      position: position,
      jerseyNumber: jerseyNumber,
    );
  }

  @override
  FutureOrError<BaseResponse<void>> deletePlayer(int playerId) {
    return _teamNetwork.deletePlayer(playerId);
  }

  @override
  FutureOrError<BaseResponse<List<MatchReport>>> getTeamMatchReports(
    int teamId,
  ) {
    return _teamNetwork.getTeamMatchReports(teamId);
  }
}
