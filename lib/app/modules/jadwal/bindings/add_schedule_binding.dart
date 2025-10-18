import 'package:fe_football/app/modules/jadwal/data/data_sources/network/schedule_network.dart';
import 'package:fe_football/app/modules/jadwal/data/data_sources/network/schedule_network_impl.dart';
import 'package:fe_football/app/modules/jadwal/data/repositories/schedule_repository_impl.dart';
import 'package:fe_football/app/modules/jadwal/domain/repositories/schedule_repository.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network.dart';
import 'package:fe_football/app/modules/team/data/data_sources/network/team_network_impl.dart';
import 'package:fe_football/app/modules/team/data/repositories/team_repository_impl.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:get/get.dart';
import '../controllers/add_schedule_controller.dart';

class AddScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseNetworking.shared, fenix: true);
    Get.lazyPut<ScheduleNetwork>(
      () => ScheduleNetworkImpl(Get.find<BaseNetworking>()),
    );
    Get.lazyPut<ScheduleRepository>(
      () => ScheduleRepositoryImpl(Get.find<ScheduleNetwork>()),
    );
    Get.lazyPut<TeamNetwork>(() => TeamNetworkImpl(Get.find<BaseNetworking>()));
    Get.lazyPut<TeamRepository>(
      () => TeamRepositoryImpl(Get.find<TeamNetwork>()),
    );
    Get.lazyPut<AddScheduleController>(
      () => AddScheduleController(
        Get.find<ScheduleRepository>(),
        Get.find<TeamRepository>(),
      ),
    );
  }
}
