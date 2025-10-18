import 'package:fe_football/app/modules/team/data/models/match_report/match_report.dart';
import 'package:fe_football/app/modules/team/data/models/player/player.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/app/modules/team/domain/repositories/team_repository.dart';
import 'package:fe_football/app/modules/widgets/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TeamDetailState { initial, loading, success, error, empty }

enum DeleteTeamState { initial, loading, success, error }

class TeamDetailController extends GetxController {
  final TeamRepository _teamRepository;

  TeamDetailController(this._teamRepository);

  // Team Detail State - No need to load from API, use argument directly
  final Rxn<Team> team = Rxn<Team>();
  final Rx<TeamDetailState> detailState =
      TeamDetailState.success.obs; // Already success since we have data

  // Players State
  final players = RxList<Player>();
  final Rx<TeamDetailState> playersState = TeamDetailState.initial.obs;
  final RxString playersError = ''.obs;

  // Match Reports State
  final matchReports = RxList<MatchReport>();
  final Rx<TeamDetailState> reportsState = TeamDetailState.initial.obs;
  final RxString reportsError = ''.obs;

  // Delete Team State
  final Rx<DeleteTeamState> deleteTeamState = DeleteTeamState.initial.obs;
  final RxString deleteTeamError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Get Team object from arguments (sent from TeamController)
    final teamArg = Get.arguments as Team?;
    if (teamArg != null) {
      team.value = teamArg;
      detailState.value = TeamDetailState.success;

      // Load additional data
      loadPlayers();
      loadMatchReports();
    } else {
      detailState.value = TeamDetailState.error;
    }
  }

  // Remove loadTeamDetail() method - no longer needed

  Future<void> loadPlayers() async {
    if (team.value == null) return;

    playersState.value = TeamDetailState.loading;

    final result = await _teamRepository.getTeamPlayers(team.value!.id);

    result.fold(
      (error) {
        playersState.value = TeamDetailState.error;
        playersError.value = error.message;
      },
      (response) {
        players.value = response.data ?? [];
        if (players.isEmpty) {
          playersState.value = TeamDetailState.empty;
        } else {
          playersState.value = TeamDetailState.success;
        }
      },
    );
  }

  Future<void> loadMatchReports() async {
    if (team.value == null) return;

    reportsState.value = TeamDetailState.loading;

    final result = await _teamRepository.getTeamMatchReports(team.value!.id);

    result.fold(
      (error) {
        reportsState.value = TeamDetailState.error;
        reportsError.value = error.message;
      },
      (response) {
        matchReports.value = response.data ?? [];
        if (matchReports.isEmpty) {
          reportsState.value = TeamDetailState.empty;
        } else {
          reportsState.value = TeamDetailState.success;
        }
      },
    );
  }

  Future<void> navigateToAddPlayer() async {
    if (team.value == null) return;

    final result = await Get.toNamed(
      '/team/add-player',
      arguments: team.value!.id,
    );
    if (result == true) {
      loadPlayers();
    }
  }

  Future<void> deletePlayer(int playerId) async {
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        backgroundColor: const Color(0xFF1F2137),
        title: const Text(
          'Hapus Pemain',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Apakah Anda yakin ingin menghapus pemain ini?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text(
              'Hapus',
              style: TextStyle(color: Color(0xFFEF4444)),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final result = await _teamRepository.deletePlayer(playerId);

      result.fold(
        (error) => Get.snackbar(
          'Error',
          error.message,
          snackPosition: SnackPosition.BOTTOM,
        ),
        (_) {
          Get.snackbar(
            'Success',
            'Pemain berhasil dihapus',
            backgroundColor: const Color(0xFF10B981),
            colorText: Colors.white,
          );
          loadPlayers();
        },
      );
    }
  }

  Future<void> refreshAll() async {
    // No need to reload team detail - data already in memory
    await Future.wait([loadPlayers(), loadMatchReports()]);
  }

  Future<void> deleteTeam() async {
    if (team.value == null) return;

    deleteTeamState.value = DeleteTeamState.loading;
    deleteTeamError.value = '';

    final result = await _teamRepository.deleteTeam(team.value!.id);

    result.fold(
      (failure) {
        deleteTeamState.value = DeleteTeamState.error;
        deleteTeamError.value = failure.message;
      },
      (_) {
        deleteTeamState.value = DeleteTeamState.success;
        // Navigate back after short delay
        Future.delayed(const Duration(milliseconds: 1000), () {
          Get.back(result: true); // Send result to refresh previous screen
        });
      },
    );
  }
}
