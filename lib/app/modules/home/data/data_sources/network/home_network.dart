import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/home/data/models/dashboard_stats/dashboard_stats.dart';
import 'package:fe_football/app/modules/home/data/models/today_match/today_match.dart';
import 'package:fe_football/utils/future/future_util.dart';

abstract class HomeNetwork {
  FutureOrError<BaseResponse<DashboardStats>> getDashboardStats();
  FutureOrError<BaseResponse<List<TodayMatch>>> getTodayMatches();
}
