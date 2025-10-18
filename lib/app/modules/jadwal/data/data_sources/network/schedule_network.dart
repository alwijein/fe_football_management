import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/jadwal/data/models/schedule/schedule.dart';
import 'package:fe_football/app/modules/jadwal/data/models/schedule_request/schedule_request.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer/scorer.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer_request/scorer_request.dart';
import 'package:fe_football/utils/future/future_util.dart';

abstract class ScheduleNetwork {
  // Schedule endpoints
  FutureOrError<BaseResponse<List<Schedule>>> getSchedules({
    int page = 1,
    int limit = 10,
  });
  FutureOrError<BaseResponse<Schedule>> createSchedule(ScheduleRequest request);
  FutureOrError<BaseResponse<Schedule>> updateMatchResult(
    int id,
    UpdateResultRequest request,
  );
  FutureOrError<BaseResponse<void>> deleteSchedule(int id);

  // Scorer endpoints
  FutureOrError<BaseResponse<List<Scorer>>> getMatchScorers(int scheduleId);
  FutureOrError<BaseResponse<Scorer>> addScorer(
    int scheduleId,
    ScorerRequest request,
  );
  FutureOrError<BaseResponse<void>> deleteScorer(int scorerId);
}
