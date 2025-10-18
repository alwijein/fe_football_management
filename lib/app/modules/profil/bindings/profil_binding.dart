import 'package:get/get.dart';
import '../controllers/profil_controller.dart';
import '../data/data_sources/network/profile_network.dart';
import '../data/data_sources/network/profile_network_impl.dart';
import '../data/repositories/profile_repository_impl.dart';
import '../domain/repositories/profile_repository.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    // Network
    Get.lazyPut<ProfileNetwork>(() => ProfileNetworkImpl(Get.find()));

    // Repository
    Get.lazyPut<ProfileRepository>(() => ProfileRepositoryImpl(Get.find()));

    // Controller
    Get.lazyPut<ProfilController>(() => ProfilController(Get.find()));
  }
}
