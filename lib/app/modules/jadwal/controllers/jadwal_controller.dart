import 'package:fe_football/app/modules/jadwal/data/models/schedule/schedule.dart';
import 'package:fe_football/app/modules/jadwal/domain/repositories/schedule_repository.dart';
import 'package:fe_football/app/routes/app_pages.dart';
import 'package:get/get.dart';

enum ScheduleDataState { initial, loading, success, error, empty }

class JadwalController extends GetxController {
  final ScheduleRepository _scheduleRepository;

  JadwalController(this._scheduleRepository);

  // State Management
  final Rx<ScheduleDataState> schedulesState = ScheduleDataState.initial.obs;
  final RxString schedulesError = ''.obs;

  final schedules = RxList<Schedule>();
  final currentPage = 1.obs;
  final hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadSchedules();
  }

  Future<void> loadSchedules({bool refresh = false}) async {
    if (refresh) {
      currentPage.value = 1;
      schedules.clear();
    }

    schedulesState.value = ScheduleDataState.loading;

    final result = await _scheduleRepository.getSchedules(
      page: currentPage.value,
      limit: 10,
    );

    result.fold(
      (error) {
        schedulesState.value = ScheduleDataState.error;
        schedulesError.value = error.message;
      },
      (response) {
        if (response.data != null) {
          if (refresh) {
            schedules.value = response.data!;
          } else {
            schedules.addAll(response.data!);
          }

          final pagination = response.meta.pagination;
          if (pagination != null) {
            hasMore.value = pagination.currentPage < pagination.totalPages;
          } else {
            hasMore.value = response.data!.isNotEmpty;
          }

          // Update state
          if (schedules.isEmpty) {
            schedulesState.value = ScheduleDataState.empty;
          } else {
            schedulesState.value = ScheduleDataState.success;
          }
        } else {
          schedulesState.value = ScheduleDataState.empty;
        }
      },
    );
  }

  Future<void> loadMore() async {
    if (!hasMore.value || schedulesState.value == ScheduleDataState.loading) {
      return;
    }

    currentPage.value++;
    await loadSchedules();
  }

  Future<void> deleteSchedule(int scheduleId) async {
    final result = await _scheduleRepository.deleteSchedule(scheduleId);

    result.fold(
      (error) {
        schedulesError.value = error.message;
      },
      (response) {
        // Refresh list after successful delete
        loadSchedules(refresh: true);
      },
    );
  }

  void navigateToAddSchedule() {
    Get.toNamed(Routes.ADD_SCHEDULE);
  }

  void navigateToScheduleDetail(Schedule schedule) async {
    final result = await Get.toNamed(
      Routes.SCHEDULE_DETAIL,
      arguments: schedule,
    );

    if (result == true) {
      loadSchedules(refresh: true);
    }
  }
}
