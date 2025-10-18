import 'package:fe_football/app/modules/home/controllers/home_controller.dart';
import 'package:fe_football/app/modules/home/data/data_sources/network/home_network.dart';
import 'package:fe_football/app/modules/home/data/data_sources/network/home_network_impl.dart';
import 'package:fe_football/app/modules/home/domain/repositories/home_repository.dart';
import 'package:fe_football/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:fe_football/app/modules/jadwal/controllers/jadwal_controller.dart';
import 'package:fe_football/app/modules/jadwal/data/data_sources/network/schedule_network.dart';
import 'package:fe_football/app/modules/jadwal/data/data_sources/network/schedule_network_impl.dart';
import 'package:fe_football/app/modules/jadwal/domain/repositories/schedule_repository.dart';
import 'package:fe_football/app/modules/jadwal/data/repositories/schedule_repository_impl.dart';
import 'package:fe_football/app/modules/profil/controllers/profil_controller.dart';
import 'package:fe_football/app/modules/profil/data/data_sources/network/profile_network.dart';
import 'package:fe_football/app/modules/profil/data/data_sources/network/profile_network_impl.dart';
import 'package:fe_football/app/modules/profil/domain/repositories/profile_repository.dart';
import 'package:fe_football/app/modules/profil/data/repositories/profile_repository_impl.dart';
import 'package:fe_football/app/modules/team/controllers/team_controller.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network_impl.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/app/modules/team/data/repositories/team_repository_impl.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseNetworking.shared, fenix: true);

    Get.lazyPut<TeamNetwork>(() => TeamNetworkImpl(Get.find<BaseNetworking>()));
    Get.lazyPut<TeamRepository>(
      () => TeamRepositoryImpl(Get.find<TeamNetwork>()),
    );

    Get.lazyPut<HomeNetwork>(() => HomeNetworkImpl(Get.find<BaseNetworking>()));
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(Get.find<HomeNetwork>()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<HomeRepository>(),
        Get.find<TeamRepository>(),
      ),
    );

    Get.lazyPut<ScheduleNetwork>(
      () => ScheduleNetworkImpl(Get.find<BaseNetworking>()),
    );
    Get.lazyPut<ScheduleRepository>(
      () => ScheduleRepositoryImpl(Get.find<ScheduleNetwork>()),
    );
    Get.lazyPut<JadwalController>(
      () => JadwalController(Get.find<ScheduleRepository>()),
    );

    Get.lazyPut<TeamController>(
      () => TeamController(Get.find<TeamRepository>()),
    );

    // Profile dependencies
    Get.lazyPut<ProfileNetwork>(
      () => ProfileNetworkImpl(Get.find<BaseNetworking>()),
    );
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(Get.find<ProfileNetwork>()),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(Get.find<ProfileRepository>()),
    );

    Get.lazyPut<NavbarController>(() => NavbarController());
  }
}
