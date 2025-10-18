import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/app/routes/app_pages.dart';
import 'package:get/get.dart';

enum TeamDataState { initial, loading, success, error, empty }

class TeamController extends GetxController {
  final TeamRepository _teamRepository;

  TeamController(this._teamRepository);

  // State Management
  final Rx<TeamDataState> teamsState = TeamDataState.initial.obs;
  final RxString teamsError = ''.obs;

  final teams = RxList<Team>();
  final currentPage = 1.obs;
  final hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTeams();
  }

  Future<void> loadTeams({bool refresh = false}) async {
    if (refresh) {
      currentPage.value = 1;
      teams.clear();
    }

    teamsState.value = TeamDataState.loading;

    final result = await _teamRepository.getTeams(
      page: currentPage.value,
      limit: 10,
    );

    result.fold(
      (error) {
        teamsState.value = TeamDataState.error;
        teamsError.value = error.message;
      },
      (response) {
        if (response.data != null) {
          if (refresh) {
            teams.value = response.data!;
          } else {
            teams.addAll(response.data!);
          }

          // Check if has more data
          final pagination = response.meta.pagination;
          if (pagination != null) {
            hasMore.value = pagination.currentPage < pagination.totalPages;
          } else {
            hasMore.value = response.data!.isNotEmpty;
          }

          // Update state
          if (teams.isEmpty) {
            teamsState.value = TeamDataState.empty;
          } else {
            teamsState.value = TeamDataState.success;
          }
        } else {
          teamsState.value = TeamDataState.empty;
        }
      },
    );
  }

  Future<void> loadMore() async {
    if (!hasMore.value || teamsState.value == TeamDataState.loading) return;

    currentPage.value++;
    await loadTeams();
  }

  Future<void> deleteTeam(int teamId) async {
    final result = await _teamRepository.deleteTeam(teamId);

    result.fold(
      (error) {
        teamsError.value = error.message;
      },
      (response) {
        // Refresh list after successful delete
        loadTeams(refresh: true);
      },
    );
  }

  void navigateToAddTeam() {
    Get.toNamed(Routes.ADD_TEAM);
  }

  void navigateToTeamDetail(Team team) async {
    final result = await Get.toNamed(Routes.TEAM_DETAIL, arguments: team);
    // Refresh list if team was deleted
    if (result == true) {
      loadTeams(refresh: true);
    }
  }
}
