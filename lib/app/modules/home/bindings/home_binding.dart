import 'package:fe_football/app/modules/home/data/data_sources/network/home_network.dart';
import 'package:fe_football/app/modules/home/data/data_sources/network/home_network_impl.dart';
import 'package:fe_football/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:fe_football/app/modules/home/domain/repositories/home_repository.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network_impl.dart';
import 'package:fe_football/app/modules/team/data/repositories/team_repository_impl.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // BaseNetworking - Singleton
    Get.lazyPut(() => BaseNetworking.shared, fenix: true);

    // Home Network & Repository
    Get.lazyPut<HomeNetwork>(() => HomeNetworkImpl(Get.find<BaseNetworking>()));
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(Get.find<HomeNetwork>()),
    );

    // Team Network & Repository (for registered teams)
    Get.lazyPut<TeamNetwork>(() => TeamNetworkImpl(Get.find<BaseNetworking>()));
    Get.lazyPut<TeamRepository>(
      () => TeamRepositoryImpl(Get.find<TeamNetwork>()),
    );

    // Controller
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<HomeRepository>(),
        Get.find<TeamRepository>(),
      ),
    );
  }
}
