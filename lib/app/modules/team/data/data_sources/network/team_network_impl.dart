import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network.dart';
import 'package:fe_football/app/modules/team/data/models/match_report/match_report.dart';
import 'package:fe_football/app/modules/team/data/models/player/player.dart';
import 'package:fe_football/app/modules/team/data/models/player_request/player_request.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:fe_football/utils/future/future_util.dart';

class TeamNetworkImpl implements TeamNetwork {
  final BaseNetworking _baseNetworking;

  TeamNetworkImpl(this._baseNetworking);

  @override
  FutureOrError<BaseResponse<List<Team>>> getTeams({
    int page = 1,
    int limit = 10,
  }) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(
        partUrl: '/teams',
        queryParams: {'page': page, 'limit': limit},
      );

      final responseData = response.data as Map<String, dynamic>;
      final dataList = responseData['data']['items'] != null
          ? (responseData['data']['items'] as List)
                .map((e) => Team.fromJson(e as Map<String, dynamic>))
                .toList()
          : <Team>[];

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: dataList,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<List<Team>>> getRegisteredTeams({int limit = 5}) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(
        partUrl: '/teams/registered',
        queryParams: {'limit': limit},
      );

      final responseData = response.data as Map<String, dynamic>;
      final dataList = responseData['data'] != null
          ? (responseData['data'] as List)
                .map((e) => Team.fromJson(e as Map<String, dynamic>))
                .toList()
          : <Team>[];

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: dataList,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<Team>> createTeam({
    required String name,
    required File logoFile,
    required int establishedYear,
    required String address,
    required String city,
  }) {
    return FutureUtil.callOrError(() async {
      final formData = FormData.fromMap({
        'name': name,
        'logo': await MultipartFile.fromFile(
          logoFile.path,
          filename: logoFile.path.split('/').last,
        ),
        'established_year': establishedYear,
        'address': address,
        'city': city,
      });

      final response = await _baseNetworking.post(
        partUrl: '/teams',
        contentType: 'multipart/form-data',
        data: formData,
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Team.fromJson(responseData['data'] as Map<String, dynamic>)
          : null;

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: data,
      );
    });
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
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.put(
        partUrl: '/teams/$id',
        contentType: 'application/json',
        bodyParams: {
          'name': name,
          'logo': await MultipartFile.fromFile(
            logoFile.path,
            filename: logoFile.path.split('/').last,
          ),
          'established_year': establishedYear,
          'address': address,
          'city': city,
        },
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Team.fromJson(responseData['data'] as Map<String, dynamic>)
          : null;

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: data,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<void>> deleteTeam(int id) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.delete(partUrl: '/teams/$id');

      final responseData = response.data as Map<String, dynamic>;
      return BaseResponse<void>(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: null,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<List<Player>>> getTeamPlayers(int teamId) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(
        partUrl: '/teams/$teamId/players',
      );

      final responseData = response.data as Map<String, dynamic>;
      final dataList = responseData['data'] != null
          ? (responseData['data'] as List)
                .map((e) => Player.fromJson(e as Map<String, dynamic>))
                .toList()
          : <Player>[];

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: dataList,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<Player>> createPlayer(
    int teamId, {
    required PlayerRequest playerRequest,
  }) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.post(
        partUrl: 'teams/$teamId/players',
        contentType: 'application/json',
        data: playerRequest.toJson(),
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Player.fromJson(responseData['data'] as Map<String, dynamic>)
          : null;

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: data,
      );
    });
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
    return FutureUtil.callOrError(() async {
      final formData = FormData.fromMap({
        'name': name,
        'photo': await MultipartFile.fromFile(
          photoFile.path,
          filename: photoFile.path.split(Platform.pathSeparator).last,
        ),
        'height': height,
        'weight': weight,
        'position': position,
        'jersey_number': jerseyNumber,
      });

      final response = await _baseNetworking.put(
        partUrl: '/players/$playerId',
        contentType: 'multipart/form-data',
        data: formData,
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Player.fromJson(responseData['data'] as Map<String, dynamic>)
          : null;

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: data,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<void>> deletePlayer(int playerId) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.delete(
        partUrl: '/players/$playerId',
      );

      final responseData = response.data as Map<String, dynamic>;
      return BaseResponse<void>(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: null,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<List<MatchReport>>> getTeamMatchReports(
    int teamId,
  ) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(
        partUrl: 'teams/$teamId/match-reports',
      );

      final responseData = response.data as Map<String, dynamic>;
      final dataList = responseData['data'] != null
          ? (responseData['data'] as List)
                .map((e) => MatchReport.fromJson(e as Map<String, dynamic>))
                .toList()
          : <MatchReport>[];

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: dataList,
      );
    });
  }
}
