import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/home/data/data_sources/network/home_network.dart';
import 'package:fe_football/app/modules/home/data/models/dashboard_stats/dashboard_stats.dart';
import 'package:fe_football/app/modules/home/data/models/today_match/today_match.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:fe_football/utils/future/future_util.dart';

class HomeNetworkImpl implements HomeNetwork {
  final BaseNetworking _baseNetworking;

  HomeNetworkImpl(this._baseNetworking);

  @override
  FutureOrError<BaseResponse<DashboardStats>> getDashboardStats() {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(partUrl: '/dashboard/stats');

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? DashboardStats.fromJson(
              responseData['data'] as Map<String, dynamic>,
            )
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
  FutureOrError<BaseResponse<List<TodayMatch>>> getTodayMatches() {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(partUrl: '/matches/today');

      final responseData = response.data as Map<String, dynamic>;
      final dataList = responseData['data'] != null
          ? (responseData['data'] as List)
                .map((e) => TodayMatch.fromJson(e as Map<String, dynamic>))
                .toList()
          : <TodayMatch>[];

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: dataList,
      );
    });
  }
}
