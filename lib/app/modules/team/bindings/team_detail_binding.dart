import 'package:fe_football/app/modules/team/data/data_sources/network/team_network.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network_impl.dart';
import 'package:fe_football/app/modules/team/data/repositories/team_repository_impl.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:get/get.dart';
import '../controllers/team_detail_controller.dart';

class TeamDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseNetworking.shared, fenix: true);
    Get.lazyPut<TeamNetwork>(() => TeamNetworkImpl(Get.find<BaseNetworking>()));
    Get.lazyPut<TeamRepository>(
      () => TeamRepositoryImpl(Get.find<TeamNetwork>()),
    );
    Get.lazyPut<TeamDetailController>(
      () => TeamDetailController(Get.find<TeamRepository>()),
    );
  }
}
