import 'package:get/get.dart';
import '../controllers/add_player_controller.dart';
import '../data/repositories/team_repository_impl.dart';
import '../domain/repositories/team_repository.dart';

class AddPlayerBinding extends Bindings {
  @override
  void dependencies() {
    // Repository (only if not already registered)
    if (!Get.isRegistered<TeamRepository>()) {
      Get.lazyPut<TeamRepository>(() => TeamRepositoryImpl(Get.find()));
    }

    Get.lazyPut<AddPlayerController>(() => AddPlayerController(Get.find()));
  }
}
