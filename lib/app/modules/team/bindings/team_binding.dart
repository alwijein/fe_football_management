import 'package:fe_football/app/modules/team/controllers/add_team_controller.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network_impl.dart';
import 'package:fe_football/app/modules/team/data/repositories/team_repository_impl.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:get/get.dart';

import '../controllers/team_controller.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    // BaseNetworking - Singleton
    Get.lazyPut(() => BaseNetworking.shared, fenix: true);

    // Team Network & Repository
    Get.lazyPut<TeamNetwork>(() => TeamNetworkImpl(Get.find<BaseNetworking>()));
    Get.lazyPut<TeamRepository>(
      () => TeamRepositoryImpl(Get.find<TeamNetwork>()),
    );

    // Controller
    Get.lazyPut<TeamController>(
      () => TeamController(Get.find<TeamRepository>()),
    );

    Get.lazyPut(() => AddTeamController(Get.find<TeamRepository>()));
  }
}
