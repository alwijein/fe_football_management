import 'package:fe_football/app/modules/home/data/models/dashboard_stats/dashboard_stats.dart';
import 'package:fe_football/app/modules/home/data/models/today_match/today_match.dart';
import 'package:fe_football/app/modules/home/domain/repositories/home_repository.dart';
import 'package:fe_football/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/app/routes/app_pages.dart';
import 'package:get/get.dart';

enum HomeDataState { initial, loading, success, error, empty }

class HomeController extends GetxController {
  final HomeRepository _homeRepository;
  final TeamRepository _teamRepository;

  HomeController(this._homeRepository, this._teamRepository);

  NavbarController get navbarController => Get.find<NavbarController>();

  final Rxn<DashboardStats> dashboardStats = Rxn<DashboardStats>();
  final Rx<HomeDataState> statsState = HomeDataState.initial.obs;
  final RxString statsError = ''.obs;

  final todayMatches = RxList<TodayMatch>();
  final Rx<HomeDataState> matchesState = HomeDataState.initial.obs;
  final RxString matchesError = ''.obs;

  final registeredTeams = RxList<Team>();
  final Rx<HomeDataState> teamsState = HomeDataState.initial.obs;
  final RxString teamsError = ''.obs;

  RxInt get totalTeams => (dashboardStats.value?.totalTeams ?? 0).obs;
  RxInt get totalSchedules => (dashboardStats.value?.totalMatches ?? 0).obs;
  RxInt get totalPlayers => (dashboardStats.value?.totalPlayers ?? 0).obs;

  @override
  void onInit() {
    super.onInit();
    loadDashboardStats();
    loadTodayMatches();
    loadRegisteredTeams();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onBottomNavTapped(int index) {
    navbarController.changeTabIndex(index);
  }

  Future<void> loadDashboardStats() async {
    statsState.value = HomeDataState.loading;

    final result = await _homeRepository.getDashboardStats();

    result.fold(
      (error) {
        statsState.value = HomeDataState.error;
        statsError.value = error.message;
      },
      (response) {
        if (response.data != null) {
          dashboardStats.value = response.data;
          statsState.value = HomeDataState.success;
        } else {
          statsState.value = HomeDataState.empty;
        }
      },
    );
  }

  Future<void> loadTodayMatches() async {
    matchesState.value = HomeDataState.loading;

    final result = await _homeRepository.getTodayMatches();

    result.fold(
      (error) {
        matchesState.value = HomeDataState.error;
        matchesError.value = error.message;
      },
      (response) {
        todayMatches.value = response.data ?? [];
        if (todayMatches.isEmpty) {
          matchesState.value = HomeDataState.empty;
        } else {
          matchesState.value = HomeDataState.success;
        }
      },
    );
  }

  Future<void> loadRegisteredTeams() async {
    teamsState.value = HomeDataState.loading;

    final result = await _teamRepository.getRegisteredTeams(limit: 5);

    result.fold(
      (error) {
        teamsState.value = HomeDataState.error;
        teamsError.value = error.message;
      },
      (response) {
        registeredTeams.value = response.data ?? [];
        if (registeredTeams.isEmpty) {
          teamsState.value = HomeDataState.empty;
        } else {
          teamsState.value = HomeDataState.success;
        }
      },
    );
  }

  void navigateToTeamDetails(Team team) {
    Get.toNamed('/team-detail', arguments: team.id);
  }

  void navigateToSeeMoreMatches() {
    navbarController.changeTabIndex(1);
  }

  void navigateToSeeMoreTeams() {
    navbarController.changeTabIndex(2);
  }

  Future<void> refreshAll() async {
    await Future.wait([
      loadDashboardStats(),
      loadTodayMatches(),
      loadRegisteredTeams(),
    ]);
  }
}
