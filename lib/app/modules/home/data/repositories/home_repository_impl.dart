import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/home/data/data_sources/network/home_network.dart';
import 'package:fe_football/app/modules/home/data/models/dashboard_stats/dashboard_stats.dart';
import 'package:fe_football/app/modules/home/data/models/today_match/today_match.dart';
import 'package:fe_football/app/modules/home/domain/repositories/home_repository.dart';
import 'package:fe_football/utils/future/future_util.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeNetwork _homeNetwork;

  HomeRepositoryImpl(this._homeNetwork);

  @override
  FutureOrError<BaseResponse<DashboardStats>> getDashboardStats() {
    return _homeNetwork.getDashboardStats();
  }

  @override
  FutureOrError<BaseResponse<List<TodayMatch>>> getTodayMatches() {
    return _homeNetwork.getTodayMatches();
  }
}
