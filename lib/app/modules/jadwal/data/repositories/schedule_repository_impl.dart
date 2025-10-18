import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/jadwal/data/data_sources/network/schedule_network.dart';
import 'package:fe_football/app/modules/jadwal/data/models/schedule/schedule.dart';
import 'package:fe_football/app/modules/jadwal/data/models/schedule_request/schedule_request.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer/scorer.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer_request/scorer_request.dart';
import 'package:fe_football/app/modules/jadwal/domain/repositories/schedule_repository.dart';
import 'package:fe_football/utils/future/future_util.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleNetwork _scheduleNetwork;

  ScheduleRepositoryImpl(this._scheduleNetwork);

  @override
  FutureOrError<BaseResponse<List<Schedule>>> getSchedules({
    int page = 1,
    int limit = 10,
  }) {
    return _scheduleNetwork.getSchedules(page: page, limit: limit);
  }

  @override
  FutureOrError<BaseResponse<Schedule>> createSchedule(
    ScheduleRequest request,
  ) {
    return _scheduleNetwork.createSchedule(request);
  }

  @override
  FutureOrError<BaseResponse<Schedule>> updateMatchResult(
    int id,
    UpdateResultRequest request,
  ) {
    return _scheduleNetwork.updateMatchResult(id, request);
  }

  @override
  FutureOrError<BaseResponse<void>> deleteSchedule(int id) {
    return _scheduleNetwork.deleteSchedule(id);
  }

  @override
  FutureOrError<BaseResponse<List<Scorer>>> getMatchScorers(int scheduleId) {
    return _scheduleNetwork.getMatchScorers(scheduleId);
  }

  @override
  FutureOrError<BaseResponse<Scorer>> addScorer(
    int scheduleId,
    ScorerRequest request,
  ) {
    return _scheduleNetwork.addScorer(scheduleId, request);
  }

  @override
  FutureOrError<BaseResponse<void>> deleteScorer(int scorerId) {
    return _scheduleNetwork.deleteScorer(scorerId);
  }
}
