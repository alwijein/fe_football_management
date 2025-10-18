import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/jadwal/data/data_sources/network/schedule_network.dart';
import 'package:fe_football/app/modules/jadwal/data/models/schedule/schedule.dart';
import 'package:fe_football/app/modules/jadwal/data/models/schedule_request/schedule_request.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer/scorer.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer_request/scorer_request.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:fe_football/utils/future/future_util.dart';

class ScheduleNetworkImpl implements ScheduleNetwork {
  final BaseNetworking _baseNetworking;

  ScheduleNetworkImpl(this._baseNetworking);

  @override
  FutureOrError<BaseResponse<List<Schedule>>> getSchedules({
    int page = 1,
    int limit = 10,
  }) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(
        partUrl: 'schedules',
        queryParams: {'page': page, 'limit': limit},
      );

      final responseData = response.data as Map<String, dynamic>;
      final dataList = responseData['data']['items'] != null
          ? (responseData['data']['items'] as List)
                .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
                .toList()
          : <Schedule>[];

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: dataList,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<Schedule>> createSchedule(
    ScheduleRequest request,
  ) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.post(
        partUrl: 'schedules',
        contentType: 'application/json',
        data: request.toJson(),
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Schedule.fromJson(responseData['data'] as Map<String, dynamic>)
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
  FutureOrError<BaseResponse<Schedule>> updateMatchResult(
    int id,
    UpdateResultRequest request,
  ) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.put(
        partUrl: 'schedules/$id/result',
        contentType: 'application/json',
        bodyParams: request.toJson(),
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Schedule.fromJson(responseData['data'] as Map<String, dynamic>)
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
  FutureOrError<BaseResponse<void>> deleteSchedule(int id) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.delete(partUrl: '/schedules/$id');

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
  FutureOrError<BaseResponse<List<Scorer>>> getMatchScorers(int scheduleId) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(
        partUrl: 'schedules/$scheduleId/scorers',
      );

      final responseData = response.data as Map<String, dynamic>;
      final dataList = responseData['data'] != null
          ? (responseData['data'] as List)
                .map((e) => Scorer.fromJson(e as Map<String, dynamic>))
                .toList()
          : <Scorer>[];

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: dataList,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<Scorer>> addScorer(
    int scheduleId,
    ScorerRequest request,
  ) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.post(
        partUrl: 'schedules/$scheduleId/scorers',
        contentType: 'application/json',
        data: request.toJson(),
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Scorer.fromJson(responseData['data'] as Map<String, dynamic>)
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
  FutureOrError<BaseResponse<void>> deleteScorer(int scorerId) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.delete(
        partUrl: 'scorers/$scorerId',
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
}
